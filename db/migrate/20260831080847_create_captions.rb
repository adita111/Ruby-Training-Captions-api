class CreateCaptions < ActiveRecord::Migration[8.1]
  def change
    create_table :captions do |t|
      t.string :source_url
      t.text :text
      t.string :image_path

      t.timestamps
    end
  end
end
