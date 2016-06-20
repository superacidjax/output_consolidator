require 'csv'

module Parser
  def self.read(file_path, opts = {})
    delimiter = opts.fetch(:delimiter, ",")
    if opts[:config]
      config = opts[:config]
      records = []
      CSV.foreach(file_path, col_sep: delimiter) do |row|
        records << Record.new(gender: row[config[:gender]],
                              last_name: row[config[:last_name]],
                              first_name: row[config[:first_name]],
                              dob: row[config[:dob]],
                              favorite_color: row[config[:favorite_color]])
      end
      records
    else
      CSV.read(file_path, col_sep: delimiter)
    end
  end
end
