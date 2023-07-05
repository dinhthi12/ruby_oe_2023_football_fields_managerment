class PitchesController < ApplicationController
  def index
    @pagy, @pitches = pagy Pitch.search_text(params[:query]),
                           items: Settings.digits.pagy_10
  end
end
