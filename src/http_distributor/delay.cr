module HttpDistributor
  class Delay

    @min : Float64
    @max : Float64

    getter min, max
    setter min, max

    def initialize(min : NumericValue, max : NumericValue)
      @min = min.to_f64
      @max = max.to_f64
    end

    def get
      rand(min..max)
    end

    def wait
      sleep get
      yield
    end

    def self.to : Float64
      tStart = Time.now
      result = yield
      tEnd = Time.now
      (tEnd - tStart).to_f
    end

    def to : Float64
      Delay.to { yield }
    end

  end
end
