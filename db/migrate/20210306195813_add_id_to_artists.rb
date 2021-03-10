class AddIdToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :artist_id, :string
  end
end
