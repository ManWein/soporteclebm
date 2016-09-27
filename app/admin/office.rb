ActiveAdmin.register Office do
  permit_params :nombre, :estatus

  index do
    selectable_column
    id_column
    column :nombre
    column :estatus
    actions
  end

  filter :nombre
  filter :estatus

  form do |f|
    f.inputs "Mouse Details" do
      f.input :nombre
      f.input :estatus
    end
    f.actions
  end
end