class ApplicationController < ActionController::Base

  before_action :set_locale
   
  def set_locale
    I18n.locale = extract_locale_from_accept_language_header || I18n.default_locale
  end

  private
    def extract_locale_from_accept_language_header
      params[:locale] || request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end

    def default_url_options
      { locale: I18n.locale }
    end
end


