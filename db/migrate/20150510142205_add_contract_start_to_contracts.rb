class AddContractStartToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :contactStart, :datetime

    add_column :contracts, :contractEnd, :datetime

  end
end
