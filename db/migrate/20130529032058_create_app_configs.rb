class CreateAppConfigs < ActiveRecord::Migration
  def change
    create_table :app_configs do |t|
      t.text :config_str
      t.integer :application_id
      t.timestamps
    end
  end
end
