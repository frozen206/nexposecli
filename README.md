# Nexposecli

This is the experimental gem package for the Ruby Nexpose command-line utility using the Nexpose gem.

This gem is heavily used for internal automation of Rapid7's Nexpose Enterprise Console activities and configuration.

Install it yourself as:

    $ gem install nexposecli

## Usage

    nexposecli --help

or an example of running a query to list all active scans

    nexposecli --config ./lab.yaml --list --SCAN

how to run an adhoc sql query and export via csv
NOTE: Consider the potential impact of running SQL queries without filters.

    nexposecli --run --QUERY --config ./lab.yaml --sql "select * from dim_asset limit 10"

or for more complex sql queries, put the sql into a file and run

    nexposecli --run --QUERY --config ./lab.yaml --sqlfile ./new_assets.sql
NOTE: Consider reviewing the SQL examples and reports available here:
https://community.rapid7.com/community/nexpose/report-templates

how to list all reports defined

    nexposecli --config ./lab.yaml --list --REPORT

how to request the console's version details

    nexposecli --config ./lab.yaml --run --COMMAND "ver"

how to run an adhoc scan for a single ip or network cidr-noted range ( --id <site id> )

    nexposecli --config ./lab.yaml --create --SCAN --id 1 --range 192.168.42.103/32

how to add a new custom role for configuration within the console ui, based on a copy of existing role

    nexposecli --config ./lab.yaml --create --ROLE -n security-manager --description "New Role Name" --newname new-short-name

how to add a new user, with default password of "nxpassword" until moved to yaml config is supported

    nexposecli  --config ./lab.yaml --create --USER --name <username> --fullname "Full Name"

how to export packaged scan data in a single zip file

    nexposecli --config ./lab.yaml --SCAN --update --scanpath ./ --action export --id <scan id>

how to export packaged scan data in a single zip file

    nexposecli --config ./lab.yaml --SCAN --update --scanpath ./ --action import --filterv scan-<scan id>.zip --id <site id>

how to import packaged scan data into a site

    nexposecli --config ./lab.yaml --SCAN --update --scanpath ./ --action import --filterv <scan zip> --id <site id>

where ./lab.yaml consists of the following:

    config:
       server: 10.10.10.10
       port: 3780
       user: nxuser
       password: password

NOTE: Be sure to use your Nexpose Console's ip address and credentials

Known Issues:
* A number of the target objects may not return anything to STDOUT without a -v

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/frozenr7/nexposecli.

