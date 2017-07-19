# require "spec_helper"
#
# RSpec.describe Afinstaller do
#   it "has a version number" do
#     expect(Afinstaller::VERSION).not_to be nil
#   end
# end

require 'afinstaller'
describe Afinstaller::Installers::IOS do
  it "ios is ios" do
    # expect(Afinstaller::Installer.iOS("iOS")).to eql("iOS!")
    # Afinstaller::Installers::IOS.start([version])
    # expect(Afinstaller::Installers::IOS.iOS("4.5.0")).to eql("Correct!")
  end
end
