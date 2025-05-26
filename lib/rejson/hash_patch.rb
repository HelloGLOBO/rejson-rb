# frozen_string_literal: true

require 'active_support/hash_with_indifferent_access'

module Rejson
  module HashPatch
    def []=(key, value)
      processed_value = if value.is_a?(Hash) || value.respond_to?(:to_h)
                          JSON.generate(value.to_h)
                        else
                          value
                        end
      super(key, processed_value)
    end

    def [](key)
      value = super(key)
      parse_json_value(value)
    end

    def bulk_get(*keys)
      super(*keys).transform_values { |v| parse_json_value(v) }
    end

    private

    def parse_json_value(value)
      return value if value.nil?
      
      parsed = JSON.parse(value) rescue value
      if parsed.is_a?(Hash)
        ActiveSupport::HashWithIndifferentAccess.new(parsed)
      else
        parsed
      end
    end
  end
end

Redis::HashKey.prepend(Rejson::HashPatch)