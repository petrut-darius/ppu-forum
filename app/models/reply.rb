class Reply < ApplicationRecord
  belongs_to :post
  belongs_to :user

  belongs_to :parent, class_name: "Reply", optional: true
  has_many :replies, class_name: "Reply", foreign_key: :post_id, dependent: :destroy
end
