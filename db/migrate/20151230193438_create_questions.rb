class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :description, null: false
      t.integer :view_count, default: 0, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
