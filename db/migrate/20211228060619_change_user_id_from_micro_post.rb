class ChangeUserIdFromMicroPost < ActiveRecord::Migration[6.1]
  def change
    change_table :microposts do |t|
      t.change :user_id, :bigint
    end
  end
end
