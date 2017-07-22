module Afinstaller
  module Installers
    class AndroidBuild < Thor::Group
      argument :version, :type => :string
      include Thor::Actions

      def self.source_root
        File.dirname(__FILE__)
      end

      def clone_command
        v = "#{version}"
        FileUtils::mkdir "AF#{version}-Android" unless File.exists?("AF#{version}-Android")
        FileUtils.cd("AF#{version}-Android", :verbose => false)
        puts Rainbow("== Cloning Repo ==").cyan
        system! 'git clone -b v'+v+' ssh://git@bitbucket.phunware.com:7999/af/af-template-android.git' unless File.exist?('af-template-android')
        puts Rainbow("== Cloning Succeeded ==").magenta
      end

      def setup_command
        puts Rainbow("== Moving to project folder ==").cyan
        FileUtils.cd('af-template-android', :verbose => false)
        puts Rainbow("== Folder is now af-template-android ==").magenta

        puts Rainbow("== Attempting Gradle Clean ==").cyan
        system! './gradlew clean :app:assemble$1Debug --parallel --daemon --configure-on-demand -PminSdk=21'
        puts Rainbow("== Gradle successful ==").magenta

      rescue NoMethodError => e
        puts Rainbow("== Gradle Failed Check your settings. ==").red
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
