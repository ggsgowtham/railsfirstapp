class SessionsController < ApplicationController
  def index 
    if session[:user_id]
      redirect_to '/articles'
    end 
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    if session[:user_id]
      redirect_to '/articles'
    end  
    @user = User.new
  end
  
  def create
    user = User.where(:email => params[:email], :password => params[:password]).take
    if user
      session[:user_id] = user.id
  		redirect_to '/articles' , notice: 'Logged In'
    else
      redirect_to '/login', notice: 'User name or password doesnot exist'
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/' , notice: 'Logged Out' 
  end
end
