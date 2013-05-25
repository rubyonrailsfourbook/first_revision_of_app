module ApplicationHelper
	def user_name_url(user)
		if user.url
			link_to user.name, user.url, rel: "nofollow"
		else
			user.name
		end
	end
end
