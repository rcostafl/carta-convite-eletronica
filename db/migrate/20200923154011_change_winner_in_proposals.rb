class ChangeWinnerInProposals < ActiveRecord::Migration[6.0]
  def change
    change_column :proposals, :winner, :boolean, default: false
  end
end
