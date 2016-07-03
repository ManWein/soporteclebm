ActiveAdmin.register Computer do
  permit_params :marca, :modelo, :serial, :bien_nacional, :tarjeta_madre, :procesador, :memoria_ram, :disco_duro, :cdrom, :sistema_operativo, :en_red, :software_extra, :estatus_servicio, :tipo, :estatus, :keyboard_attributes => [:id, :marca, :modelo, :serial, :bien_nacional, :estatus], :screen_attributes => [:id, :marca, :modelo, :serial, :bien_nacional, :pulgadas, :estatus], :mouse_attributes => [:id, :marca, :modelo, :serial, :bien_nacional, :estatus], :regulator_attributes => [:id, :marca, :modelo, :serial, :bien_nacional, :estatus]

  index do
    selectable_column
    id_column
    column :marca
    column :modelo
    column :serial
    column('Tipo') { |s| ComputerType.key_for(s.tipo).to_s.humanize }
    column('Estatus de Servicio') { |s| ServiceStatus.key_for(s.estatus_servicio).to_s.humanize }
    actions
  end

  filter :marca
  filter :modelo
  filter :serial
  filter :estatus_servicio, as: :select, collection: ServiceStatus.to_a
  filter :tipo, as: :select, collection: ComputerType.to_a
  filter :estatus

  show do |businessnew|
    attributes_table do
      rows :id, :marca, :modelo, :serial, :bien_nacional, :tarjeta_madre, :procesador, :memoria_ram, :disco_duro, :cdrom, :sistema_operativo, :en_red, :software_extra
      row('Estatus de Servicio') { |b| ServiceStatus.key_for(b.estatus_servicio).to_s.humanize }
      row('Tipo') { |b| ComputerType.key_for(b.tipo).to_s.humanize }
      rows :estatus, :created_at, :updated_at
    end

    panel 'Keyboard' do
      attributes_table_for computer.keyboard do
        rows :marca, :modelo, :serial, :bien_nacional, :estatus
      end
    end

    panel 'Screen' do
      attributes_table_for computer.screen do
        rows :marca, :modelo, :serial, :bien_nacional, :pulgadas, :estatus
      end
    end

    panel 'Mouse' do
      attributes_table_for computer.mouse do
        rows :marca, :modelo, :serial, :bien_nacional, :estatus
      end
    end

    panel 'Regulator' do
      attributes_table_for computer.regulator do
        rows :marca, :modelo, :serial, :bien_nacional, :estatus
      end
    end
  end

  form do |f|
    f.inputs "Computer Details"  do
      f.input :marca
      f.input :modelo
      f.input :serial
      f.input :bien_nacional
      f.input :tarjeta_madre
      f.input :procesador
      f.input :memoria_ram
      f.input :disco_duro
      f.input :cdrom
      f.input :sistema_operativo
      f.input :en_red
      f.input :software_extra
      f.input :estatus_servicio, as: :select, collection: ServiceStatus.to_a
      f.input :tipo, as: :select, collection: ComputerType.to_a
      f.input :estatus

      f.inputs "Keyboard", for: [:keyboard, (f.object.keyboard || Keyboard.new)] do |t|
        t.input :id, as: :hidden
        t.input :marca
        t.input :modelo
        t.input :serial
        t.input :bien_nacional
        t.input :estatus
      end

      f.inputs "Screen", for: [:screen, (f.object.screen || Screen.new)] do |t|
        t.input :id, as: :hidden
        t.input :marca
        t.input :modelo
        t.input :serial
        t.input :bien_nacional
        t.input :pulgadas
        t.input :estatus
      end

      f.inputs "Mouse", for: [:mouse, (f.object.mouse || Mouse.new)] do |t|
        t.input :id, as: :hidden
        t.input :marca
        t.input :modelo
        t.input :serial
        t.input :bien_nacional
        t.input :estatus
      end

      f.inputs "Regulator", for: [:regulator, (f.object.regulator || Regulator.new)] do |t|
        t.input :id, as: :hidden
        t.input :marca
        t.input :modelo
        t.input :serial
        t.input :bien_nacional
        t.input :estatus
      end
    end
    f.actions
  end

end
