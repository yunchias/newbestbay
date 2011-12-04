class Addcatidtoitems < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.references :category
    end
  end
end
