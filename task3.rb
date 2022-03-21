a=[ARGV]
time=a[0][1].to_s.split("/")
year=time[0].to_s
month=time[1].to_s
path=a[0][2].to_s
def bars(i,color)
  i.to_i.times do
    if (color=="blue")
    print("+".blue)
    else
      print("+".red)
    end
  end
end
require 'colorize'
require 'date'
puts "#{Date::MONTHNAMES[month.to_i]} #{year}\n "
subdirectoryfiles = Dir.glob("#{path}/*")
subdirectoryfiles.each do |filename|
  day=[]
  file = File.open(filename)
  for line in file.readlines()[1..-1]
    array=line.split(",")
    day=array[0].split("-")
    if day[0]==year && day[1]==month
      if array[1]!=""
        print("#{day[2]} ")
        bars(array[1],"red")
        print(" #{array[1]}C\n")
      end
      if array[3]!=""
        print("#{day[2]} ")
        bars(array[3],"blue")
        print(" #{array[3]}C\n")
      end
    end
  end
end
