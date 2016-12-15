require "rails_helper"

RSpec.describe Answer, :type => :model do

  it {is_expected.to belong_to(:question)}
  it {is_expected.to belong_to(:user)}

  describe "validations" do
    it {is_expected.to validate_presence_of(:description)}
  end

  describe "recent" do
    let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }
    let!(:question){ create(:question, description: "abc", user: user) }
    let!(:answer){ create(:answer, description: "abc1234", answer_correct: false, question: question, user: user) }

    it 'recent' do
      expect(Answer.recent.count).to eql(1)
    end

  end

  describe "mine" do
    let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }
    let!(:question){ create(:question, description: "abc", user: user) }
    let!(:answer){ create(:answer, description: "abc1234", answer_correct: false, question: question, user: user) }

    it 'mine' do
      expect(Answer.mine.count).to eql(0)
    end

  end

  describe "recent_min" do
    let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }
    let!(:question){ create(:question, description: "abc", user: user) }
    let!(:answer){ create(:answer, description: "abc1234", answer_correct: false, question: question, user: user) }

    it 'recent min' do
      expect(Question.recent_min.count).to eql(1)
    end

  end


  describe "time created" do
    let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }
    let!(:question){ create(:question, description: "abc", user: user) }
    let!(:answer){ create(:answer, description: "abc1234", answer_correct: false, question: question, user: user) }

    it 'time' do
      expect(answer.time_create).to eql(Date.today.strftime("%m/%d/%y"))
    end

  end

end
