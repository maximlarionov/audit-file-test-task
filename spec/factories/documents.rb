# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document_docx, class: Document do
    name "MyString"
    attachment Rack::Test::UploadedFile.new(
      File.open(
        File.join(
          Rails.root, "/spec/fixtures/document-docx.docx")))
  end

  factory :document_doc, class: Document do
    name "MyString"
    attachment Rack::Test::UploadedFile.new(
      File.open(
        File.join(
          Rails.root, "/spec/fixtures/document-doc.doc")))
  end

  factory :document_xlsx, class: Document do
    name "MyString"
    attachment Rack::Test::UploadedFile.new(
      File.open(
        File.join(
          Rails.root, "/spec/fixtures/document-xlsx.xlsx")))
  end
end
