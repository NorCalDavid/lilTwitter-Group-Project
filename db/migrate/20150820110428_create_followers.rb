###########################################
### Followers Migration
###########################################

class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :user_id
      t.integer :follower_id, foreign_key: { references: :users }
      t.boolean :blocked
      t.timestamps null: false
    end
  end
end
