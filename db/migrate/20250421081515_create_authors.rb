class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
