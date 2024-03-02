# frozen_string_literal: true

module Rejson
  class Configuration

    attr_accessor :protocol

    def initialize
      @protocol = :v2
    end

    def isRESP2?
      @protocol == :v2
    end

    def isRESP3?
      @protocol == :v3
    end

  end
end