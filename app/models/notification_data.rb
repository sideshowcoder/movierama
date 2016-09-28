class NotificationData
  attr_reader :voter, :movie

  def initialize(voter, movie)
    @voter = voter
    @movie = movie
  end

  def url
    Rails.application.config.site_url
  end

  def voter_name
    if @voter.name.blank?
      "Someone"
    else
      @voter.name
    end
  end

  def link_name
    "Movierama"
  end

  def subject
    "New reaction on #{movie.title}"
  end

  def to
    if target.name.nil?
      target.email
    else
      "#{target.name} <#{target.email}>"
    end
  end

  def target
    movie.user
  end

  def to_h
    { to: to, subject: subject }
  end
end
