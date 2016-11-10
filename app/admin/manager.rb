ActiveAdmin.register Manager do
  menu parent: "Users"
  permit_params :email, :password, :password_confirmation, :type, :active, :manager_info_attributes => [:id, :name, :username, :cedula, :tlf]

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :username
    #column :cedula
    #column :tlf    
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
        t.input :cedula
        t.input :tlf
      end
    end
    f.actions
  end
end
