ActiveAdmin.register Applicant do
  menu parent: "Users"
  permit_params :email, :password, :password_confirmation, :type, :active, :applicant_info_attributes => [:id, :name, :username, :cedula, :tlf, :cargo, :office_id]

  index do
    selectable_column
    id_column
    column :email
    #column :cedula
    #column :tlf
    #column :cargo
    #column :office_id
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
    f.inputs "Applicant Details" do
      f.input :email
      f.input :active
      f.input :password
      f.input :password_confirmation
      f.inputs "Basic Info", for: [:applicant_info, (f.object.applicant_info || ApplicantInfo.new)] do |t|
        t.input :id, as: :hidden
        t.input :name
        t.input :username
        t.input :cedula
        t.input :tlf
        t.input :cargo
        t.input :office_id
      end
    end
    f.actions
  end
end
