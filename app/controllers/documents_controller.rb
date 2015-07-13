class DocumentsController < ApplicationController
  respond_to :html

  expose(:document, attributes: :document_params)
  expose(:documents) { Document.page(params[:page]) }

  def create
    flash[:notice] = "Document was successfully created." if document.save
    redirect_to documents_path
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
    params.require(:document).permit(:name, :attachment)
  end
end
