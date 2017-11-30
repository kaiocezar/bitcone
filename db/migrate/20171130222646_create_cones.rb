class CreateCones < ActiveRecord::Migration[5.1]
  def change
    create_table :cones do |t|
      t.monetize :price
      t.string :status
      t.string :wallet_hash

      t.timestamps
    end
  end
end
