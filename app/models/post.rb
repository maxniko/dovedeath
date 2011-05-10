class Post < ActiveRecord::Base
    belongs_to :categorium
    belongs_to :usuario
end

