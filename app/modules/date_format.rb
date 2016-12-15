class DateFormat
  def self.date_format
    "%m/%d/%y"
  end

  def self.time_format
    "%I:%M %P"
  end

  def self.datetime_format
    date_format + " " + time_format
  end

end
