require 'rubygems'
require 'dotenv/load'
require 'active_record'
require 'active_support'
require 'erb'
require 'capybara'
require 'webdrivers'
require 'selenium-webdriver'
require 'active_support/time'
require 'rest-client'
require 'google_drive'
require 'byebug'
require 'logger'


project_root = File.dirname(File.absolute_path(__FILE__))
config_database_yml_file = File.join(project_root, 'config', 'database.yml')
config_database_yml = YAML::load(ERB.new(File.read(config_database_yml_file)).result)

# データベース接続の定義. created_at などで ActiveSupport::TimeWithZone を返してもらうための設定。
Time.zone = 'Tokyo'
ActiveRecord::Base.establish_connection(config_database_yml['development'])
ActiveRecord::Base.time_zone_aware_attributes = true
ActiveRecord::Base.logger = Logger.new(STDOUT)

require "#{project_root}/app/models/application_record"
Dir.glob(project_root + '/app/models/*.rb').each { |f| require f }
Dir.glob(project_root + '/lib/*.rb').each { |f| require f }
require "#{project_root}/lib/spreadsheet/base_report"
Dir.glob(project_root + '/lib/**/*.rb').each { |f| require f }



if $0 == __FILE__
  begin
    puts "#{Time.now} start update asp report job"

    
    puts "#{Time.now} end update asp report job"

  rescue => e
    puts "Failed to update asp report."
    puts "#{e}: #{e.message}\n" + e.backtrace.join("\n")
  end
end