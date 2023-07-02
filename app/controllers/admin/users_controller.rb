class Admin::UsersController < Admin::BaseController
  def index
    @pagy, @users = pagy User.listUser, items: Settings.digits.pagy_10
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user

    redirect_to root_path
    flash[:warning] = t "notification.notfound"
  end
end
