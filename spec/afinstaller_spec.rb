# require "spec_helper"
#
# RSpec.describe Afinstaller do
#   it "has a version number" do
#     expect(Afinstaller::VERSION).not_to be nil
#   end
# end

require 'afinstaller'

describe Afinstaller::Platform do
  it "platform is ios" do
    Afinstaller::Platform.platform("iOS").should eql("iOS!")
  end
end


# describe Foodie::Food do
#   it "broccoli is gross" do
#     Foodie::Food.portray("Broccoli").should eql("Gross!")
#   end
