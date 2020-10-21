class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :user_id
      t.string :category_id

      t.timestamps
    end
  end
end
