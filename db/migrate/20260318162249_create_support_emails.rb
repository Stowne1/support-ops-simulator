class CreateSupportEmails < ActiveRecord::Migration[8.1]
  def change
    create_table :support_emails do |t|
      t.references :user, null: true, foreign_key: true
      t.references :ticket, null: true, foreign_key: true
      t.string :from_email
      t.string :to_email
      t.string :subject
      t.text :body
      t.datetime :received_at
      t.boolean :processed

      t.timestamps
    end
  end
end
