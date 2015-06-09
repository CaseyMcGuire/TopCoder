solution_file = File.open('solution.txt', 'w')
input_file = File.open('input.txt', 'w')


File.open("answers.txt", "r").each do |line|
  next if line == "/n" or line.empty? or line.length == 1

  #Get our tokens
  cur_line = line.split(/\s+{\|}\s{3,}{|}\s+/)

  #strip out Passed token and white space so we're hopefully only left with inputs and answers
  cur_line.map(&:strip!)
  cur_line.delete_if { |a| a.empty? or a == "Passed" }

  #If my didn't break up the string correctly, just ignore it
  next if cur_line.length != 2

  #Get rid of leading bracket and quotation marks
  cur_line.map! { |item| item.gsub(/"|^{/, '') }

  
  input_file.write(cur_line[0] + "\n")
  solution_file.write(cur_line[1] + "\n")
end

solution_file.close
input_file.close
