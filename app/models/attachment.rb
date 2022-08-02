class Attachment < Media
  has_one :section, as: :sectionable, touch: true
end
