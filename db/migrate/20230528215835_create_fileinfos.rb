class CreateFileinfos < ActiveRecord::Migration[7.0]
  def change
    create_table :fileinfos do |t|
      t.string :name
      t.belongs_to :user,index: true
      t.timestamps
    end
  end
end
