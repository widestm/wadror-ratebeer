module UsersHelper
	def toggle_account_status(user)
		if user.frozen_account	
			button = link_to "Reactivate account", toggle_frozen_status_user_path(@user.id), method: :post, class: "btn btn-success"
		else
			button = link_to "Freeze account", toggle_frozen_status_user_path(@user.id), method: :post, class: "btn btn-danger"
		end
		raw ("#{button}")

	end
end
