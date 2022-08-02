class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.string :name
      t.bigint :referencer_id
      t.bigint :referenced_id
      t.references :template, foreign_key: true

      t.timestamps
    end

    add_index :sections, :referenced_id
    add_index :sections, :referencer_id
  end
end
