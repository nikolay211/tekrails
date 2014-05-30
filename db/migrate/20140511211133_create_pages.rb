class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.string :page
    end
  end

  def down
    drop_table :pages
  end
end