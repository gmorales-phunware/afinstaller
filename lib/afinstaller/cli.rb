require 'thor'
require 'afinstaller'
require 'afinstaller/installers/iOS/iOS'
require 'afinstaller/installers/iOS/iOSBuild'
require 'afinstaller/installers/Android/android'
require 'afinstaller/installers/Android/androidBuild'

module Afinstaller
  class CLI < Thor
    desc "portray ITEM", "Determines if a piece of food is gross or delicious"
    method_option :build, :aliases => "-b", :desc => "Build project after cloning repo."
    def iOS(version)
      build_project = options[:build]
      if build_project
        puts "Building with -b flag"
        Afinstaller::Installers::IOSBuild.start([version])
      else
        puts "Building without -b flag"
        Afinstaller::Installers::IOS.start([version])
      end
    end


  end
end
