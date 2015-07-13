require "yomu"
require "docx"
require "docx/html"

class Document < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  def content
    yomu.text
  end

  def content_docx
    docx.to_html
  end

  private

  def docx
    Docx::Document.open(Document.first.attachment.current_path)
  end

  def yomu
    Yomu.new attachment
  end
end
