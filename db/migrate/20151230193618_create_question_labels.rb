class CreateQuestionLabels < ActiveRecord::Migration
  def change
    create_table :question_labels do |t|
      t.references :question, index: true, foreign_key: true
      t.references :label, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
