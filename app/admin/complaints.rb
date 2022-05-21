ActiveAdmin.register Complaint do
  permit_params :employee_id, :consumer_id, :text, :user_name, :phone, :address, :state

  action_item :solve, only: :show  do
    link_to "Solve", new_admin_complaint_solved_path(resource)
  end

  scope :all
  Complaint.states.keys.each do |state|
    scope state.pluralize.to_sym, group: :state
  end

  # permit_params do
  #   permitted = [:employee_id, :consumer_id, :text, :user_name, :phone, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
