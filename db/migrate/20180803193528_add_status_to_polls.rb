class AddStatusToPolls < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :status, :text
  end
end
