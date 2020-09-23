class CreateProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.boolean :winner
      t.text :description
      t.decimal :value
      t.references :user, foreign_key: true
      t.references :need, foreign_key: true

      t.timestamps
    end
  end
end
