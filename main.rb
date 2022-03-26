require './Extreme_weather'

def user_input
  raise 'Wrong User Input' unless ARGV[0].to_s == '-e'

  ExtremeWeather.new(ARGV[1].to_s)
end
object = user_input
begin
  IO.sysopen(ARGV[2].to_s)
  main_directory = Dir.glob("#{ARGV[2].to_s}/*")
  main_directory.each do |f|
    IO.sysopen(f)
    sub_directory = Dir.glob("#{f}/*")
    sub_directory.each do |filename|
      object.read_file_data(filename)
    end
  end
rescue Errno::ENOENT
  puts 'No such directory'
end
object.print_values
