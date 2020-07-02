class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :invitation_id, :invite_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
