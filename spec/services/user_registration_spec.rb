require "rails_helper"

RSpec.describe UserRegistration do

  let(:auth_hash) do
    {
      "provider" => "github",
      "uid" => "12345",
      "info"=> { "nickname" => "Bob", "email" => "bob@example.com", "name"=>"Bob"}
    }
  end

  subject do
    UserRegistration.new(auth_hash)
  end

  it "creates a user with auth_hash attributes" do
    expect(subject.user.email).to eq auth_hash["info"]["email"]
    expect(subject.user.name).to eq auth_hash["info"]["name"]
  end

  it "creates a uid for the user" do
    expect(subject.user.uid).to eq "#{auth_hash['provider']}|#{auth_hash['uid']}"
  end

end
