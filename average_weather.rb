require_relative './date'
require_relative './read_file'

class AverageWeather
  include Readfile
  def initialize(year, month)
    @year = year
    @month = month
    @highest_average_temperature = []
    @lowest_average_temperature = []
    @average_humidity = []
  end

  def average(array)
    sum = 0
    array.each do |i|
      sum += i
    end
    sum / array.size
  end

  def print_values
    print("Highest Average: #{average(@highest_average_temperature)}C  \n")
    print("Lowest Average: #{average(@lowest_average_temperature)}C  \n")
    print("Average Humidity: #{average(@average_humidity)}%  \n")
  end

  def add_highest_average_temperature(temperature)
    @highest_average_temperature << temperature.to_i if temperature != ''
  end

  def add_lowest_average_temperature(temperature)
    @lowest_average_temperature << temperature.to_i if temperature != ''
  end

  def add_average_humidity(humidity)
    @average_humidity << humidity.to_i if humidity != ''
  end

  def find_values(array, day)
    if day[0] == @year && day[1] == @month

      add_highest_average_temperature(array[1])
      add_lowest_average_temperature(array[3])
      add_average_humidity(array[8])
    end
  end
end
