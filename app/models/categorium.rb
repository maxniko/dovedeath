class Categorium < ActiveRecord::Base
  has_many :posts
  validates_presence_of :nombre
end

