class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name, null: false
      t.text :description, default: "", null: false
      t.boolean :available, default: true, null: false

      t.timestamps null: false
    end
  end
end
