class Feedback < ApplicationRecord
  belongs_to :user

  enum rating: { no_rating: "no_rating", bad: "bad", unpleasant: "unpleasant", ordinary: "ordinary", good: "good", excellent: "excellent" }
  enum feedback_type: { review: "review", bug: "bug", feature_request: "feature_request" }

  validates :feedback_type, presence: true
  validates :content, presence: true
end
