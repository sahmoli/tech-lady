class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.datetime :activity_date
      t.string :address

      t.timestamps
    end
  end
end
