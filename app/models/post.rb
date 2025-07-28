class Post < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :subforum
  has_many :replies
  has_many :notification_mentions, as: :record, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    [ "question", "description_of_question" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "base_tags", "subforum", "tag_taggings", "taggings", "tags" ]
  end
end
