###########################################
### Followers Migration
###########################################

class CreateFollowers < ActiveRecord::Migration
  def change
    t.references :user

  end
end
