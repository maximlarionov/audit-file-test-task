require "rails_helper"

feature "See Documents" do
  let!(:document) { create(:document_xlsx) }

  before do
    visit documents_path
  end

  scenario "I can preview document" do
    expect(current_path).to eq documents_path
    expect(page).to have_content("document-xlsx.xlsx")

    click_link "Preview"

    expect(page).to have_content("Bluefin Credit Card Transaction Certification")
  end
end
