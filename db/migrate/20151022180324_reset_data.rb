class ResetData < ActiveRecord::Migration
  def self.up
    Depot.create_depots
    Employee.create_employee
  end
end
