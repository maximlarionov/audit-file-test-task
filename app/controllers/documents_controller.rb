class DocumentsController < ApplicationController
  respond_to :html

  expose(:document, attributes: :document_params)
  expose(:documents) { Document.page(params[:page]) }

  expose(:document_presenter) { DocumentPresenter.wrap(document) }
  expose(:documents_presenter) { DocumentPresenter.wrap(documents) }

  def create
    if document.save
      flash[:notice] = "Document was successfully created."
      redirect_to documents_path
    else
      respond_with(document)
    end
  end

  def update
    flash[:notice] = "Document was successfully updated." if document.save
    respond_with(document)
  end

  def destroy
    document.destroy
    respond_with(document)
  end

  private

  def document_params
    params.require(:document).permit(:name, :attachment, :remote_attachment_url)
  end
end
