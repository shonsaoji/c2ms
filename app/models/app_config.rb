class AppConfig < ActiveRecord::Base
  attr_accessible :application_id, :config_str, :revision

  belongs_to :application
  after_find :generate_configs

  def generate_configs
  	self[:configs] = JSON.parse(self.config_str)

  end
end
