class RemoveUserIdFromLines < ActiveRecord::Migration[6.0]
  def change
    remove_column(:lines, :user)
  end
end
