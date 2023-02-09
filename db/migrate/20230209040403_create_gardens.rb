class CreateGardens < ActiveRecord::Migration[7.0]
  def change
    create_table :gardens do |t|
      t.string :name
      t.text :description
      t.integer :zip
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
