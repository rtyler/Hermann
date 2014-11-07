require 'ffi'

require 'hermann/errors'
require 'hermann/provider/abstract_producer'

module Hermann
  module Provider
    class FFIProducer < AbstractProducer
      extend FFI::Library
      ffi_lib 'rdkafka'

      attr_reader :brokers

      # Initialize a librdkafka-backed Producer class which relies on FFI to
      # call into the shared library
      #
      # @param [String] brokers A list of comma separated host:port pairs
      # @return [FFIProducer]
      def initialize(brokers)
        validate_brokers!(brokers)
        @brokers = brokers
      end

      # Connect to the Kafka brokers
      #
      # @param [Integer] timeout_sec Seconds to timeout a connection
      #   attempt after
      # @return [Boolean] True if we've successfully connected
      def connect(timeout_sec)
      end

      private

      def validate_brokers!(brokers)
        if brokers.nil?
          raise Hermann::Errors::ConfigurationError
        end

        brokers.split(',').each do |broker|
          # Make sure we've got a host:port pair
          host, port = broker.split(':')
          if host.nil? || port.nil?
            raise Hermann::Errors::ConfigurationError
          end

          port = port.to_i

          # We should have a valid port number
          if (port <= 0) || (port > 65536)
            raise Hermann::Errors::ConfigurationError
          end
        end
      end
    end
  end
end
