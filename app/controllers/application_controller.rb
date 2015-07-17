class ApplicationController < ActionController::Base
  rescue_from Errno::ENOENT, with: :record_not_found
  protect_from_forgery with: :exception
  responders :flash

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private

  def record_not_found
    render file: "public/422", status: 422
  end
end
