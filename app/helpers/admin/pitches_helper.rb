module Admin::PitchesHelper
  def field_type
    Settings.soccer_field.field_type.map{|n| [t(".#{n}-a-side"), n]}
  end

  def rate
    Settings.soccer_field.rate.map{|n| [t(".#{n}-*"), n]}
  end
end
