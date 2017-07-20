Feature: Android
  In order to perform a task on a particular platform
  As a CLI
  I want to be as objective as possible

  Scenario: Android, or Android?
    When I run `afinstaller Android 4.5.0`
    Then the output should contain "Building without -b flag"

  Scenario: IOS, or IOS?
    When I run `afinstaller Android 4.5.0 -b`
    Then the output should contain "Building with -b flag"
