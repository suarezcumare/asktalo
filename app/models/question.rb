class Question < ActiveRecord::Base
  #attributes: description, view_count
  #relationship: user
  #relationship: question

  has_many :questionLabels
  has_many :labels, through: :questionLabels
  accepts_nested_attributes_for :questionLabels
  has_many :answers
  belongs_to :user
  cattr_accessor :current_user

  validates_presence_of :description


  scope :mine, -> { where(user_id: current_user) }
  scope :recent, -> { order("created_at desc").limit(10)}
  scope :recent_min, -> { order("created_at desc").limit(3)}

  def time_create
    if self.created_at.blank? || self.created_at.nil?
      "No time"
    else
      self.created_at.strftime(DateFormat.date_format)
    end
  end

  def description_min(m=0, n=10)
    #min && max, validates input values
    x=[m,n].min
    y =[m,n].max

    #validates description.lengt with range
    x =[x,0].max
    x = 0 if x > self.description.length
    y =[y,self.description.length].min

    y =[y,self.description.length].min
    "#{self.description[x..y]}..."
  end

  #in controller Question.by_user(User).recent
  def self.by_user(*user)
    if user.present?
      where(user_id: user)
    else
      all
    end
  end

  def send_email_question
    QuestionMailer.send(self).deliver
  end

  def addView
    self.view_count += 1
    self.save
  end

  def solution_question
    solution = false
    self.answers.each do |answer|
      if answer.answer_correct
        solution = true
      end
    end

    return solution
  end

end
