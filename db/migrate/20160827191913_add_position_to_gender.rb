class AddPositionToGender < ActiveRecord::Migration[5.0]
  def change
    add_column :genders, :position, :integer, null: false, default: 0
  end
end
