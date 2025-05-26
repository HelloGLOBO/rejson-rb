# frozen_string_literal: true

module Rejson

  class << self
    attr_accessor :config
  end

  def self.config
    @config ||= Rejson::Configuration.new
  end

  def self.reset
    @config = Rejson::Configuration.new
  end

  def self.configure
    yield(config)
  end
end


require "rejson/version"
require "rejson/configuration"
require "rejson/path"
require "rejson/client"
require "rejson/hash_patch"
