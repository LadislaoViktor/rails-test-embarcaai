# frozen_string_literal: true

class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.belongs_to :states, null: false, foreign_key: true

      t.timestamps
    end
  end
end
