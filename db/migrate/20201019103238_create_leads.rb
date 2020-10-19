class CreateLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :leads do |t|
      t.string :name
      t.text :description
      t.string :status
      t.integer :amount
      t.integer :probability

      t.timestamps
    end
  end
end
