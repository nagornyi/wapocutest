require 'rubygems'
require 'watir-webdriver'

$: << File.dirname(__FILE__)+'/../objects'
require 'browser.rb'
Dir["#{File.dirname(__FILE__)}/../objects/sites/*_site.rb"].each {|r| load r }
Dir["#{File.dirname(__FILE__)}/../objects/pages/*_page.rb"].each {|r| load r }
Dir["#{File.dirname(__FILE__)}/../objects/elements/*_element.rb"].each {|r| load r }

module SiteHelper
	# Add a symbol for each site under test, name convention is: class MyGreatSite = :my_great_site
	[:php_login_site, :google_site].each do |site|
		define_method site do
			init_site __method__
		end
	end

private
	def init_site site_name
		site_name = site_name.to_s
		$current_site = site_name
		class_name = site_name.capitalize.gsub(/(.)_(.)/) {"#{$1}#{$2.capitalize}"}.gsub(/_/, '')
		return eval "
		$#{site_name} ||= (#{class_name}.new(Watir::Browser.new :firefox) if ENV['WBROWSER']=='ff')
		$#{site_name} ||= (#{class_name}.new(Watir::Browser.new :ie) if ENV['WBROWSER']=='ie')
		$#{site_name} ||= (#{class_name}.new(Watir::Browser.new :chrome) if ENV['WBROWSER']=='chrome')
		"
	end
end

World(SiteHelper)

After do |scenario|	
	eval "screenshot $#{$current_site}.browser" if scenario.failed?
end

AfterStep do
	# Latency after each step (optional)
	# sleep 2
end

