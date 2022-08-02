class Organisation < ApplicationRecord
  has_many :users

  enum employee_range: %i[1–50(small) 51–100(small/medium) 101–500(medium) 501–1000(large) 1001–5000(large) 5000+(large)]
  enum status: %i[active deactive]

end
