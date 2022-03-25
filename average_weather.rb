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
    begin
       sum / array.size
    rescue
      puts "tried to divide by zero"
    end
  end

  def find_indexes(line)
    line = line.split(',')
    @maximum_temperature_index = line.index('Max TemperatureC')
    @minimum_temperature_index = line.index('Min TemperatureC')
    @maximum_humidity_index = line.index('Max Humidity')
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

  def find_values(array)
    array = array.split(',')
    begin
      day = DateTime.strptime(array[0], '%Y-%m-%d')
      return unless day.year.to_s == @year && day.month.to_s == @month

      add_highest_average_temperature(array[@maximum_temperature_index])
      add_lowest_average_temperature(array[@minimum_temperature_index])
      add_average_humidity(array[@maximum_humidity_index])
    rescue
    end
  end
end
