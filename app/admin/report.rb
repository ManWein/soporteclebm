ActiveAdmin.register Report do
  menu parent: "Solicitudes"
  permit_params :tipo_servicio, :detalle_servicio, :estatus

  index do
    selectable_column
    id_column
    column :tipo_servicio
    column :detalle_servicio
    column :estatus
    actions
  end

  filter :tipo_servicio
  filter :estatus

  form do |f|
    f.inputs "Solicitud Details" do
      f.input :tipo_servicio
      f.input :detalle_servicio
      f.input :estatus
    end
    f.actions
  end
end