class CreateJoinTableProjectsUsers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :projects, :users do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
