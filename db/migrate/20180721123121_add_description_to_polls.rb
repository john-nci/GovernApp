class AddDescriptionToPolls < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :description, :text
  end
end
