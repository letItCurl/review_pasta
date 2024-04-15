class Feedback < ApplicationRecord
  MAX_FREE_FEEDBACKS = 3
  belongs_to :user, optional: true
  belongs_to :product, optional: true

  enum rating: { no_rating: "no_rating", bad: "bad", unpleasant: "unpleasant", ordinary: "ordinary", good: "good", excellent: "excellent" }
  enum feedback_type: { review: "review", bug: "bug", feature_request: "feature_request" }

  has_one_attached :file

  validates :feedback_type, presence: true
  validates :content, presence: true

  validate :max_free_feedbacks

  private

  def max_free_feedbacks
    if self.product.feedbacks > Feedback::MAX_FREE_FEEDBACKS
      self.errors.add(:base, "You don't have any more credits available.")
    end
  end
end
