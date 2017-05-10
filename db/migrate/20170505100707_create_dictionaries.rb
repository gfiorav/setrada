class CreateDictionaries < ActiveRecord::Migration[5.1]
  def change
    create_table :dictionaries, id: :uuid do |t|
      t.string :locator, null: false
      t.integer :privacy, null: false, default: 0
      t.belongs_to :user, type: :uuid

      t.timestamps
    end
  end
end
