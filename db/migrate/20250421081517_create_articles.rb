class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :sub_title
      t.integer :article_type
      t.text :description
      t.string :media_url
      t.datetime :publish_date
      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end

    add_reference :articles, :user, null: false, foreign_key: true
  end
end
