class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.integer :cost
      t.references :age_bracket, foreign_key: true
      t.references :trip_duration_bracket, foreign_key: true

      t.timestamps
    end
  end
end
