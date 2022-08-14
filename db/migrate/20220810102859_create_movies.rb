class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|

      t.string:filmname
      t.text:introduction
      t.integer:genre_id
      t.timestamps
    end
  end
end
