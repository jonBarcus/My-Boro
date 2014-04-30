class WeatherController < ApplicationController
  def location
    weather = Weather.new("Brooklyn")
    response = {
      current_temp: weather.current_temp,
      current_weather: weather.current_weather,
      current_wind: weather.wind,
      current_humidity: weather.humidity
    }

    render :json => { currentTemp: response[current_temp],
                      currentWeather: response[current_weather],
                      currentHumidity: response[current_humidity],
                      currentWind: response[current_wind] }

  end
end
