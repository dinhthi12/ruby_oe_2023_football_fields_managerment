class PitchesController < ApplicationController
  def index
    @pagy, @pitches = pagy Pitch.search_by_name(params[:name])
                                .search_by_price_range(params[:price]),
                           items: Settings.digits.pagy_10
  end
end
