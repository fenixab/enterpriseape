class RemoveSalespersonIdFromInvoices < ActiveRecord::Migration[5.0]
  def change
  	remove_column :invoices, :salesperson_id, :integer
  	add_column :invoices, :employee_id, :integer
  end
end
