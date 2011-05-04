class CreateComentarios < ActiveRecord::Migration
  def self.up
    create_table :comentarios do |t|
      t.string :titulo
      t.string :cuerpo
      t.integer :post_id
      t.integer :usuario_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comentarios
  end
end
