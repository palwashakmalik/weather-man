require 'colorize'
require 'date'
require './read_file'

class WeatherCharts
  include Readfile
  def initialize(year, month)
    puts "#{Date::MONTHNAMES[@month.to_i]} #{@year}\n "
    @year = year
    @month = month
  end

  def find_indexes(line)
<<<<<<< HEAD
    @maximum_temperature_index = line.split(',').index('Max TemperatureC')
    @minimum_temperature_index = line.split(',').index('Min TemperatureC')
=======
    line = line.split(',')
    @maximum_temperature_index = line.index('Max TemperatureC')
    @minimum_temperature_index = line.index('Min TemperatureC')
>>>>>>> 9e99196 (requested changes were made)
  end

  def bars(count, color)
    count.to_i.times do
      if color == 'blue'
        print('+'.blue)
      else
        print('+'.red)
      end
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

      print_highest(array[@maximum_temperature_index], day.day) if !array[1].empty?
      print_lowest(array[@maximum_temperature_index], day.day) if !array[3].empty?
    end
  end
end
