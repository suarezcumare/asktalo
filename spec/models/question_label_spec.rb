require "rails_helper"

RSpec.describe QuestionLabel, :type => :model do

  it {is_expected.to belong_to(:question)}
  it {is_expected.to belong_to(:label)}


    describe "time created" do
      let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }
      let!(:question){ create(:question, description: "abc", user: user) }
      let!(:label){ create(:label, name: "name", description: "desc", available: true) }
      let!(:question_label){ create(:question_label, question: question, label: label) }


      it 'time' do
        expect(question_label.time_create).to eql(Date.today.strftime("%m/%d/%y"))
      end

    end

end
