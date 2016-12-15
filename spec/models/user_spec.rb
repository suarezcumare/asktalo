require "rails_helper"

RSpec.describe User, :type => :model do

  describe "validations" do
    it {is_expected.to validate_presence_of(:first_name)}
    it {is_expected.to validate_presence_of(:last_name)}
  end


  describe "recent" do
    let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }
    let!(:user1){ create(:user, email: "user1@example.com", password: "12345678", first_name: "user1", last_name: "example1") }
    let!(:user2){ create(:user, email: "user2@example.com", password: "12345678", first_name: "user2", last_name: "example2") }
    let!(:user3){ create(:user, email: "user3@example.com", password: "12345678", first_name: "user3", last_name: "example3") }
    let!(:user4){ create(:user, email: "user4@example.com", password: "12345678", first_name: "user4", last_name: "example4") }


    it "user recent" do
      expect(User.recent.count).to eql(5)
    end

  end

  describe "full_name" do
    let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }


    it "complete full name" do
      expect(user.full_name).to eql(user.first_name.titleize + ' ' + user.last_name.titleize)
    end

  end


  describe "time created" do
    let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }

    it 'time' do
      expect(user.time_create).to eql(Date.today.strftime("%m/%d/%y"))
    end

  end

  describe "sex word" do
    let!(:user){ create(:user, email: "user@example.com", password: "12345678", first_name: "user", last_name: "example") }
    let!(:user1){ create(:user, email: "user1@example.com", password: "12345678", first_name: "user", last_name: "example", sex: false) }
    let!(:user2){ create(:user, email: "user2@example.com", password: "12345678", first_name: "user", last_name: "example", sex: true) }

    it 'no sex' do
      expect(user.sex_word).to eql("Male")
    end

    it 'Female' do
      expect(user1.sex_word).to eql("Female")
    end

    it 'Male' do
      expect(user2.sex_word).to eql("Male")
    end

  end



end
