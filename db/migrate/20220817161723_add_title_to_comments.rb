class AddTitleToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :review_id, :integer
  end
end
