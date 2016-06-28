module CrystalProxy
  class Configuration

    # Probability for each request to use a new user agent
    @change_agent_probability : NumericValue
    # Duration to wait before any new request on a domain
    @wait_fixed : NumericValue
    # Duration range to wait before any new request on a domain
    @wait_random : Range(Float64, Float64)?
    # Coeficient to multiply the delay before any new request on a domain
    # delay = wait + ping * coeficient
    @wait_delay_coeficient : NumericValue

    getter change_agent_probability, wait_fixed, wait_random, wait_delay_coeficient
    setter change_agent_probability, wait_fixed, wait_random, wait_delay_coeficient

    def initialize(@change_agent_probability = 0.05,
      @wait_fixed = 1,
      @wait_random = nil,
      @wait_delay_coeficient = 1.0
      )
    end

    def wait : NumericValue
      if @wait_random.nil?
        @wait_fixed
      else
        rand @wait_random as Range(Float64, Float64)
      end
    end

  end
end
