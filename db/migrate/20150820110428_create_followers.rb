###########################################
### Followers Migration
###########################################

class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.references :user
    end
  end
end
