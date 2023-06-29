class CreatePitchBookingServices < ActiveRecord::Migration[6.1]
  def change
    create_table :pitch_booking_services do |t|
      t.integer :number
      t.references :pitch_booking, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
