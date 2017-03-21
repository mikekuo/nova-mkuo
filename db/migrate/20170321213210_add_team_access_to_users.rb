class AddTeamAccessToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :team_access, :boolean
  end
end
