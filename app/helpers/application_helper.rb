module ApplicationHelper
	def edit_and_destroy_buttons(item)
		unless current_user.nil?
			edit = link_to('Edit', url_for([:edit, item]), class:"btn btn-primary")
			del = link_to('Destroy', item, method: :delete,
				data: {confirm: "Are you sure you want to delete #{item.name}?"}, class:"btn btn-danger")
			raw("#{edit} #{del}")
		end
	end
end
