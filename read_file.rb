module Readfile
  def read_file_data(filename)
    file = File.open(filename)
    for line in file.readlines[1..-1]
      day = []
      array = line.split(',')
      day = array[0].split('-')
      find_values(array, day)
    end
    file.close
  end
end
