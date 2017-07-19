require 'active_support/inflector'

module Afinstaller
  class Platform
    def self.platform(name)
      if name.downcase == "ios"
        "iOS!"
      else
        "Android"
      end
    end
  end
end
