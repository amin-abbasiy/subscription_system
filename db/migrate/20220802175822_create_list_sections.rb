class CreateListSections < ActiveRecord::Migration[7.0]
  def change
    create_table :list_sections do |t|
      t.string :title
      t.json :list

      t.timestamps
    end
  end
end
