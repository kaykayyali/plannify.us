module OrganizersHelper
	def pretty_date(date)
		return date.strftime("%B %-d, %Y at %l:%M ")
	end
end
