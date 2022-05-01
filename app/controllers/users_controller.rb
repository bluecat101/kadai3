class UsersController < ApplicationController
before_action :move_to_login
  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  def update
    @user=User.find(params[:id])
    if @user.update(profile_params)
      flash[:alert]="you have update user successfully"
      redirect_to user_path(@user.id)
    else

      render "users/edit"
    end
  end

  protected
  def profile_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

end
