module ApplicationHelper
	def full_title(file_title)
		base_title="Responsive ROR"
		if file_title.empty?
			base_title

		else 
			"#{base_title} | #{file_title}"
		end
	end
end
