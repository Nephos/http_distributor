# v0.1.0
- Project initialization
- Features imported from RubyProxy (from the same author)
- Configuration of waiting duration between 2 requests on the same domain
  - random sleep time
  - fixed sleep time
  - latence coefficient
  - log duration
  - parameters settable from environment variables
  > D = coef * latence + delay
  where delay may be fixed or random
- Authentication token required
- Some specs and basic documentation
  - Readme
  - Basic comments
- Multiple monitoring tools
- Extensible architecture
