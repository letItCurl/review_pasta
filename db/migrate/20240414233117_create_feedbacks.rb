class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks, id: :uuid do |t|
      t.string :feedback_type, default: "review"
      t.references :user, null: true, foreign_key: true, type: :uuid
      t.text :content
      t.string :rating, default: "no_rating"
      t.string :email

      t.timestamps
    end
  end
end
