a=[ARGV]
year=a[0][1].to_s
path=a[0][2].to_s
MainDirectoryfolder = Dir.glob("#{path}/*")
require 'date'
highest_temp = -1000
lowest_temp = 1000
most_humid = -1000
most_humid_day = []
lowest_temp_day = []
highest_temp_day = []
MainDirectoryfolder.each do |f|
  subdirectoryfiles = Dir.glob("#{f}/*")
  subdirectoryfiles.each do |filename|
    day=[]
    file = File.open(filename)
    for line in file.readlines()[1..-1]
      array=line.split(",")
      day=array[0].split("-")
      if day[0]==year
        if array[1]!=""
          if(array[1].to_i>=highest_temp.to_i)
            highest_temp=array[1]
            highest_temp_day=day
          end
        end
        if array[3]!=""
          if(array[3].to_i<=lowest_temp.to_i)
            lowest_temp=array[3]
            lowest_temp_day=day
          end
        end
        if array[7]!=""
          if(array[7].to_i>=most_humid.to_i)
            most_humid=array[7]
            most_humid_day=day
          end
        end
      end
    end
  end
end
print("Highest: #{highest_temp}C on #{Date::MONTHNAMES[highest_temp_day[1].to_i]} #{highest_temp_day[2]}\n")
print("Lowest: #{lowest_temp}C on #{Date::MONTHNAMES[lowest_temp_day[1].to_i]} #{lowest_temp_day[2]}\n")
print("Humid: #{most_humid}% on #{Date::MONTHNAMES[most_humid_day[1].to_i]} #{most_humid_day[2]}\n")
