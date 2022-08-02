class CreateOrganisations < ActiveRecord::Migration[7.0]
  def change
    create_table :organisations do |t|
      t.string :name
      t.integer :employee_range
      t.string :ext_id
      t.string :access_code
      t.integer :status

      t.timestamps
    end

    add_index :organisations, :ext_id
  end
end
