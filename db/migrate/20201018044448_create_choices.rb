class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.integer :word_id
      t.string :choices
      t.boolean :correct_ans

      t.timestamps
    end
  end
end
