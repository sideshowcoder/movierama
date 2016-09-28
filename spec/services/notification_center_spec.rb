require "rails_helper"

RSpec.describe NotificationCenter do
  describe "sending" do

    before { ActionMailer::Base.deliveries = [] }

    let(:user) do
      User.create(uid: 'null|12345',
                  name: 'Bob',
                  email: 'bob@example.com')
    end

    let(:movie) do
      Movie.create(title: 'Empire strikes back',
                   description: 'Who\'s scruffy-looking?',
                   date: '1980-05-21',
                   user: user)
    end


    it "does send to user with email" do
      NotificationCenter.new(user, movie).trigger
      expect(ActionMailer::Base.deliveries).to_not be_empty
    end

    it "does not sent to users without email" do
      movie.user.email = nil
      NotificationCenter.new(user, movie).trigger
      expect(ActionMailer::Base.deliveries).to be_empty
    end

  end
end
