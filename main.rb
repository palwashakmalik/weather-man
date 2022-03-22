# This is the main body file from where the functionality is selected
# not exist in a file.
# bad
# frozen_string_literal: true

require 'extreme_weather'
def user_input(input, *year)
  return unless input == '-e'

  ExtremeWeather.new(year)
end

arguments = [ARGV]
year = arguments[0][1].split('/').to_s
path = arguments[0][2].to_s
object = user_input(arguments[0][0], *year)

main_directory = Dir.glob("#{path}/*")
main_directory.each do |f|
  sub_directory = Dir.glob("#{f}/*")
  sub_directory.each do |filename|
    object.read_file_data(filename)
  end
end

object.print_values
