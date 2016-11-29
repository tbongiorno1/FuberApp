class AddFieldToQueue < ActiveRecord::Migration[5.0]
  def change
    add_column :queue_task_emails, :opened_date, :datetime
  end
end
