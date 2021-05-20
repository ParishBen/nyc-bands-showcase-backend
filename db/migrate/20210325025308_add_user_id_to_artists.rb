class AddUserIdToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :user_id, :integer
  end
end
