require "rails_helper"

RSpec.describe Label, :type => :model do


  describe "validations" do
    it {is_expected.to validate_presence_of(:description)}
    it {is_expected.to validate_presence_of(:name)}

  end

  describe "time created" do
    let!(:label){ create(:label, name: "name", description: "desc", available: true) }

    it 'time' do
      expect(label.time_create).to eql(Date.today.strftime("%m/%d/%y"))
    end

  end



  describe "recent" do
    let!(:label){ create(:label, name: "name", description: "desc", available: true) }

    it 'recent' do
      expect(Label.recent.count).to eql(1)
    end

  end


  describe "recent_min" do
    let!(:label){ create(:label, name: "name", description: "desc", available: true) }

    it 'recent min' do
      expect(Label.recent_min.count).to eql(1)
    end

  end

  describe "all available" do
    let!(:label){ create(:label, name: "name", description: "desc", available: true) }
    let!(:label2){ create(:label, name: "name", description: "desc", available: false) }
    let!(:label3){ create(:label, name: "name", description: "desc", available: false) }
    let!(:label4){ create(:label, name: "name", description: "desc", available: true) }


    it 'recent min' do
      expect(Label.all_available.count).to eql(2)
    end

  end

end
