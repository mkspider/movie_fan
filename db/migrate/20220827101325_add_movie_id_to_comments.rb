class AddMovieIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :movie_id, :integer
  end
end
