require 'thor'
require 'afinstaller'
require 'afinstaller/installers/Errors/error'
require 'afinstaller/installers/iOS/iOS'
require 'afinstaller/installers/iOS/iOSBuild'
require 'afinstaller/installers/Android/android'
require 'afinstaller/installers/Android/androidBuild'
require 'afinstaller/installers/Resi/platform'
require 'afinstaller/installers/Resi/platformBuild'

def system!(*args)
  system(*args) || abort(''+red('\n== Command #{args} failed =="')+'')
end

module Afinstaller
  class CLI < Thor
    check_unknown_options!
    def self.exit_on_failure?
    true
    end

    method_option :build, :aliases => "-b", :desc => "Build project after cloning repo."
    desc "iOS [version]", "CLI Installer for AF iOS "
    long_desc <<-LONGDESC
    `afinstaller iOS [version]` will clone the AF iOS repo with the version you specify. It will then run `pod install`,
    it will finally open the project folder.

    You can optionally specify the build flag [-b], which will build your project after cocoapod installation

    > $ afinstaller iOS 4.5.0 -b
  LONGDESC
    def iOS(version)
      build_project = options[:build]
      if version == "help"
        error = "Incorrect comment. Please try afinstaller help iOS"
        Afinstaller::Installers::Error.start([error])
      end

      if build_project
        Afinstaller::Installers::IOSBuild.start([version])
      else
        Afinstaller::Installers::IOS.start([version])
      end
    end

    method_option :build, :aliases => "-b", :desc => "Build project after cloning repo."
    desc "Android [version]", "CLI Installer for AF Android "
    long_desc <<-LONGDESC
    `afinstaller Android [version]` will clone the AF Android repo with the version you specify. It will it will
    finally open the project folder.

    You can optionally specify the build flag [-b], which will attempt to run Gradle Clean.
    This requires Java 8.0 and above.

    > $ afinstaller Android 4.5.0 -b
  LONGDESC
    def Android(version)
      build_project = options[:build]
      if version == "help"
        error = "Incorrect comment. Please try afinstaller help iOS"
        Afinstaller::Installers::Error.start([error])
      end

      if build_project
        Afinstaller::Installers::AndroidBuild.start([version])
      else
        Afinstaller::Installers::Android.start([version])
      end
    end


    method_option :build, :aliases => "-b", :desc => "Build project after cloning repo."
    desc "Resi [Platform] [Version]", "CLI Installer for AF Resi"
    long_desc <<-LONGDESC
    `afinstaller Resi [platform] [version]` will clone the AF Resi [Platform] repo with the version you specify. It will it will
    finally open the project folder.

    Android:
    You can optionally specify the build flag [-b], which will attempt to run Gradle Clean.
    This requires Java 8.0 and above.

    iOS:
    You can optionally specify the build flag [-b], which will attmept to run pod install.
    This requires cocoapods to be installed. `sudo gem install cocoapods`

    > $ afinstaller Resi [Platform] 4.5.0 -b
    LONGDESC
    def Resi(platform, version)
      build_project = options[:build]
      if platform.downcase == "ios" || platform.downcase == "android"
        if build_project
          Afinstaller::Installers::ResiPlatformBuild.start([version, platform])
        else
          Afinstaller::Installers::ResiPlatform.start([version, platform])
        end
      else
        error = "Incorrect Platform. Please try afinstaller Resi iOS [version]"
        Afinstaller::Installers::Error.start([error])
      end
    end

  end
end
