class AddUserIdToFits < ActiveRecord::Migration
  def change
    add_reference :fits, :user, index: true, foreign_key: true
  end
end
