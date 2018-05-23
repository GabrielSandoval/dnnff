class CreateTradingBots < ActiveRecord::Migration[5.0]
  def change
    create_table :trading_bots do |t|

      t.timestamps
    end
  end
end
