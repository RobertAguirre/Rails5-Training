class AdminUser < ApplicationRecord

  has_and_belongs_to_many :pages
  has_many :section_edits
  #Since we renamed table admin_users
  #Also when working with legacy databases that dont follow convention
    # self.table_name = "admin_users"

    # -- Or -- change the class name and file name

end
