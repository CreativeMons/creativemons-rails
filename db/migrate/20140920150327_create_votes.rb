class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user,                         :index => true
      t.references :entry,                        :index => true
      t.string     :decision, :default => 'none', :index => true
      t.string     :token,    :unique  => true,   :index => true

      t.timestamps
    end
  end
end
