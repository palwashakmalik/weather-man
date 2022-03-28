module Readfile
  def read_file_data(filename)
    file = File.open(filename)
    data = file.readlines.map { |line| line }
    find_values(data)
    file.close
  end
end
