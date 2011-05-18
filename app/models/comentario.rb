class Comentario < ActiveRecord::Base
  belongs_to :post
  belongs_to :usuario
  validates_presence_of :cuerpo
end
