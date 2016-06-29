module HttpDistributor
  class Domain

    @mutex : Mutex
    @config : Configuration
    @next_usage_at : Time
    @usages : Array(Time)

    getter mutex, config, next_usage_at, usages
    setter config, next_usage_at

    def initialize(@config = nil)
      @mutex = Mutex.new
      @next_usage_at = Time.now
      @usages = [] of Time
    end

    def next_usage
      nu = (@next_usage_at - Time.now).to_f
      nu < 0 ? 0.0 : nu
    end

    private def wait_for_lock
      @mutex.lock
      begin
        sleep next_usage
        yield
      ensure
        @mutex.unlock
      end
    end

    # remove the elements in @usages older than `seconds`
    private def clear_usages_from!(seconds)
      t = Time.now - Time::Span.new(0, 0, seconds)
      @usages.shift @usages.index{|e| e > t} || 0
    end

    def use(config : Configuration? = nil)
      res = nil
      wait_for_lock do
        config = config || @config
        @usages << Time.now
        clear_usages_from! @config.keep_log_duration # avoid memory leak by cleaning the array
        delay = Delay.to { res = yield }
        @next_usage_at = Time.now + Time::Span.new 0, 0, delay * config.wait_delay_coefficient + config.wait
      end
      res
    end

    def to_h
      {
        "next_usage_at" => next_usage_at.to_s,
        "usage_count" => usages.size,
        "usages" => usages.map{|t| t.to_s}
      }
    end

  end
end
