class PitchesController < ApplicationController
  def index
    @pagy, @pitches = pagy Pitch.search_by_name(params[:name])
                                .search_by_price_range(params[:price]),
                           items: Settings.digits.pagy_10
  end

  def show
    @pitch = Pitch.find_by(id: params[:id])

    return if @pitch

    flash[:error] = t "notification.notfound"
    redirect_to root_path
  end
end
