class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :picture, AttachmentUploader

  has_many :questions
  validates :first_name,
             presence: true,
             length: {minimum: 1, maximum: 350 }

  validates :last_name,
             presence: true,
             length: { minimum: 1, maximum: 350 }

  scope :recent, -> {order("created_at desc").limit(10)}


   def full_name
     if( self.first_name.blank? && self.last_name.blank? )
       "No Name".titleize
     elsif ( self.last_name.blank? )
       self.first_name.titleize
     elsif ( self.first_name.blank? )
       self.last_name.titleize
     else
       self.first_name.titleize + ' ' + self.last_name.titleize
     end
   end

  def time_create
    if self.created_at.blank? || self.created_at.nil?
      "No time"
    else
      self.created_at.strftime(DateFormat.date_format)
     end
   end

   def time_zone
     Time.zone.name
   end

   def sex_word
     if self.sex
       "Male"
     else
       "Female"
     end

   end

end
