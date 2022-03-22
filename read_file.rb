# The `never` will enforce that the frozen string literal comment does
# not exist in a file.
# bad
# frozen_string_literal: true

class Readfile
  def read_file_data(filename)
    file = File.open(filename)
    for line in file.readlines[1..]
      day = []
      array = line.split(',')
      day = array[0].split('-')
      find_values(array, day)
    end
    file.close
  end
end
