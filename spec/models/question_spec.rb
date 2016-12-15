require "rails_helper"

RSpec.describe Question, :type => :model do

  it {is_expected.to belong_to(:user)}

  describe "validations" do
    it {is_expected.to validate_presence_of(:description)}
  end

  describe "time created" do
    let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }
    let!(:question){ create(:question, description: "abc", user: user) }
    let!(:question_two){ create(:question, description: "abc", user: user, created_at: nil) }

    it 'time' do
      expect(question.time_create).to eql(Date.today.strftime("%m/%d/%y"))
    end

  end

  describe "recent" do
    let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }
    let!(:question){ create(:question, description: "abc", user: user) }
    let!(:question_two){ create(:question, description: "abc", user: user, created_at: nil) }

    it 'recent' do
      expect(Question.recent.count).to eql(2)
    end

  end

  describe "mine" do
    let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }
    let!(:question){ create(:question, description: "abc", user: user) }
    let!(:question_two){ create(:question, description: "abc", user: user, created_at: nil) }

    it 'mine' do
      expect(Question.mine.count).to eql(0)
    end

  end

  describe "recent_min" do
    let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }
    let!(:question){ create(:question, description: "abc", user: user) }
    let!(:question_two){ create(:question, description: "abc", user: user, created_at: nil) }

    it 'recent min' do
      expect(Question.recent_min.count).to eql(2)
    end

  end


  describe "min description" do

    let!(:question){ create(:question, description: "1234567890123456789") }
    let!(:question_two){ create(:question, description: "abc", created_at: nil) }

    it 'range 0...2' do
      expect(question.description_min(0,1)).to eql("12...")
    end

    it 'no range' do
      expect(question.description_min).to eql("12345678901...")
    end

    it 'range desc' do
      expect(question.description_min(10,0)).to eql("12345678901...")
    end

    it 'range off' do
      expect(question_two.description_min(10,15)).to eql("abc...")
    end


  end

  describe "addView" do

    let!(:question){ create(:question, description: "1234567890123456789") }

    it 'add' do
      expect(question.view_count).to eql(0)
      expect(question.addView).to eql(true)
      expect(question.view_count).to eql(1)
    end


  end

  describe "self.by_user" do
    let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }
    let!(:question){ create(:question, description: "1234567890123456789", user: user) }
    let!(:question_two){ create(:question, description: "abv", user: user) }
    let!(:question_one){ create(:question, description: "abc1234") }

    it 'add' do
      expect(Question.by_user.count).to eql(3)
      expect(Question.by_user(user).count).to eql(2)
    end

  end

  def solution_question
    solution = false
    self.answers.each do |answer|
      if answer.answer_correct
        solution = true
      end
    end
  end

  describe "solution_question" do
    let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }
    let!(:user_one){ create(:user, email: "user2@example.com", password: "password", first_name: "user_one", last_name: "example") }

    let!(:question){ create(:question, description: "1234567890123456789", user: user) }
    let!(:question_one){ create(:question, description: "abv", user: user_one) }

    let!(:answer){ create(:answer, description: "abc1234", answer_correct: false, question: question, user: user_one) }
    let!(:answer_one){ create(:answer, description: "abc1234", answer_correct: true, question: question, user: user_one) }
    let!(:answer_two){ create(:answer, description: "abc1234", answer_correct: false, question: question, user: user_one) }


    let!(:aw){ create(:answer, description: "abc1234", question: question_one, user: user) }
    let!(:aw_one){ create(:answer, description: "abc1234", question: question_one, user: user) }
    let!(:aw_two){ create(:answer, description: "abc1234", question: question_one, user: user) }


    it 'solution false' do
      expect(question_one.solution_question).to eql(false)
    end

    it 'solution true' do
      expect(question.solution_question).to eql(true)
    end

  end

end
