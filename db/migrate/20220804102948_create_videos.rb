class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :video_url
      t.string :title
      t.text :embed_code
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
