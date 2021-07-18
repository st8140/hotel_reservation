class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.password == @user.password_confirmation
      @user.save
    end
    
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      session[:user_id] = @user.id
      redirect_to("/account")
    else
      render("new")
    end
  end
  
  def show
   
  end
  
  def edit
    
  end
  
  def update
    respond_to do |format|
      if current_user.update_with_password(user_params)
        # パスワードを変更するとログアウトしてしまうので、再ログインが必要
       sign_in(current_user, bypass: true)
        format.html { redirect_to edit_setting_path }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @email = params[:email]
      @error_message = "メールアドレスまたはパスワードが違います。"
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
  
end
