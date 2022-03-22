
require 'date'
class Extreme_weather

  def initialize
    @most_humid_day = []
    @lowest_temp_day = []
    @highest_temp_day = []
    @highest_temp = -1000
    @lowest_temp = 1000
    @most_humid = -1000

  end

  def printval
    print("Highest: #{@highest_temp}C on #{Date::MONTHNAMES[@highest_temp_day[1].to_i]} #{@highest_temp_day[2]}\n")
    print("Lowest: #{@lowest_temp}C on #{Date::MONTHNAMES[@lowest_temp_day[1].to_i]} #{@lowest_temp_day[2]}\n")
    print("Humid: #{@most_humid}% on #{Date::MONTHNAMES[@most_humid_day[1].to_i]} #{@most_humid_day[2]}\n")



  end

  def find_highest_temp(temp,day)
    if temp!=""
      if(temp.to_i>=@highest_temp.to_i)
        @highest_temp=temp
        @highest_temp_day=day
      end
    end
  end

  def find_lowest_temp(temp,day)
    if temp!=""
      if(temp.to_i<=@lowest_temp.to_i)
        @lowest_temp=temp
        @lowest_temp_day=day
      end
    end
  end

  def find_most_humid(humidity,day)
    if humidity!=""
      if(humidity.to_i>=@most_humid.to_i)
        @most_humid=humidity
        @most_humid_day=day
      end
    end
  end


  def readfile(filename)
    file = File.open(filename)
    for line in file.readlines()[1..-1]
      day=[]
      array=line.split(",")
      day=array[0].split("-")
      if day[0]==$year
        find_highest_temp(array[1],day)
        find_lowest_temp(array[3],day)
        find_most_humid(array[7],day)
      end
    end
    file.close


  end



end

a=[ARGV]
$year=a[0][1].to_s
path=a[0][2].to_s
testobj = Extreme_weather.new
MainDirectoryfolder = Dir.glob("#{path}/*")
MainDirectoryfolder.each do |f|
  subdirectoryfiles = Dir.glob("#{f}/*")
  subdirectoryfiles.each do |filename|
    testobj.readfile(filename)

  end
end

testobj.printval
