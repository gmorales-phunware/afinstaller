require 'active_support/inflector'

module Afinstaller
  class IOS
    def self.iOS(version)
      puts Rainbow("Working #{version}").magenta
      puts Rainbow("iOS!").cyan
      if version == "4.5.0"
        "Correct!"
      end
    end
  end
end
