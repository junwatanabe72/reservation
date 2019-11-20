class AddTermOfUseToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :term_of_use, :text
  end
end
