class ServiceStatus < EnumerateIt::Base
  associate_values(
    operativo:    [0, 'Operativo'],
    averiado:     [1, 'Averiado']
  )

  sort_by :value
end
