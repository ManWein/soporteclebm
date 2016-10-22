class ServiceStatus < EnumerateIt::Base
  associate_values(
    operativo:       [0, 'Operativo'],
    averiado:        [1, 'Averiado'],
    desincorporado:  [2, 'Desincorporado']
  )

  sort_by :value
end
