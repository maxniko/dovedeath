class Categorium < ActiveRecord::Base
  has_many :posts, :dependent => :restrict
  validates_presence_of :nombre
end

