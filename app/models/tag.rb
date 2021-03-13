class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy, foeign_key: 'tag_id'
  has_many :posts, through: :post_tags
end
