class PitchesController < ApplicationController
  before_action :find_pitch, except: %i(index)
  before_action :require_login, except: %i(index)

  def index
    @pagy, @pitches = pagy Pitch.all, items: 10
  end

  def show
    @pitch = Pitch.find_by(id: params[:id])

    @pitch_booking = current_user
                     .pitch_bookings
                     .build(pitch_id: @pitch.id)

    return if @pitch

    flash[:error] = t ".not_found"
    redirect_to root_path
  end

  private
  def require_login
    return if logged_in?

    flash[:warning] = "Ban chua dang nhap"
    redirect_to login_path
  end

  def find_pitch
    @pitch = Pitch.find_by id: params[:id]
    return if @pitch

    flash[:error] = "Khong tim thay san"
    redirect_to root_path
  end
end
