class Subforum < ApplicationRecord
  acts_as_taggable_on :tags
  has_many :posts
end
