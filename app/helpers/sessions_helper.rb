module SessionsHelper

  def sign_in(user)
    # sign user in and create cookies to remember session
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def signed_in?
    # check if current user is logged in
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    # check for session for current user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    # check if user is signed in and otherwise redirect to signin url
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def sign_out
    # sign user out by destroying session
    current_user.update_attribute(:remember_token,
                                  User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def redirect_back_or(default)
    # after login redirect user to page visited prior to login
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    # store page user was watching prior to login
    session[:return_to] = request.url if request.get?
  end

  def onList?(course_id, type)
    # check if user already has course in specified list
    current_user.list_items.find_by(course_id: course_id, list_type: type)
  end

  def addToList!(course_id, type)
    # add course to specified list for current user
    ListItem.create!( user_id: current_user.id, 
                      course_id: course_id, 
                      list_type: type)
  end

  def removeFromList!(course_id, type)
    # remove course from specified list for current user
    current_user.list_items.find_by(course_id: course_id, 
                                    list_type: type).destroy
  end
end