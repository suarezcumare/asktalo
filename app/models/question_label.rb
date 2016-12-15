class QuestionLabel < ActiveRecord::Base
  #relationship: label
  #relationship: question

  belongs_to :question
  belongs_to :label
  cattr_accessor :current_user

  scope :mine, -> { where(user_id: current_user) }
  scope :recent, -> { order("created_at desc").limit(10)}
  scope :recent_min,  -> {order("created_at desc").limit(3)}

  def time_create
    if self.created_at.blank?
      "No time"
    else
      self.created_at.strftime(DateFormat.date_format)
    end
  end

end
