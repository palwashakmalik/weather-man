require_relative './Extreme_weather'
require_relative './average_weather'
require_relative './weather_charts'

def user_input
  raise 'Wrong User Input' unless ARGV[0].to_s == '-e' || ARGV[0].to_s == '-a' || ARGV[0].to_s == '-c'

  return ExtremeWeather.new(ARGV[1].to_s) if ARGV[0].to_s == '-e'
  return AverageWeather.new(ARGV[1].split('/')[0].to_s, ARGV[1].split('/')[1].to_s) if ARGV[0].to_s == '-a'
  return WeatherCharts.new(ARGV[1].split('/')[0].to_s, ARGV[1].split('/')[1].to_s) if ARGV[0].to_s == '-c'
end

begin
  object = user_input
  IO.sysopen(ARGV[2].to_s)
  main_directory = Dir.glob("#{ARGV[2].to_s}/*")
  main_directory.each do |f|
    sub_directory = Dir.glob("#{f}/*")
    sub_directory.each do |file|
      object.read_file_data(file)
    end
  end
  object.print_values if ARGV[0].to_s != '-c'
rescue Errno::ENOENT
  puts 'No such directory'
end
