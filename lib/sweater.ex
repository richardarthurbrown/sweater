defmodule Sweater do
  alias ExOwm

  @options [
    cnt: 3,
    units: :imperial
  ]

  def get_weather(city) do
    ExOwm.get_five_day_forecast([%{city: city}], @options)
    |> handle_response()
  end

  defp handle_response([ok: response]) do
    response
  end

  defp handle_response([{:error, message, response}]) do
    "Error getting weather"
  end

end
