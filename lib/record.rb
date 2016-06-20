class Record
  attr_reader :last_name, :first_name, :gender, :dob, :favorite_color

  def initialize(attributes = {})
    @last_name = attributes[:last_name]
    @first_name = attributes[:first_name]
    @favorite_color = attributes[:favorite_color]
    @gender = expand(attributes[:gender])
    @dob = format_date_string(attributes[:dob])
  end

  def to_string
    "#{last_name} #{first_name} #{gender} #{dob} #{favorite_color}"
  end

  private

  def expand(gender)
    (gender == 'F' || gender == 'Female') ? 'Female' : 'Male'
  end

  def format_date_string(date)
    date.gsub("-", "/")
  end
end
