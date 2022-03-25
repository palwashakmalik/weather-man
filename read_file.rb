module Readfile
  def read_file_data(filename)
    file = File.open(filename)
    file.each_line do |line|
      next if line.strip.empty?

      find_indexes(line)
      break
    end
    file.each_line do |line| [1..-1]
      next if line.strip.empty?

      find_values(line)
    end
    file.close
  end
end
