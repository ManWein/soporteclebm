class ComputerType < EnumerateIt::Base
  associate_values(
    desktop:    [0, 'Desktop'],
    laptop:     [1, 'Laptop'],
    otro:       [2, 'Otro']
  )

  sort_by :value
end