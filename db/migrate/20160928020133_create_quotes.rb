class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.integer :age
      t.integer :trip_duration

      t.timestamps
    end
  end
end
