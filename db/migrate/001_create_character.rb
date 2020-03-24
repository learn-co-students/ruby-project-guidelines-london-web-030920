class CreateCharacter < ActiveRecord::Migration[5.1]
    def change
      create_table :characters do |t|
        t.string :first_name
        t.string :last_name
        t.integer :age
        t.string :sex
      end
    end
  end