FactoryGirl.define do
 factory :docx do
   attachment Rack::Test::UploadedFile.new(
    File.open(
      File.join(
        Rails.root, '/spec/fixtures/document.docx')))
 end
end
