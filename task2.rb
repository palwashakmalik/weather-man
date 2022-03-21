
a=[ARGV]
time=a[0][1].to_s.split("/")
year=time[0].to_s
month=time[1].to_s
path=a[0][2].to_s
def Avg(array)
  sum=0
  for i in array
  sum=sum+i
  end
  avgofarray=sum/array.size
end
MainDirectoryfolder = Dir.glob("#{path}/*")
require 'date'
highest_avg_temp = []
lowest_avg_temp = []
avg_humid = []
subdirectoryfiles = Dir.glob("#{path}/*")
subdirectoryfiles.each do |filename|
  day=[]
  file = File.open(filename)
  for line in file.readlines()[1..-1]
    array=line.split(",")
    day=array[0].split("-")
    if day[0]==year && day[1]==month
      if array[1]!=""
        highest_avg_temp<<array[1].to_i

      end
      if array[3]!=""
        lowest_avg_temp<<array[3].to_i
      end
      if array[8]!=""
        avg_humid<<array[8].to_i


      end
    end
  end
end
print("Highest Average: #{Avg(highest_avg_temp)}C  \n")
print("Lowest Average: #{Avg(lowest_avg_temp)}C  \n")
print("Average Humidity: #{Avg(avg_humid)}%  \n")
