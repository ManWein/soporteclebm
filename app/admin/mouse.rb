ActiveAdmin.register Mouse do
  menu parent: "Componentes"
  permit_params :computer_id, :marca, :modelo, :serial, :bien_nacional, :estatus

  index do
    selectable_column
    id_column
    column :computer
    column :marca
    column :modelo
    column :serial
    column :bien_nacional
    column :estatus
    actions
  end

  filter :marca
  filter :modelo
  filter :serial
  filter :bien_nacional
  filter :estatus

  form do |f|
    f.inputs "Mouse Details" do
      f.input :computer, :as => :select, :collection => Computer.all.map{|c| [c.bien_nacional,c.id]}
      f.input :marca
      f.input :modelo
      f.input :serial
      f.input :bien_nacional
      f.input :estatus
    end
    f.actions
  end
end