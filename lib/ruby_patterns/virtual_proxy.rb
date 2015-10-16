module RubyPatterns
  module VirtualProxy

    def self.included(base)
      base.class_eval do
        attr_reader :__key
        attr_accessor :__real

        class << self
          attr_accessor :loader
        end
      end
    end

    # @param key [Object] key used by the loader to load the real object
    def initialize(key)
      @__key = key
      @__real = nil
      self
    end

    protected

    def method_missing(name, *args, &block)
      if __real.nil?
        self.__real = self.class.loader.call(__key)
      end
      __real.send(name, *args, &block)
    end

  end
end
