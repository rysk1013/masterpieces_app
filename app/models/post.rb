class Post < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :overview
    validates :programming_languages
    validates :techs
    validates :portfolio_url
    validates :github_url
  end
end
