class UsersController < ApplicationController
  #example usage of authorize before filter
  #before_filter :authorize, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      #sign new users in automatically
      session[:user_id] = @user.id

      redirect_to root_url, notice: "Thanks for signing up!"
    else
      render "new"
    end
  end
end
