ActiveAdmin.register Solicitud do
  permit_params :description, :estado

  index do
    selectable_column
    id_column
    column :nombre
    column :estado
    actions
  end

  filter :nombre
  filter :estado

  form do |f|
    f.inputs "Solocitud Details" do
      f.input :nombre
      f.input :estado
    end
    f.actions
  end
end