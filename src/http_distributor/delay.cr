module HttpDistributor
  # Handle the sleeping time between 2 requests on a same domain
  class Delay
    @min : Float64
    @max : Float64

    getter min, max
    setter min, max

    def initialize(min : Number::Primitive, max : Number::Primitive? = nil)
      @min = min.to_f64
      @max = (max || min).to_f64
    end

    # Get a random duration between the maximum and minimum durations to wait
    def get
      rand(min..max)
    end

    # Make a pause (sleep) for a random duration (see `.get`)
    # and then execute a block
    def wait
      sleep get
      yield
    end

    def self.wait(min : Number::Primitive, max : Number::Primitive? = nil)
      sleep rand(min.to_f64..(max || min).to_f64)
      yield
    end

    # determine the time used to execute a block
    def self.to : Float64
      tStart = Time.now
      result = yield
      tEnd = Time.now
      (tEnd - tStart).to_f
    end

    # see `#to`
    def to : Float64
      Delay.to { yield }
    end
  end
end
