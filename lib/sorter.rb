require 'date'

module Sorter
  def sort_by_gender(array)
    array.sort_by { |a| [a.gender, a.last_name] }
  end

  def sort_by_dob(array)
    array.sort_by { |a| [convert_to_date(a.dob), a.last_name] }
  end

  def sort_by_last_name(array)
    array.sort_by { |h| [h.last_name] }.reverse!
  end

  def convert_to_date(string)
    DateTime.strptime(string, "%m/%d/%Y")
  end

  def write_records(array, file)
    array.each {|rec| file.puts rec.to_string}
  end
end
