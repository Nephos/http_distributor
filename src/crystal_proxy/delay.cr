module CrystalProxy
  class Delay

    @min : NumericValue
    @max : NumericValue

    getter min, max
    setter min, max

    def initialize(@min, @max)
    end

    def get
      rand(min..max)
    end

    def wait
      sleep(wait)
      yield
    end

    def self.duration_to
      tStart = Time.now
      result = yield
      tEnd = Time.now
      tEnd - tStart
    end

  end
end
