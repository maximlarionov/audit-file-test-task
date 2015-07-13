require "yomu"
require "docx"
require "docx/html"

class Document < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  def content_docx
    if attachment_is_docx?
      docx.to_html
    else
      yomu.text.gsub("\n", "<br/>")
    end
  end

  def extension
    File.extname(attachment.current_path)
  end

  private

  def attachment_is_docx?
    File.extname(attachment.current_path) == ".docx"
  end

  def docx
    Docx::Document.open(attachment.current_path)
  end

  def yomu
    Yomu.new attachment
  end
end
