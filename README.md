# AFInstaller

AFInstaller is a tool that will clone and install AF projects. 

## Requirements: 
- Ruby 2.0.0 or above.
- RubyGems 2.0.0 or above

## Installation
Run the following command on your terminal:

    $ gem install afinstaller

## Usage

### Flags
	[Optional Flags] : -b 
	-b represents --build

### Help
    $ afinstaller - This will show all available commands

    $ afinstaller help [Platform] will show available commands for iOS

### iOS
    $ afinstaller iOS [Version] will clone an AF 4.5.0 project, run pod install and open the project folder window.

    $ afinstaller iOS [version] -b will do the same as above, but will to a test build via xcodebuild after pod install.

### Android
    $ afinstaller Android [version] will clone an AF 4.5.0 project and open the proejct folder window.
    
    $ afinstaller Android [version] -b will do the same as above, but will also ran Gradle Clean in your terminal.
    
    
## Known Issues
- Using ZSH for your bash. 

Possible Solutions: 

[StackOverflow](https://stackoverflow.com/questions/14607193/installing-gem-or-updating-rubygems-fails-with-permissions-error)

## Found a bug?
Report it here: [New Issues](https://github.com/gmorales-phunware/afinstaller/issues/new)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec cucumber feature` to run the tests. 

To install this gem onto your local machine, run `bundle exec rake install`. 
To release a new version, submit a pull request. Once approved, I will push an update.

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/gmorales-phunware/afinstaller). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AFInstaller project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/gmorales-phunware/afinstaller/blob/master/CODE_OF_CONDUCT.md).
