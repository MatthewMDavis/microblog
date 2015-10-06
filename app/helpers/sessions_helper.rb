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

  
  def signed_in_user
    unless logged_in?      
      store_location
      redirect_to login_url, notice: "Please log in." 
    end
  end

  def current_user
    lookup_tok = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: lookup_tok)
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in? 
    !current_user.nil?
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

end
