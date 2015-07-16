require "rails_helper"

describe "AttachmentValidator" do
  let(:validator) { AttachmentValidator.new }

  context "when attachment is valid" do
    let(:document) { create(:document_docx) }

    it "should be valid" do
      expect(validator.validate(document)).to be true
    end
  end

  context "when attachment is valid" do
    let(:document) { build(:document_docx, attachment: nil) }

    it "should not be valid" do
      expect(validator.validate(document)).not_to be true
    end
  end
end
