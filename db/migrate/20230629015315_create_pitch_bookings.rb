class CreatePitchBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :pitch_bookings do |t|
      t.datetime :time_start
      t.datetime :time_end
      t.bigint :total_price
      t.integer :status, default: 0
      t.text :des
      t.string :phone
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :pitch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
