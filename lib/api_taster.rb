require 'jquery-rails'
require 'bootstrap-sass'
require 'active_support/dependencies'
require 'api_taster/engine'
require 'api_taster/route'
require 'api_taster/mapper'
require 'api_taster/form_builder'
require 'base64'

module ApiTaster
  mattr_accessor :global_params
  mattr_accessor :credentials

  self.global_params = {}


  def self.routes(&block)
    Route.mappings = Proc.new { block }
  end

  def self.basic_authentication_header
  	return nil unless self.credentials
  	 "Basic #{::Base64.strict_encode64("#{credentials[:username]}:#{credentials[:password]}")}"
  end

  class Exception < ::Exception; end
end
