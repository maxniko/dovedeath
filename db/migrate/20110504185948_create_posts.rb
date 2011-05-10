class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :titulo
      t.text :cuerpo
      t.integer :categoria_id
      t.integer :usuario_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end

