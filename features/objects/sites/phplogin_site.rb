class PhpLoginSite < BrowserContainer
@@site_url = "http://localhost/phplogin"

	# Add a symbol for each page of the site, name convention is: class MyAmazingPage = :my_amazing_page
	[:login_page, :user_page].each do |page|
		define_method page do
			class_name = __method__.to_s.capitalize.gsub(/(.)_(.)/) {"#{$1}#{$2.capitalize}"}.gsub(/_/, '')
			eval "#{class_name}.new(@browser)"
		end
	end

	# Here you place all site-specific methods
end

