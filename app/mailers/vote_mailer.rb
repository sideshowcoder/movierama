class VoteMailer < ActionMailer::Base
  default from: "do-not-repley@#{Rails.application.config.site_url}"

  # TODO setup Resque for delayed jobs

  def notification(movie, voter)
    @movie = movie
    @url = Rails.application.config.site_url
    @voter = voter

    mail(to: movie.user.formatted_email, subject: "New reaction on #{movie.title}")
  end
end
