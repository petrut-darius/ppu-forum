class Post < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :subforum
end
