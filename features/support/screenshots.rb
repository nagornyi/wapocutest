module Screenshots
	def screenshot browser
		t=Time.new

		# Format the day
		if(t.day.to_s.length == 1)
		  strDay = '0' + t.day.to_s
		else
		  strDay = t.day.to_s
		end

		# Format the month
		if(t.month.to_s.length == 1)
		  strMonth = '0' + t.month.to_s
		else
		  strMonth = t.month.to_s
		end

		# Format the year
		strYear = t.year.to_s

		# Format the hour
		if(t.hour.to_s.length == 1)
		  strHour = '0' + t.hour.to_s
		else
		  strHour = t.hour.to_s
		end

		# Format the minutes
		if(t.min.to_s.length == 1)
		  strMinutes = '0' + t.min.to_s
		else
		  strMinutes = t.min.to_s
		end

		# Format the seconds
		if(t.sec.to_s.length == 1)
		  strSeconds = '0' + t.sec.to_s
		elsif (t.sec.to_s.length == 0)
		  strSeconds = '00'
		else
		  strSeconds = t.sec.to_s
		end

		# Create the time string
		strTime = '-' + strDay + strMonth + strYear + '_' + strHour + '_' + strMinutes + '_' + strSeconds

		browser.driver.save_screenshot "./screenshots/screenshot#{strTime}.png"
		embed "./screenshots/screenshot#{strTime}.png", 'image/png'
	end
end
World(Screenshots)

