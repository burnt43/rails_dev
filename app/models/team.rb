class Team < ActiveRecord::Base

  def self.does_table_exist?(tenant)
    result = connection.execute("SHOW TABLES LIKE 'teams_#{tenant.id}'").each { return true }
    false
  end
  
  def self.create_table_for_tenant(tenant)
    connection.execute("CREATE TABLE teams_#{tenant.id} (id INTEGER(11) NOT NULL AUTO_INCREMENT,name VARCHAR(255), wins INTEGER, loses INTEGER, PRIMARY KEY(id))")
  end

  def self.add_columns_for_tenant(tenant,column_names)
    return unless column_names && column_names.length > 0
    add_column_commands = Array.new
    column_names.each { |column_name|
      add_column_commands.push( "ADD COLUMN #{column_name} INTEGER" ) 
    }
    sql_string = "ALTER TABLE teams_#{tenant.id} " + add_column_commands.join(",")
    connection.execute(sql_string)
  end

end
