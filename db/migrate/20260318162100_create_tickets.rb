class CreateTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :tickets do |t|
      t.references :user, null: true, foreign_key: true
      t.string :subject
      t.text :description
      t.string :status
      t.string :priority
      t.string :source
      t.string :assigned_to

      t.timestamps
    end
  end
end
