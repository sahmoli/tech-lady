class CreateImgs < ActiveRecord::Migration
  def change
    create_table :imgs do |t|
      t.string :path
      t.string :description

      t.timestamps
    end
  end
end
