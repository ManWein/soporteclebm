class SolicitudStatus < EnumerateIt::Base
  associate_values(
    pendiente:    [0, 'Pendiente'],
    en_curso:     [1, 'En Curso'],
    finalizado:   [2, 'Finalizado'],
    otro:         [3, 'Otro']
  )

  sort_by :value
end
