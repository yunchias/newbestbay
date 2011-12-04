class Addflagstoitems < ActiveRecord::Migration
  def change
    add_column :items, :flags, :string
  end
end
