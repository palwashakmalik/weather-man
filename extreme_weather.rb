require 'date'
require './read_file'

class ExtremeWeather
  include Readfile
  def initialize(year)
    @year = year
    @highest_temperature = -1000
    @lowest_temperature = 1000
    @most_humidity = -1000
  end

  def find_indexes(line)
    line = line.split(',')
    @maximum_temperature_index = line.index('Max TemperatureC')
    @minimum_temperature_index = line.index('Min TemperatureC')
    @maximum_humidity_index = line.index('Max Humidity')
  end

  def print_values
    print("Highest: #{@highest_temperature}C on #{Date::MONTHNAMES[@highest_temperature_day.month]} #{@highest_temperature_day.day}\n")
    print("Lowest: #{@lowest_temperature}C on #{Date::MONTHNAMES[@lowest_temperature_day.month]} #{@lowest_temperature_day.day}\n")
    print("Humid: #{@most_humidity}% on #{Date::MONTHNAMES[@most_humid_day.month]} #{@most_humid_day.day}\n")
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

  def find_values(data)
    begin
      data.shift if data[0].strip.empty?
      find_indexes(data[0])
      data.delete_at(0)
      data.each do |array|
        array = array.split(',')
        day = DateTime.strptime(array[0], '%Y-%m-%d')
        return unless day.year.to_s == @year

        find_highest_temperature(array[@maximum_temperature_index], day)
        find_lowest_temperature(array[@minimum_temperature_index], day)
        find_most_humidity(array[@maximum_humidity_index], day)
      end
    rescue
    end
  end
end
