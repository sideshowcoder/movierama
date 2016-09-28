require "rails_helper"

RSpec.describe NotificationData, type: :model do

  let(:user) { User.create(uid: 'null|12345', name: 'Bob', email: 'bob@example.com') }

  let(:movie) do
    Movie.create(title: 'Empire strikes back',
                 description: 'Who\'s scruffy-looking?',
                 date: '1980-05-21',
                 user: user)
  end

  describe "voter name" do
    it "uses the user name if present" do
      expect(NotificationData.new(user, movie).voter_name).to eq "Bob"
    end

    it "defaults to a default if no name is present" do
      user.name = nil
      expect(NotificationData.new(user, movie).voter_name).to eq "Someone"
    end
  end


  describe "email formatting" do
    it "includes the name for users with name set" do
      expect(NotificationData.new(user, movie).to).to eq "Bob <bob@example.com>"
    end

    it "returns email for users with no set name" do
      movie.user.name = nil
      expect(NotificationData.new(user, movie).to).to eq "bob@example.com"
    end
  end

end
