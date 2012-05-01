require 'cucumber/rake/task'
require 'fileutils'

Cucumber::Rake::Task.new

desc "Remove old screenshots"
task :remove_screenshots do
	screenshots_path = "#{File.dirname(__FILE__)}/screenshots/"
	FileUtils.rm_rf screenshots_path
	Dir.mkdir(screenshots_path)
end

desc "Execute all features and scenarios except @under_construction"
Cucumber::Rake::Task.new(:default) do |task|
	task.cucumber_opts = ["-t ~@under_construction --format junit --out reports --format html --out report.html --format pretty"]
end

task :default => :remove_screenshots

