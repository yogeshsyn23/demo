class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.date :date
      t.string :domain
      t.integer :value
      t.belongs_to :user,index: true
      t.belongs_to :fileinfo,index: true
      t.timestamps
    end
  end
end
