# application_controller.rb

class ApplicationController < ActionController::Base
    before_action :switch_locale
  
    def switch_locale
      I18n.locale = locale_from_header || I18n.default_locale
    end
  
    def locale_from_header
      accept_language = request.env['HTTP_ACCEPT_LANGUAGE']
      return nil if accept_language.nil? # Agrega esta línea para manejar el caso en que 'accept_language' sea nil
      accept_language.scan(/^[a-z]{2}/).first
    end
  end
  