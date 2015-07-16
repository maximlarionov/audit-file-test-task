class AttachmentValidator < ActiveModel::Validator
  def validate(record)
    if no_attachments?(record)
      record.errors[:base] << "Please add an attachment"
    else
      true
    end
  end

  def no_attachments?(record)
    record.remote_attachment_url.blank? && !record.attachment.present?
  end
end
