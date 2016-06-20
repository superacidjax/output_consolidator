require_relative './lib/record'
require_relative './lib/parser'
require_relative './lib/sorter'

include Sorter

comma = { last_name: 0, first_name: 1, gender: 2, favorite_color: 3, dob: 4 }
space  = { last_name: 0, first_name: 1, middle_initial: 2, gender: 3, dob: 4, favorite_color: 5 }
pipe = { last_name: 0, first_name: 1, middle_initial: 2, gender: 3, favorite_color: 4, dob: 5 }
records  = Parser.read('./data_files/comma.txt', delimiter: ', ', config: comma)
records += Parser.read('./data_files/pipe.txt', delimiter: ' | ', config: pipe)
records += Parser.read('./data_files/space.txt', delimiter: ' ', config: space)

results_file = File.new('./results.txt', 'w')

results_file.puts "Output 1 (gender, then last name ascending):\n"
write_records(sort_by_gender(records), results_file)

results_file.puts "\nOutput 2 (birth date ascending):\n"
write_records(sort_by_dob(records), results_file)

results_file.puts "\nOutput 3 (last name descending):\n"
write_records(sort_by_last_name(records), results_file)

results_file.close