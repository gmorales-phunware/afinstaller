Feature: IOS
  In order to perform a task on a particular platform
  As a CLI
  I want to be as objective as possible

  Scenario: IOS, or IOS?
    When I run `afinstaller iOS 4.5.0`
    Then the output should contain "Building without -b flag"

  Scenario: IOS, or IOS?
    When I run `afinstaller iOS 4.5.0 -b`
    Then the output should contain "Building with -b flag"
