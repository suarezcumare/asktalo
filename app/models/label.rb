class Label < ActiveRecord::Base
  #attributes: name, description
  #relationship: questiolabels

  has_many :questionLabels
  has_many :questions, through: :questionLabels
  cattr_accessor :current_user

  validates :name,
            presence: true,
            length: { minimum: 1, maximum: 150 }
  validates :description,
            presence: true,
            length: { minimum: 1, maximum: 350 }

  scope :all_available, -> { where(available: true) }
  scope :recent, -> { order("created_at desc").limit(10)}
  scope :recent_min, -> { order("created_at desc").limit(3)}


  def time_create
    if self.created_at.blank?
      "No time"
    else
      self.created_at.strftime(DateFormat.date_format)
    end
  end

end
