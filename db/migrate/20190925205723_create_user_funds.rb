class CreateUserFunds < ActiveRecord::Migration[5.2]
  def change
    create_table :user_funds do |t|
      t.references :user, foreign_key: true
      t.references :fund, foreign_key: true

      t.timestamps
    end
  end
end
