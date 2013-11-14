class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :search_name

      t.timestamps
    end
  end
end
