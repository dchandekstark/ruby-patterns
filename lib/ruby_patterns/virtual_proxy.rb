module RubyPatterns
  class VirtualProxy

    attr_reader :__key
    private :__key

    attr_accessor :__real
    private :__real=, :__real

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

    protected

    def method_missing(name, *args, &block)
      if !__real
        __load
      end
      __real.send(name, *args, &block)
    end

    private

    def __load
      raise NotImplementedError
    end

    def __state
      __real ? LOADED : GHOST
    end

  end
end
