class AddListingIdToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :listing_id, :integer
  end
end
