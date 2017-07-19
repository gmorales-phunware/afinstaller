require 'thor'
require 'afinstaller'

module Afinstaller
  class CLI < Thor

    def platform(name)
      # puts Foodie::Food.portray(name)
      puts Afinstaller::Platform.platform(name)
    end

    def call
      puts ""
      puts "******** Latest Video Games and Reviews ********"
      puts ""
      self.start
    end

    def start
      puts "Select a platform"
    end

  end
end
