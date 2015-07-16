require "rails_helper"

feature "See Documents" do
  let!(:document) { create(:document_doc) }

  before do
    visit documents_path
  end

  scenario "I see documents#index page" do
    expect(current_path).to eq documents_path
    expect(page).to have_content("document-doc.doc")
  end
end
