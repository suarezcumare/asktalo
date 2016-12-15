class Guest
  include Draper::Decoratable

  def time_zone
    Time.zone.name
  end

  def id
    nil
  end
end
