class VoteMailerPreview < ActionMailer::Preview
  def notification
    VoteMailer.notification(default_movie, default_user)
  end

  private
  def default_movie
    Movie.all.first || Movie.create(title: "Clerks",
                                    description: "A good movie",
                                    date: "1994-10-19",
                                    user: default_user)
  end

  def default_user
    User.all.first || User.create(uid: "null|12345",
                                  name: "Bob",
                                  email: "bob@example.com")
  end
end
