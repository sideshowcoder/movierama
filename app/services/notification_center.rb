class NotificationCenter

  def initialize(voter, movie)
    @voter = voter
    @movie = movie
  end

  def trigger
    data = NotificationData.new(@voter, @movie)
    VoteMailer.notification(data).deliver if subscribed?
  end

  private

  def subscribed?
    @movie.user.email?
  end
end
