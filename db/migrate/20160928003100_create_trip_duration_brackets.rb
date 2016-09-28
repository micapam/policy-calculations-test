class CreateTripDurationBrackets < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_duration_brackets do |t|
      t.integer :min
      t.integer :max

      t.timestamps
    end
  end
end
