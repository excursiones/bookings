class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|      
      t.string :id_user, null: false
      t.string :id_excursion, null: false
      t.string :id_type, null: false, unique:true
      t.boolean :cancelled, null: false, default: false

      t.index [:id_type, :id_excursion, :id_user], :unique => true

      t.timestamps
    end
  end
end
