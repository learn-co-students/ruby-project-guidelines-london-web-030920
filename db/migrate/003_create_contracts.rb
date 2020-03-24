class CreateContracts < ActiveRecord::Migration[5.0]
    def change
        create_table :contracts do |t|
            t.date :start_day
            t.date :end_day
            t.float :wage
            t.float :transfer_fee
            t.integer :player_id
            t.integer :team_id
        end
    end
end
