class RenamePassswordDigestColumToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :passsword_digest, :password_digest
  end
end
