class AddAuthorToLines < ActiveRecord::Migration[6.0]
  def change
    add_column(:lines, :author_id, :integer)
  end
end
