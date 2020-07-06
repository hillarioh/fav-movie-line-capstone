class AddMovieTitleToLines < ActiveRecord::Migration[6.0]
  def change
    add_column :lines,:movie_title, :string
  end
end
