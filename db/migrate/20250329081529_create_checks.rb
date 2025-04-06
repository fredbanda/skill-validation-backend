class CreateChecks < ActiveRecord::Migration[8.0]
  def change
    create_table :checks do |t|
      t.datetime :created_at
      t.string :image
      t.string :number
      t.references :company, null: false, foreign_key: true
    end
  end
end
