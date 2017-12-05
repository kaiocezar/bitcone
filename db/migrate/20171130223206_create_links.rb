class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.integer :position
      t.belongs_to :user, index: true
      t.belongs_to :cone, index: true

      t.timestamps
    end
  end
end
