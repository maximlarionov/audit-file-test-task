require "rails_helper"

feature "Upload Documents" do
  before do
    visit documents_path
  end

  scenario "I can upload document" do
    expect(current_path).to eq documents_path

    click_link "New Document"

    expect(page).to have_content("Create Document")
    expect(current_path).to eq new_document_path

    attach_file "document_attachment", File.join(Rails.root, "/spec/fixtures/document-doc.doc")

    click_button "Create Document"

    expect(page).to have_content("document-doc.doc")

    click_link "Document Viewer"

    expect(page).to have_content("document-doc.doc")
  end
end
