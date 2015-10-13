module RubyPatterns
  class VirtualProxy

    private

    attr_reader :__key
    attr_accessor :__real

    public

    GHOST = "GHOST"
    LOADED = "LOADED"

    def initialize(key)
      @__key = key
      @__real = nil
    end

    def to_s
      __key
    end

    def inspect
      "#<#{self.class.name} key=#{__key.inspect} #{__state}>"
    end

    def __load
      raise NotImplementedError, "Subclasses must implement `__load`."
    end

    def __state
      if __real.nil?
        GHOST
      else
        LOADED
      end
    end

    protected

    def method_missing(name, *args, &block)
      if __real.nil?
        __load
      end
      __real.send(name, *args, &block)
    end

  end
end
