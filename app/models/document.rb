class Document < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  def name
    attachment.file.filename
  end

  def content_ms_word
    if attachment_is_docx?
      docx_document.to_html
    else
      yomu.text
    end
  end

  def attachment_ms_excel
    if attachment_is_xlsx?
      xlsx_document
    else
      yomu.text
    end
  end

  def extension
    File.extname(attachment.current_path.to_s)
  end

  private

  def attachment_is_docx?
    File.extname(attachment.current_path.to_s) == ".docx"
  end

  def attachment_is_xlsx?
    File.extname(attachment.current_path.to_s) == ".xlsx"
  end

  def xlsx_document
    RubyXL::Parser.parse(attachment.current_path)
  end

  def docx_document
    Docx::Document.open(attachment.current_path)
  end

  def yomu
    Yomu.new attachment
  end
end
