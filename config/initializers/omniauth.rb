require 'omniauth'


OmniAuth.config.full_host = Rails.application.config.site_url unless Rails.env.test?

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?

  provider :github,
    ENV.fetch('GITHUB_OAUTH_CLIENT_ID'),
    ENV.fetch('GITHUB_OAUTH_SECRET'),
    scope: "user:email"
end
