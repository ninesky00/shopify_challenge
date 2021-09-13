class ChangeArtistToOwner < ActiveRecord::Migration[6.1]
  def change
    rename_column :images, :artist, :owner
  end
end
