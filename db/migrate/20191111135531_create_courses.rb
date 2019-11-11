class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.references :user_id, foreign_key: true
      t.string :name
      t.string :category
      t.text :description
      t.string :address

      t.timestamps
    end
  end
end
