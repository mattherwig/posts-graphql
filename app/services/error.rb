

class Error < ::StandardError
  def user_errors
    [{ path: [:base], messages: [message]}]
  end
end