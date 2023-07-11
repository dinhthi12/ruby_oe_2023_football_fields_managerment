class Admin::PitchesController < Admin::BaseController
  before_action :find_pitch, except: %i(index new create)

  def new
    @pitch = Pitch.new
  end

  def edit; end

  def update
    if @pitch.update pitch_params
      flash[:success] = t "notification.success"
      redirect_to admin_pitch_path(@pitch)
    else
      flash.now[:error] = t "notification.err"
      render :edit
    end
  end

  def show; end

  def create
    @pitch = Pitch.new pitch_params
    if @pitch.save
      flash[:success] = t "notification.success"
      redirect_to admin_pitches_path
    else
      flash.now[:error] = t "notification.err"
      render :new
    end
  end

  def index
    @pagy, @pitches = pagy Pitch.sort_list_pitch_by_name, items: Settings.digits.pagy_10
  end

  private

  def find_pitch
    @pitch = Pitch.find_by id: params[:id]
    return if @pitch

    flash[:error] = t "notification.notfound"
    redirect_to admin_root_path
  end

  def pitch_params
    params.require(:pitch).permit :name, :pitch_type,
                                  :rate, :hour_price, :image
  end
end
