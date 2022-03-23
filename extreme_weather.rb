# The file has a class to find extreme weather
# A read_file class is also required to run read file method
#
# frozen_string_literal: true

require 'date'
require_relative 'read_file'
class ExtremeWeather
  include Readfile
  def initialize(year)
    @year = year
    @most_humid_day = []
    @lowest_temperature_day = []
    @highest_temperature_day = []
    @highest_temperature = -1000
    @lowest_temperature = 1000
    @most_humidity = -1000
  end

  def print_values
    print("Highest: #{@highest_temperature}C on #{Date::MONTHNAMES[@highest_temperature_day[1].to_i]} #{@highest_temperature_day[2]}\n")
    print("Lowest: #{@lowest_temperature}C on #{Date::MONTHNAMES[@lowest_temperature_day[1].to_i]} #{@lowest_temperature_day[2]}\n")
    print("Humid: #{@most_humidity}% on #{Date::MONTHNAMES[@most_humid_day[1].to_i]} #{@most_humid_day[2]}\n")
  end

  def find_highest_temperature(temperature, day)
    return unless temperature != '' && (temperature.to_i >= @highest_temp.to_i)

    @highest_temperature = temperature
    @highest_temperature_day = day
  end

  def find_lowest_temperature(temperature, day)
    return unless temperature != '' && (temperature.to_i <= @lowest_temp.to_i)

    @lowest_temperature = temperature
    @lowest_temperature_day = day
  end

  def find_most_humidity(humidity, day)
    return unless humidity != '' && (humidity.to_i >= @most_humidity.to_i)

    @most_humidity = humidity
    @most_humid_day = day
  end

  def find_values(array, day)
    return unless day[0] == @year

    find_highest_temperature(array[1], day)
    find_lowest_temperature(array[3], day)
    find_most_humidity(array[7], day)
  end
end
