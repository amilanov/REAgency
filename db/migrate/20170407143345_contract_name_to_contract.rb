class ContractNameToContract < ActiveRecord::Migration
  def up
    add_column :contracts, :contractName, :string
  end

  def down
  end
end
