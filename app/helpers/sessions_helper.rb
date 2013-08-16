module SessionsHelper
  def sign_in(user)
    tok = User.new_remember_token
    cookies.permanent[:remember_token] = tok
    user.update_attribute(:remember_token, User.encrypt(tok))    # code to sign user in 
    self.current_user = user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    lookup_tok = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: lookup_tok)
  end

  def logged_in? 
    !current_user.nil?
  end
end
