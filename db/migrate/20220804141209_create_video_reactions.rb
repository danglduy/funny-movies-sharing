class CreateVideoReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :video_reactions do |t|
      t.references :video, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :reaction_type, null: false

      t.timestamps
    end
  end
end
