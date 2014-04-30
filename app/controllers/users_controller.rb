class UsersController < ApplicationController

  def index

  end

  def create
    User.create!(
      name: params[:name],
      email: params[:email],
      password: params[:password],
<<<<<<< HEAD
      password_confirmation: params[:password_confirmation]
    )
=======
      password_confirmation: params[:password]
      )
>>>>>>> 4283a6b222e4e544c8c57c1e8d63e7f9fbce8640
      render :json => { message: "User account added successfully!" }
    # end
  end

  def edit

  end

  def update
    @user = User.find(@current_user.id)
    @user.update(user_params)

    if @user.save
      redirect_to root_path
    else
      flash[:notice] = "User update was unsuccessful. Please try again!"
      render(:edit)
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

end

url: "/users"
type: "POST"
dataTYPE: 'JSON'
var
data: {name: name, email: email, password: password, password_confirmation: password_confirmation }
