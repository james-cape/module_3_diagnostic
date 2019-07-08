class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :ndbno
      t.string :name
      t.string :group
      t.string :ds
      t.string :manu

      t.timestamps
    end
  end
end
