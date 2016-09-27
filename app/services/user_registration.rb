# Given an Omniauth hash, finds or creates Users.
class UserRegistration
  def initialize(auth_hash)
    @ran = @user = @created = nil
    @auth_hash = auth_hash
  end

  # A saved user instance for the `auth_hash`
  def user
    _run
    @user
  end

  # Return whether the user was created by the service.
  #
  def created?
    _run
    @created
  end

  private

  def _run
    @ran and return
    uid = "%s|%s" % [
      @auth_hash['provider'],
      @auth_hash['uid']
    ]

    if user = User.find(uid: uid).first
      @user    = user
      @created = false
    else
      @user = User.create(
        uid:        uid, 
        name:       @auth_hash['info']['name'],
        email:      @auth_hash['info']['email'],
        created_at: Time.current.utc.to_i
      )
      @created = true
    end

    @ran = true
  end
end
