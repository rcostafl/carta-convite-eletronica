class AddCoordinatesToNeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :needs, :latitude, :float
    add_column :needs, :longitude, :float
  end
end
