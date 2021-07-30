defmodule Sweater do
  alias ExOwm

  def get_weather(city) do
    ExOwm.get_current_weather([%{city: city}])
  end

end
