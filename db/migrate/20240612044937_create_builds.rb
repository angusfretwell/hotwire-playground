class CreateBuilds < ActiveRecord::Migration[7.1]
  def change
    create_table :builds do |t|
      t.string :title

      t.timestamps
    end
  end
end
