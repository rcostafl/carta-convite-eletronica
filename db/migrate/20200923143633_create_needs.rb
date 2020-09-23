class CreateNeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :needs do |t|
      t.string :title
      t.text :description
      t.string :address
      t.text :verdict
      t.string :status, default: "aberta"
      t.datetime :deadline
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
