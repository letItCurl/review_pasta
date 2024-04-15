class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :incentive_description
      t.text :thank_you_content
      t.string :thank_you_title

      t.timestamps
    end
  end
end
