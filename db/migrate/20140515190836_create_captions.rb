class CreateCaptions < ActiveRecord::Migration
  def change
    create_table :captions do |t|
      t.string :message
      t.integer :user_id
      t.timestamps
    end
  end
end
