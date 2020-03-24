class CreateQuote < ActiveRecord::Migration[5.1]
    def change
      create_table :quotes do |t|
        t.string :line
        t.integer :movie_id
        t.integer :character_id
      end
    end
  end