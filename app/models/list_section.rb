class ListSection < ApplicationRecord
  has_one :section, as: :sectionable, touch: true
end
