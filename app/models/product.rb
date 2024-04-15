class Product < ApplicationRecord
  belongs_to :user
  has_many :feedbacks, dependent: :destroy

  validates :name, presence: true
  validates :thank_you_title, presence: true
  validates :thank_you_content, presence: true


  validate :max_free_products

  private

  def max_free_products
    if self.user.products.count > 2
      self.errors.add(:base, "You don't have any more credits available.")
    end
  end
end
