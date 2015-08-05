module OrganizersHelper
	def pretty_date(date)
		return date.strftime("%B %-d, %Y at %l:%M ")
	end
	def pretty_date2(date)
		return date.strftime("%B %-d, %Y")
	end
end
