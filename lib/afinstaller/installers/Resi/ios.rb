require 'thor/group'
require 'pathname'
require 'fileutils'
include FileUtils

module Afinstaller
  module Installers
    class IOSResi < Thor::Group
      argument :version, :type => :string
      include Thor::Actions

      def self.source_root
        File.dirname(__FILE__)
      end

      def clone_command
        v = "#{version}"
        FileUtils::mkdir "AF-Resi-#{version}-iOS" unless File.exists?("AF-Resi-#{version}-iOS")
        FileUtils.cd("AF-Resi-#{version}-iOS", :verbose => false)
        puts Rainbow("== Cloning Repo ==").cyan
        system! 'git clone -b release/v'+v+' ssh://git@bitbucket.phunware.com:7999/resi/resi-template-ios.git' unless File.exist?('resi-template-ios')
        puts Rainbow("== Cloning Succeeded ==").magenta
      end

      def pod_install_command
        puts Rainbow("== Moving to project folder ==").cyan
        FileUtils.cd('resi-template-ios', :verbose => false)
        puts Rainbow("== Folder is now af-template-ios ==").magenta

        puts Rainbow("== Attempting to run pod install ==").cyan
        system! 'pod install'
        puts Rainbow("== Cocoapod installation completed ==").magenta
      end

      def open_project_folder
        puts Rainbow("== Open project folder ==").cyan
        system! 'open .'
        puts Rainbow("== AF Installer process completed. Thank you ==").magenta
      end

    end
  end
end
