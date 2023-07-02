module Admin::PitchesHelper
  def field_type
    Settings.pitch.field_type.map{|n| [t(".#{n}-a-side"), n]}
  end

  def rate
    Settings.pitch.rate.map{|n| [t(".#{n}-*"), n]}
  end
end
