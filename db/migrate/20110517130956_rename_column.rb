class RenameColumn < ActiveRecord::Migration
  def self.up
    rename_column :posts, :categoria_id, :categorium_id
  end

  def self.down
    rename_column :posts, :categorium_id, :categoria_id
  end
end

