class User < BaseModel
  include Ohm::Timestamps

  attribute :name
  attribute :email

  # Unique identifier for this user, in the form "{provider}|{provider-id}"
  attribute :uid
  index     :uid
  unique    :uid

  # Session token
  attribute :token
  index     :token

  # Submitted movies
  collection :movies, :Movie

  def formatted_email
    "#{name} <#{email}>"
  end

  def subscribed?
    email.present?
  end
end
