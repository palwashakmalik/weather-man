require 'colorize'
require 'date'
require './read_file'

class WeatherCharts
  include Readfile
  def initialize(year, month)
    @year = year
    @month = month
    puts "#{Date::MONTHNAMES[@month.to_i]} #{@year}"
  end

  def find_indexes(line)
    @maximum_temperature_index = line.split(',').index('Max TemperatureC')
    @minimum_temperature_index = line.split(',').index('Min TemperatureC')
  end

  def bars(count, color)
    count.to_i.times do
      color == 'blue' ? print('+'.blue) : print('+'.red)
    end
  end

  def print_highest(temperature, day)
    print("#{day} ")
    bars(temperature, 'red')
    print(" #{temperature}C\n")
  end

  def print_lowest(temperature, day)
    print("#{day} ")
    bars(temperature, 'blue')
    print(" #{temperature}C\n")
  end

  def find_values(data)
    data.shift if data[0].strip.empty?
    find_indexes(data[0])
    data[1..-2].each do |array|
      array = array.split(',')
      day = DateTime.strptime(array[0], '%Y-%m-%d')
      return unless day.year.to_s == @year && day.month.to_s == @month

      print_highest(array[@maximum_temperature_index], day.day) if !array[@maximum_temperature_index].empty?
      print_lowest(array[@minimum_temperature_index], day.day) if !array[@minimum_temperature_index].empty?
    end
  end
end
