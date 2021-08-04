defmodule Sweater do

  alias ExOwm

  @options [
    cnt: 1,
    units: :imperial
  ]

  @weather_config %{
    recommendations: [
      %{name: "Sunglasses", waterproof: false, min_temp: 75, max_temp: 100},
      %{name: "Rain Jacket", waterproof: true, min_temp: 62, max_temp: 80},
      %{name: "Sweater", waterproof: false, min_temp: 50, max_temp: 68},
      %{name: "Light Coat", waterproof: true, min_temp: 35, max_temp: 55},
      %{name: "Comfortable Shoes", waterproof: false, min_temp: 25, max_temp: 90},
      %{name: "Heavy Coat", waterproof: true, min_temp: 0, max_temp: 40},
      %{name: "Snow Boots", waterproof: true, min_temp: 0, max_temp: 35}
    ]
  }

  @spec get_weather(String.t()) :: list(String.t()) | String.t()
  def get_weather(city) when is_binary(city) do
    ExOwm.get_sixteen_day_forecast([%{city: city}], @options)
    |> handle_response()
  end

  def get_weather(_), do: "Please input your city surrounded by quotation marks."

  @spec handle_response(map()) :: map() | String.t()
  defp handle_response(ok: %{"list" => forecasts}) do
    for forecast <- forecasts do
      parse_forecast(forecast)
    end
    |> List.flatten()
  end

  defp handle_response([{:error, _message, _response}]) do
    "Error getting weather data, please try again."
  end

  @spec parse_forecast(map()) :: any()
  defp parse_forecast(%{"temp" => %{"day" => temp}, "weather" => [%{"id" => weather_id}]}) do
    is_precipitation?(weather_id)
    |> get_recommendations(temp)
    |> format_recommendations()
  end

  @spec is_precipitation?(integer()) :: boolean()
  defp is_precipitation?(id) do
    if id < 700 do
      true
    else
      false
    end
  end

  @spec get_recommendations(boolean(), integer()) :: list(map())
  defp get_recommendations(precip, temp) do
    recs = @weather_config.recommendations

    Enum.filter(recs, fn rec ->
      rec.waterproof == precip and rec.max_temp > temp and temp > rec.min_temp
    end)
    |> List.flatten()
  end

  @spec format_recommendations(list(map())) :: list(String.t())
  defp format_recommendations(recommendations) do
    for recommendation <- recommendations do
      recommendation.name
    end
  end
end
