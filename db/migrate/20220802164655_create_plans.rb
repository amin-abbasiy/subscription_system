class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :title, null: false
      t.string :amount, null: false
      t.integer :interval, null: false
      t.integer :interval_count, null: false
      t.integer :quantity
      t.string :additional_user_rate
      t.string :currency, null: false
      t.integer :trial_days, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
