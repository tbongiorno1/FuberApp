class CreateCourseSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :course_subscribers do |t|
      t.references :subscriber, foreign_key: true, index: true
      t.references :course, foreign_key: true, index: true

      t.timestamps
    end
  end
end
