class ServiceType < EnumerateIt::Base
  associate_values(
    soporte_tecnico:             [0, 'Soporte Tecnico'],
    soporte_usuario:     [1, 'Soporte Usuario'],
    induccion:           [2, 'Inducción'],
    desarrollo:          [3, 'Desarrollo'],
    otro:                [4, 'Otro']
  )

  sort_by :value
end
