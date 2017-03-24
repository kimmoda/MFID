class CreateFits < ActiveRecord::Migration
  def change
    create_table :fits do |t|
      t.string :caption

      t.timestamps null: false
    end
  end
end
