require "rails_helper"

describe Document do
  let(:document) { create(:document_docx) }

  subject { document }

  its(:name) { is_expected.to eq "document-docx.docx" }
  its(:extension) { is_expected.to eq ".docx" }
  its(:content_ms_word) { is_expected.to include "ms docx file example" }

  context "when document is .doc" do
    let(:document) { create(:document_doc) }

    its(:name) { is_expected.to eq "document-doc.doc" }
    its(:extension) { is_expected.to eq ".doc" }
    its(:content_ms_word) { is_expected.to include "ms doc file example" }
  end
end
