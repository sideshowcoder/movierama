require "rails_helper"

RSpec.describe User, :type => :model, focus: true do
  it "determines email presence" do
    expect(User.new(email: "bob@example.com").email?).to be true
    expect(User.new.email?).to be false
  end
end
