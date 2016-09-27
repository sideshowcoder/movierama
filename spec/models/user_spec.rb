require "rails_helper"

RSpec.describe User, :type => :model do

  subject do
    User.create name: "Bob", uid: "unique|id", email: "bob@example.com"
  end

  describe "notifications" do
    it "creates email ready for sending" do
      expect(subject.formatted_email).to eq "Bob <bob@example.com>"
    end

    it "receives notification" do
      expect(subject.subscribed?).to be true
    end

    it "does not receive notifications without email" do
      subject.email = ""
      expect(subject.subscribed?).to be false
    end
  end
end
