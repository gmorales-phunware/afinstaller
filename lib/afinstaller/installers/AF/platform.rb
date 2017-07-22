require 'thor/group'
require 'pathname'
require 'fileutils'
include FileUtils

module Afinstaller
  module Installers
    class AFPlatform < Thor::Group
      argument :version, :type => :string
      argument :platform, :type => :string
      include Thor::Actions

      def self.source_root
        File.dirname(__FILE__)
      end

      def clone_command
        v = "#{version}"
        plat = "#{platform}"

        # Create directory and change directory into created dir.
        FileUtils::mkdir "AF-#{version}-#{plat}" unless File.exists?("AF-#{version}-#{plat}")
        FileUtils.cd("AF-#{version}-#{plat}", :verbose => false)
        puts Rainbow("== Cloning Repo ==").cyan
        if platform.downcase == "ios"
          system! 'git clone -b release/v'+v+' ssh://git@bitbucket.phunware.com:7999/af/af-template-ios.git' unless File.exist?('af-template-ios')
        else
          system! 'git clone -b v'+v+' ssh://git@bitbucket.phunware.com:7999/af/af-template-android.git' unless File.exist?('af-template-android')
        end
        puts Rainbow("== Cloning Succeeded ==").magenta
      end

      def dependency_install_command
        puts Rainbow("== Moving to project folder ==").cyan

        if platform.downcase == "ios"
          FileUtils.cd('af-template-ios', :verbose => false)
          puts Rainbow("== Folder is now af-template-ios ==").magenta

          puts Rainbow("== Attempting to run pod install ==").cyan
          system! 'pod install'
          puts Rainbow("== Cocoapod installation completed ==").magenta
        else
          FileUtils.cd('af-template-android', :verbose => false)
          puts Rainbow("== Folder is now af-template-android ==").magenta
        end
      end

      def open_project_folder
        puts Rainbow("== Open project folder ==").cyan
        system! 'open .'
        puts Rainbow("== AF Installer process completed. Thank you ==").magenta
      end

    end
  end
end
