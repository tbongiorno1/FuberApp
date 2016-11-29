class CreateQueueTaskEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :queue_task_emails do |t|
      t.string :email
      t.string :queue_task_emails
      t.references :subscriber, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.boolean :sent
      t.boolean :opened
      t.boolean :bounced
      t.datetime :day_to_send

      t.timestamps
    end
  end
end
