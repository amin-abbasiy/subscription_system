class TextSection < ApplicationRecord
  has_one :section, as: :sectionable, touch: true
end
