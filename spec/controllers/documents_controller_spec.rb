require "rails_helper"

describe DocumentsController do
  let(:params) do
    { document:
      { attachment: Rack::Test::UploadedFile.new(
        File.open(File.join(Rails.root, "/spec/fixtures/document-doc.doc"))
      ) }, format: :html
    }
  end

  subject { response }

  describe "#index" do
    before { get :index }

    it { is_expected.to be_success }
  end

  describe "#create" do
    def do_create
      post :create, params
    end

    context "with valid params" do
      subject { do_create }

      it "creates new document" do
        expect { subject }.to change { Document.count }.by(1)
      end

      it { expect(response.status).to eq(200) }
    end

    # context "with invalid params" do
    #   subject { post :create, document: { attachment: nil } }

    #   it "does not create new document" do
    #     expect { subject }.not_to change { Document.count }
    #   end

    #   it { is_expected.to render_template(:new) }
    # end
  end

  describe "#destroy" do
    let!(:document) { create(:document_doc) }

    it "deletes the document" do
      expect { delete :destroy, id: document }.to change(Document, :count).by(-1)
    end
  end
end
