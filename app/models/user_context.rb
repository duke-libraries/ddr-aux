class UserContext

  attr_reader :user, :request

  def initialize(user, request)
    @user, @request = user, request
  end

end
