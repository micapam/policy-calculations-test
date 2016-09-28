class CreateAgeBrackets < ActiveRecord::Migration[5.0]
  def change
    create_table :age_brackets do |t|
      t.integer :min
      t.integer :max

      t.timestamps
    end
  end
end
