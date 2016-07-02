ActiveAdmin.register Manager do
  permit_params :email, :password, :password_confirmation, :type, :active, :manager_info_attributes => [:id, :name, :username]

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :active
    actions
  end

  filter :email
  filter :active
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Manager Details" do
      f.input :email
      f.input :active
      f.input :password
      f.input :password_confirmation
      f.inputs "Basic Info", for: [:manager_info, (f.object.manager_info || ManagerInfo.new)] do |t|
        t.input :id, as: :hidden
        t.input :name
        t.input :username
      end
    end
    f.actions
  end
end