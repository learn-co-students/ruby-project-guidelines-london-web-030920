class CreatePlayers < ActiveRecord::Migration[5.0]
    def change
        create_table :players do |t|
            t.string :name
            t.integer :age
            t.string :position
            t.boolean :injured
            t.string :injury_start
            t.string :injury_predicted_end
        end
    end

end