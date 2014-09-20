class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user,  :index   => true
      t.references :entry, :index   => true
      t.boolean    :up,    :default => true

      t.timestamps
    end
  end
end
