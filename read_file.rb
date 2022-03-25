module Readfile
  def read_file_data(filename)
    file = File.open(filename)
<<<<<<< HEAD
    data = file.readlines.map { |line| line }
    find_values(data)

=======
    file.each_line do |line|
      next if line.strip.empty?

      find_indexes(line)
      break
    end
    file.each_line do |line| [1..-1]
      next if line.strip.empty?

      find_values(line)
    end
>>>>>>> d67dd98 (Exceptions and requested changes were made)
    file.close
  end
end

