require 'hermann'

module Hermann
  module Provider
    class AbstractProducer
      def connected?
        raise NotImplementedError
      end

      def errored?
        raise NotImplementedError
      end

      def connect(*args)
        raise NotImplementedError
      end

      def push_single(*args)
        raise NotImplementedError
      end

      def tick(*args)
        raise NotImplementedError
      end
    end
  end
end
