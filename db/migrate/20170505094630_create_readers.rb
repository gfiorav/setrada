class CreateReaders < ActiveRecord::Migration[5.1]
  def change
    create_table :readers, id: :uuid do |t|
      t.string(:username, unique: true, null: false)

      t.timestamps
    end
  end
end
