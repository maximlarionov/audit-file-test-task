class Document < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  scope :by_newest, -> { order("created_at DESC") }

  default_scope { by_newest }

  validates_with AttachmentValidator
end
