class Feedback < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product, optional: true

  enum rating: { no_rating: "no_rating", bad: "bad", unpleasant: "unpleasant", ordinary: "ordinary", good: "good", excellent: "excellent" }
  enum feedback_type: { review: "review", bug: "bug", feature_request: "feature_request" }

  has_one_attached :file

  validates :feedback_type, presence: true
  validates :content, presence: true
end
