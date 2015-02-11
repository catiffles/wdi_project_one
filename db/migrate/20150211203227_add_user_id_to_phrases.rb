class AddUserIdToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :user_id, :integer
  end
end
