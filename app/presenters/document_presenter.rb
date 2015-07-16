class DocumentPresenter < BasePresenter
  attr_reader :document

  delegate :id, :attachment, to: :document
  delegate :to_key, :to_param, :persisted?, :to_model, to: :document

  def initialize(document)
    @document = document
  end

  def name
    attachment.file.filename
  end

  def path
    attachment.url
  end

  def content_ms_word
    yomu.text
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

  def self.model_name
    Document.model_name
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

  def yomu
    Yomu.new attachment
  end
end
