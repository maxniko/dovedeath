class AddCategoriumIdToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :categorium_id, :integer
  end

  def self.down
    remove_column :posts, :categorium_id
  end
end
