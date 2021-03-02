class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("new")
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
  end
  
  def destroy
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(email: params(:email))
    if @user && @user.authenticate(params[:password])
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが違います。"
      render("users/login_form")
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end
