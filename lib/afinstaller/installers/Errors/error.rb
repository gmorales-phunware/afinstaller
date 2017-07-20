require 'thor/group'
require 'pathname'
require 'fileutils'
include FileUtils

module Afinstaller
  module Installers
    class Error < Thor::Group
      argument :error, :type => :string
      include Thor::Actions

      def print_error
        puts Rainbow("== Error: #{error} ==").red
        exit 1
      end

    end
  end
end
