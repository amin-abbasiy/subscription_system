class Section < ApplicationRecord
  belongs_to :template
  has_many :comments, dependent: :destroy

  delegated_type :sectionable, types: %w[ TextSection ListSection AttachmentSection ], dependent: :destroy
end
