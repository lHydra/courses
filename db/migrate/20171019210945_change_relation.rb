class ChangeRelation < ActiveRecord::Migration[5.0]
  def change
    create_table :courses_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true
    end
    remove_column :courses, :user_id
  end
end
