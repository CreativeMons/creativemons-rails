class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string   :token, :index => true, :unique => true
      t.string   :kind,  :index => true
      t.string   :title
      t.text     :content
      t.datetime :start_date
      t.datetime :end_date
      t.string   :author_name
      t.string   :author_email
      t.string   :url
      t.string   :picture

      t.timestamps
    end
  end
end
