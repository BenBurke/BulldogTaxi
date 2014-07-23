module ApplicationHelper

	def displayPhoneNumber(input)
	    if input.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
	      areaCode = "(" + $1.to_s + ") "
	      result = areaCode + [$2, $3].join("-")
	      return result
	    end
	end

	def outputDateTime(datetime)
	 	date = datetime.strftime("%B #{datetime.day.ordinalize}, %Y")
	 	time = datetime.strftime("%H:%M").split(":")
	 	hour = time[0].to_i
	 	if hour >= 12
	 		time[0] = (hour - 12).to_s
	 		time = time.join(":") + " PM"
	 	else 
	 		time = time.join(":") + " AM"
	 	end 
	 	return result = [date, time]
	end 

	
end
