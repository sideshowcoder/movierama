class VoteMailer < ActionMailer::Base
  default from: "do-not-reply@#{Rails.application.config.site_url}"

  def notification(data)
    @data = data
    mail(data.to_h)
  end
end
