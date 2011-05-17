class AddCategoriumIdToPost < ActiveRecord::Migration
  def self.up
    remove_column :posts, :categoria_id
    add_column :posts, :categorium_id, :integer
  end

  def self.down
    remove_column :posts, :categorium_id
  end
end

