module Afinstaller
  module Installers
    class ResiPlatformBuild < Thor::Group
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
        FileUtils::mkdir "AF-Resi-#{version}-#{plat}" unless File.exists?("AF-Resi-#{version}-#{plat}")
        FileUtils.cd("AF-Resi-#{version}-#{plat}", :verbose => false)
        puts Rainbow("== Cloning Repo ==").cyan
        if platform.downcase == "ios"
          system! 'git clone -b release/v'+v+' ssh://git@bitbucket.phunware.com:7999/resi/resi-template-ios.git' unless File.exist?('resi-template-ios')
        else
          system! 'git clone -b v'+v+' ssh://git@bitbucket.phunware.com:7999/resi/resi-template-android.git' unless File.exist?('resi-template-android')
        end
        puts Rainbow("== Cloning Succeeded ==").magenta
      end

      def dependency_install_command
        puts Rainbow("== Moving to project folder ==").cyan

        if platform.downcase == "ios"
          FileUtils.cd('resi-template-ios', :verbose => false)
          puts Rainbow("== Folder is now resi-template-ios ==").magenta

          puts Rainbow("== Attempting to run pod install ==").cyan
          system! 'pod install'
          puts Rainbow("== Cocoapod installation completed ==").magenta
        else
          FileUtils.cd('resi-template-android', :verbose => false)
          puts Rainbow("== Folder is now resi-template-android ==").magenta
          puts Rainbow("== Attempting Gradle Clean ==").cyan
          system! './gradlew clean :app:assembleDebug --parallel --daemon --configure-on-demand -PminSdk=21'
          puts Rainbow("== Gradle successful ==").magenta
        end
        
      rescue NoMethodError => e
        puts Rainbow("== Something went wrong. Please try again. ==").red
        exit 1

      end

      def build_attmept
        puts Rainbow("== Attempting to build project ==").cyan
        if platform.downcase == "ios"
          system! 'xcodebuild -scheme GenericResi -workspace GenericResi.xcworkspace/ -sdk iphonesimulator build | xcpretty'
        else
          system! 'adb install -r app/build/outputs/apk/app-$1-debug.apk'
          system! 'adb shell monkey -p com.phunware.appframework.sample.generic_template.$1 -c android.intent.category.LAUNCHER 1'
        end
        puts Rainbow("== Project built successfully ==").magenta

      rescue NoMethodError => e
        puts Rainbow("== Something went wrong. Please try again. ==").red
        exit 1
      end

      def open_project_folder
        puts Rainbow("== Open project folder ==").cyan
        system! 'open .'
        puts Rainbow("== AF Installer process completed. Thank you ==").magenta
      end

    end
  end
end
