class ComputerType < EnumerateIt::Base
  associate_values(
    desktop:    [0, 'Desktop'],
    laptop:     [1, 'Laptop']
  )

  sort_by :value
end
