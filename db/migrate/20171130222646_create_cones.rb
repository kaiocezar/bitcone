class CreateCones < ActiveRecord::Migration[5.1]
  def change
    create_table :cones do |t|
      t.monetize :price
      t.string :status

      t.timestamps
    end
  end
end
