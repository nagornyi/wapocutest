Given /I have successfully logged in as "(.*)" user using "(.*)" password/ do |username, password|
	@login_page = php_login_site.login_page.open
	@user_page = @login_page.login_as username, password
	@user_page.should be_logged_in
end

Given /I have alternatively logged in as "(.*)" user using "(.*)" password/ do |username, password|
	@login_page = php_login_site.login_page
	@login_page.open
	@login_page.login_as_alternative username, password
	@user_page = php_login_site.user_page	
	@user_page.should be_logged_in
end

When /I signout/ do
	@login_page = @user_page.signout
end

Then /I should return to (.*)/ do |title|
	@login_page.loaded? title
end

When /I search for "(.*)"/ do |text|
	@search_page = google_site.search_page.open	
	@results_page = google_site.search_page.search text
end

And /now I close the (.*) site/ do |site|
	case site
		when 'PhpLogin' then $php_login_site.close; $php_login_site=nil
		when 'Google' then $google_site.close; $google_site=nil
	end
	$current_site=nil
end

Then /I should see "(.*)" text on the search results page/ do |text|
	Watir::Wait.until { @results_page.contain? text }
end

When /the current page on (.*) site has fully loaded/ do |site|
	case site
		when 'Php Login' then Watir::Wait.until { $php_login_site.load_status == 'complete' }
		when 'Google' then Watir::Wait.until { $google_site.load_status == 'complete' }
	end
end

When /the current page on (.*) site has loaded enough and the user can interact with it/ do |site|
	case site
		when 'Php Login' then Watir::Wait.until { $php_login_site.load_status == 'interactive' }
		when 'Google' then Watir::Wait.until { $google_site.load_status == 'interactive' }
	end
end

When /the current page on (.*) site is still loading/ do |site|
	case site
		when 'Php Login' then Watir::Wait.until { $php_login_site.load_status == 'loading' }
		when 'Google' then Watir::Wait.until { $google_site.load_status == 'loading' }
	end
end

