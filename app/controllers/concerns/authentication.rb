module Authentication
  extend ActiveSupport::Concern

  included do
    private

    def current_user
      if session[:user_id].present?
        @current_user ||= User.find_by(id: session[:user_id]).decorate
      elsif cookies.encrypted[:user_id].present?
        user = User.find_by(id: cookies.encrypted[:user_id])

        if user&.remember_token_authenticated?(cookies.encrypted[:remember_token])
          @current_user ||= user.decorate

          sign_in(user)
        end
      end
    end

    def user_signed_in?
      current_user.present?
    end

    def sign_in(user)
      session[:user_id] = user.id
    end

    def sign_out
      forget(current_user)

      session.delete :user_id

      @current_user = nil
    end

    def remember(user)
      user.remember_me

      cookies.encrypted.permanent[:remember_token] = user.remember_token
      cookies.encrypted.permanent[:user_id] = user.id
    end

    def forget(user)
      user.forget_me

      cookies.delete :user_id
      cookies.delete :remember_token
    end
    def require_no_authentication
      return unless user_signed_in?

      flash[:warning] = 'You\'ve already signed in!'
      redirect_to root_path
    end

    def require_authentication
      return if user_signed_in?

      flash[:warning] = 'You\'ve not signed in!'
      redirect_to root_path
    end

    helper_method :current_user, :user_signed_in?
  end
end
