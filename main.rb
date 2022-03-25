require_relative './Extreme_weather'
require_relative './average_weather'

def user_input
<<<<<<< HEAD
  raise 'Wrong User Input' unless ARGV[0].to_s == '-e' || ARGV[0].to_s == '-a'

  ExtremeWeather.new(ARGV[1].to_s) if ARGV[0].to_s == '-e'
  AverageWeather.new(ARGV[1].split('/')[0].to_s, ARGV[1].split('/')[1].to_s) if ARGV[0].to_s == '-a'
=======
  raise 'Wrong User Input' unless ARGV[0].to_s == '-a'
  AverageWeather.new(ARGV[1].split('/')[0].to_s, ARGV[1].split('/')[1].to_s)
>>>>>>> 06090d3 (requested changes were made)
end

begin
  object = user_input
  IO.sysopen(ARGV[2].to_s)
  main_directory = Dir.glob("#{ARGV[2].to_s}/*")
  main_directory.each do |f|
    IO.sysopen(f)
    sub_directory = Dir.glob("#{f}/*")
    sub_directory.each do |filename|
<<<<<<< HEAD
      object.read_file_data(filename)
=======
    object.read_file_data(filename)
>>>>>>> 06090d3 (requested changes were made)
    end
  end
  object.print_values
rescue Errno::ENOENT
  puts 'No such directory'
end
<<<<<<< HEAD
=======
object.print_values
>>>>>>> 06090d3 (requested changes were made)
