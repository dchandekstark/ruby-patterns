require 'ruby_patterns/virtual_proxy'

module RubyPatterns
  RSpec.describe VirtualProxy do

    let(:proxy_class) do
      Class.new do
        include VirtualProxy
        self.loader = lambda { |key| Array.new(10, key) }
      end
    end

    let(:key) { "foo" }

    describe "initialization" do
      it "should not load the real object" do
        expect(Array).not_to receive(:new)
        proxy = proxy_class.new("foo")
      end
    end

    describe "method_missing" do
      it "should load the real object" do
        expect(Array).to receive(:new).with(10, key).and_call_original
        proxy = proxy_class.new("foo")
        expect(proxy.size).to eq(10)
      end
    end

  end
end
