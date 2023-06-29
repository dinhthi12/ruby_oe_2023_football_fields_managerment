class CreatePitches < ActiveRecord::Migration[6.1]
  def change
    create_table :pitches do |t|
      t.string :name
      t.integer :pitch_type
      t.integer :rate
      t.bigint :hour_price

      t.timestamps
    end
  end
end
