require "rails_helper"

describe AttachmentUploader do
  its(:extension_white_list) { is_expected.to eq %w(doc docx xls xlsx) }
end
