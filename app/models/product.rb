class Product < ApplicationRecord
  belongs_to :user
  has_many :feedbacks

  validates :name, presence: true
  validates :thank_you_title, presence: true
  validates :thank_you_content, presence: true
end
