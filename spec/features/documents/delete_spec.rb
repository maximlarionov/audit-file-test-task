require "rails_helper"

feature "User can delete document" do
  let!(:document) { create(:document_doc) }

  def delete_button
    find("a.btn.btn-danger", text: "Delete")
  end

  before do
    visit documents_path
  end

  scenario "I can delete existing document" do
    expect(page).to have_content("document-doc.doc")

    delete_button.click

    expect(page).to have_content("Document was successfully destroyed.")
    expect(page).not_to have_content("document-doc.doc")
  end
end
