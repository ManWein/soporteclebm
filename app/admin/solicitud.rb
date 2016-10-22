ActiveAdmin.register Solicitud do
  menu parent: "Solicitudes"
  permit_params :description, :estado

  index do
    selectable_column
    id_column
    column :description
    column :estado
    actions
  end

  filter :description
  filter :estado

  form do |f|
    f.inputs "Solocitud Details" do
      f.input :description
      f.input :estado
    end
    f.actions
  end
end