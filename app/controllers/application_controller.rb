class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def authenticate_with_basic_auth
    # this will be called from controller before any action
    unless @current_user
      # grabs email, password
      authenticate_or_request_with_http_basic do |email, password|
        # feeds the values through our self.authenticated? class method

        # set their return value to @current_user
        @current_user = Chef.authenticated?(email, password)

        # or redirect on failure???
        # unless @current_user
        #   redirect_to root_path
        # end
        # resume letting the user into the site
      end
    else
      @current_user
    end
  end

  # something here
  helper_method :current_user

  # public getter for a normally private instance variable
  def current_user
    @current_user
  end

  # # example of a helper
  # def make_link_tag(url)
  #   "<a href='#{url}'>link</a>"
  # end

end
