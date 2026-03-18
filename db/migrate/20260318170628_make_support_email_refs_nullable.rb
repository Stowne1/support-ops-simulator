class MakeSupportEmailRefsNullable < ActiveRecord::Migration[8.1]
  def change
    change_column_null :support_emails, :user_id, true
    change_column_null :support_emails, :ticket_id, true
  end
end
