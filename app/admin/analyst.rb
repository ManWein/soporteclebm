ActiveAdmin.register Analyst do
  menu parent: "Users"
  permit_params :email, :password, :password_confirmation, :type, :active, :analyst_info_attributes => [:id, :name, :username]

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
    f.inputs "Analyst Details" do
      f.input :email
      f.input :active
      f.input :password
      f.input :password_confirmation
      f.inputs "Basic Info", for: [:analyst_info, (f.object.analyst_info || AnalystInfo.new)] do |t|
        t.input :id, as: :hidden
        t.input :name
        t.input :username
      end
    end
    f.actions
  end
end
