# Nexposecli

This is the experimental gem package for the Ruby Nexpose command-line utility using the Nexpose gem.

This gem is heavily used for internal automation of Rapid7's Nexpose Enterprise Console activities and configuration.

Install it yourself as:

    $ gem install nexposecli

## Usage

    nexposecli --help

or an example of running a query to list all active scans

    nexposecli --config ./lab.yaml --list --SCAN

where ./lab.yaml consists of the following:

    config:
       server: 10.10.10.10
       user: nxuser
       password: password

NOTE: Be sure to use your Nexpose Console's ip address and credentials

TODO: Write more detailed usage instructions here

Known Issues:
* Currently expects a ./logs directory in working directory
* A number of the target objects may not return anything to STDOUT without a -v

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/frozenr7/nexposecli.

