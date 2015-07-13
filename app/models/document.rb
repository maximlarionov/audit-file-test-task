require "yomu"

class Document < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  def content
    yomu.text
  end

  private

  def yomu
    Yomu.new attachment
  end
end
