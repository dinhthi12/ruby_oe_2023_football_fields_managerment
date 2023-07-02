class Admin::UsersController < Admin::BaseController
  def index
    @pagy, @users = pagy User.where.not(role: 1), items: 10
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user

    redirect_to root_path
    flash[:warning] = t "notification.notfound"
  end
end
