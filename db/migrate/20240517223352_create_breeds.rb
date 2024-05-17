class CreateBreeds < ActiveRecord::Migration[7.1]
  def change
    create_table :breeds do |t|
      t.string :name
      t.text :description
      t.integer :min_life
      t.integer :max_life
      t.boolean :hypoallergenic

      t.timestamps
    end
  end
end
