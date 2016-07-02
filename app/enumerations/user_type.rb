class UserType < EnumerateIt::Base
  associate_values(
    admin:      [0, 'Admin'],
    analyst:    [1, 'Analyst'],
    applicant:  [2, 'Applicant']
  )

  sort_by :value
end
