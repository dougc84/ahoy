require "addressable/uri"
require "browser"
require "geocoder"
require "referer-parser"
require "request_store"
require "ahoy/version"
require "ahoy/controller"
require "ahoy/model"
require "ahoy/engine"

module Ahoy
  def self.visit_model
    ::Visit
  end

  def self.referrer_parser
    @referrer_parser ||= RefererParser::Referer.new
  end
end

ActionController::Base.send :include, Ahoy::Controller
ActiveRecord::Base.send(:extend, Ahoy::Model) if defined?(ActiveRecord)