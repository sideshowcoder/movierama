require "rails_helper"

RSpec.describe VotingBooth do

  subject do
    user = User.create(uid: 'null|12345',
                       name: 'Bob',
                       email: 'bob@example.com')
    movie = Movie.create(title: 'Empire strikes back',
                         description: 'Who\'s scruffy-looking?',
                         date: '1980-05-21',
                         user: user)
    VotingBooth.new(user, movie)
  end

  it "triggers hooks on vote" do
    expect { |b| subject.vote(:like, &b) }.to yield_control
  end
end
