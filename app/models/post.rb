class Post < ActiveRecord::Base
    belongs_to :categorium
    belongs_to :usuario
    validates_presence_of :categorium
    validates_presence_of :titulo
end

