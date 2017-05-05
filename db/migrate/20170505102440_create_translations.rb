class CreateTranslations < ActiveRecord::Migration[5.1]
  def change
    create_table(:translations, id: :uuid) do |t|
      t.jsonb(:map, null: false)
      t.belongs_to(:dictionary, type: :uuid)

      t.timestamps
    end
  end
end
