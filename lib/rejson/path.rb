# frozen_string_literal: true

module Rejson
  # Represents a Path in JSON value
  class Path

    ROOT = "$"
    
    attr_accessor :str_path

    def self.root_path
      root = Path.new(Path::ROOT)
      root
    end

    def initialize(path, include_root=false)
      @str_path = (include_root ? "#{Path::ROOT}#{path}" : path)
    end
  end
end
