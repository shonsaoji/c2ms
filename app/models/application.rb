class Application < ActiveRecord::Base
  attr_accessible :name
  has_many :app_configs

  after_find :get_configs

  def get_configs
  	latest_configs = self.app_configs.last

	configs = latest_configs.nil? ? [] : JSON.parse(latest_configs.config_str)
	self[:configs] = configs
	self[:revision] = latest_configs.nil? ? false : latest_configs.id
  end

  def add_config(params)
  	latest_configs = self.app_configs.last
	configs = latest_configs.nil? ? [] : JSON.parse(latest_configs.config_str)
	new_configs = {
		key: params['key'],
		value: params['value'],
	}
	configs << new_configs
	app_config = AppConfig.create(:config_str => configs.to_json, :application_id => self.id)
  end

  def update_config(params)
  	latest_configs = self.app_configs.last
	configs = latest_configs.nil? ? [] : JSON.parse(latest_configs.config_str)
	configs.delete_if { |c| c['key'] == params['key']}
	new_configs = {
		key: params['key'],
		value: params['value'],
	}
	configs << new_configs
	app_config = AppConfig.create(:config_str => configs.to_json, :application_id => self.id)
  end  
end
