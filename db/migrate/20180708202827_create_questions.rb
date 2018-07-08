class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :kind
      t.references :poll, foreign_key: true

      t.timestamps
    end
  end
end
