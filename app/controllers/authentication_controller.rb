class AuthenticationController < ApplicationController
  def new
    redirect_to root_url if user_signed_in?

    @user = User.new
  end

  def create
    @user = User.find_or_initialize_by(email: user_params[:email])

    if @user.new_record?
      if @user.update(password: user_params[:password])
        sign_in(@user)
        redirect_to root_url
      else
        flash[:error] = @user.errors.full_messages.join("\n")
        render :new, status: 422
      end
    else
      if @user.authenticate(user_params[:password])
        sign_in(@user)
        redirect_to root_url
      else
        flash[:error] = "Invalid password"
        render :new, status: 422
      end
    end
  end

  def destroy
    sign_out

    redirect_to root_url
  end

  private

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
