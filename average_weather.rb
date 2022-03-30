require 'date'
require './read_file'

class AverageWeather
  include Readfile
  def initialize(year, month)
    @year = year.to_s
    @month = month.to_s
    @highest_average_temperature = []
    @lowest_average_temperature = []
    @average_humidity = []
  end

  def average(array)
    sum = 0
    array.map { |i| sum += i }
    raise 'Invalid' if array.size.zero?

    sum /= array.size
  end

  def find_indexes(line)
    @maximum_temperature_index = line.split(',').index('Max TemperatureC')
    @minimum_temperature_index = line.split(',').index('Min TemperatureC')
    @maximum_humidity_index = line.split(',').index('Max Humidity')
  end

  def print_values
    print("Highest Average: #{average(@highest_average_temperature)}C  \n")
    print("Lowest Average: #{average(@lowest_average_temperature)}C  \n")
    print("Average Humidity: #{average(@average_humidity)}%  \n")
  end

  def add_highest_average_temperature(temperature)
    @highest_average_temperature << temperature.to_i if !temperature.empty?
  end

  def add_lowest_average_temperature(temperature)
    @lowest_average_temperature << temperature.to_i if !temperature.empty?
  end

  def add_average_humidity(humidity)
    @average_humidity << humidity.to_i if !humidity.empty?
  end

  def find_values(data)
    data.shift if data[0].strip.empty?
      find_indexes(data[0])
      data[1..-2].each do |array|
        array = array.split(',')
        day = DateTime.strptime(array[0], '%Y-%m-%d')
        return unless day.year.to_s == @year && day.month.to_s == @month

        add_highest_average_temperature(array[@maximum_temperature_index])
        add_lowest_average_temperature(array[@minimum_temperature_index])
        add_average_humidity(array[@maximum_humidity_index])
      end
  end
end
