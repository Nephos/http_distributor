module CrystalProxy
  class Domain

    @mutex : Mutex
    @config : Configuration
    @next_usage_at : Time

    def initialize(@config = nil)
      @mutex = Mutex.new
      @next_usage_at = Time.now
    end

    def next_usage
      nu = (@next_usage_at - Time.now).to_f
      nu < 0 ? 0.0 : nu
    end

    def wait_for_lock
      @mutex.lock
      begin
        sleep next_usage
        yield
      ensure
        @mutex.unlock
      end
    end

    def use(config : Configuration? = nil)
      res = nil
      wait_for_lock do
        config = config || @config
        delay = Delay.to { res = yield }
        @next_usage_at = Time.now + Time::Span.new 0, 0, delay * config.wait_delay_coeficient + config.wait
      end
      res
    end

  end
end
