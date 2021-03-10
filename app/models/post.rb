class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destory

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
