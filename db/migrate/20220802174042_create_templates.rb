class CreateTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :templates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :organisation, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :comment_count
      t.integer :section_count

      t.timestamps
    end
  end
end
