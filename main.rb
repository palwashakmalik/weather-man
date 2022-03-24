require_relative 'Extreme_weather'

def user_input(input, year)
  object = ExtremeWeather.new(year) if input == '-e'
end
arguments = [ARGV]
year = arguments[0][1].to_s
path = arguments[0][2].to_s
object = user_input(arguments[0][0].to_s, year)
main_directory = Dir.glob("#{path}/*")
main_directory.each do |f|
  sub_directory = Dir.glob("#{f}/*")
  sub_directory.each do |filename|
    object.read_file_data(filename)
  end
end

object.print_values
