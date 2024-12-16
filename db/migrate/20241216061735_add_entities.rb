class AddEntities < ActiveRecord::Migration[7.2]
  def change
    create_table :emission_factors do |t|
      t.string :name, default: '', null: false
      t.decimal :quantity, precision: 10, scale: 2, default: 0.0, null: false
      t.string :unit, default: '', null: false

      t.timestamps
    end

    create_table :emission_calculations do |t|
      t.boolean :processed_at

      t.timestamps
    end

    create_table :emission_calculation_items do |t|
      t.references :emission_calculation, null: false, foreign_key: true
      t.references :emission_factor, foreign_key: true

      t.decimal :quantity, precision: 10, scale: 2, default: 0.0, null: false
      t.string :unit, default: '', null: false

      t.decimal :computed_emission_in_grams, precision: 10, scale: 2

      t.string :error_message, default: '', null: false

      t.timestamps
    end
  end
end
