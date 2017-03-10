module Nexposecli
   ##############################################################################
   #
   # Conf
   #
   ##############################################################################
   # Parse cli and config options passed
   ARGS = %q{ 
     - comment               : General Options
   
     - name                  : help
       desc                  : Print help
   
     - name                  : verbose
       short                 : v
       desc                  : Run verbosely
   
     - name                  : dryrun
       desc                  : Dry run mode, do not commit to Console
   
     - comment               : EVM Administrative Actions
   
     - name                  : create
       short                 : c
       desc                  : The create action is used for new objects
   
     - name                  : copy
       desc                  : The copy action is used to copy of objects of the same type
   
     - name                  : list
       short                 : l
       desc                  : The list action is used to list of objects of the same type
   
     - name                  : show
       short                 : s
       desc                  : The show action is used to display details of a single object
   
     - name                  : update
       short                 : u
       desc                  : The update action is used to change properties of a single object
   
     - name                  : delete
       short                 : d
       desc                  : The delete action is used to delete a single object
   
     - name                  : history
       desc                  : The history action is used to retrieve the history of certain objects, such as reports and scans
   
     - name                  : sync
       desc                  : The sync action is used to retrieve and sync certain objects, such as ldap/ad users
   
     - name                  : run
       desc                  : The run action is only used to issue commands to the COMMAND object
   
     - comment               : EVM Action Targets
   
     - name                  : USER
       short                 : U
       desc                  : The USER target is used to alter or create the USER object
   
     - name                  : ROLE
       short                 : L
       desc                  : The ROLE target is used to alter or create the ROLE object
   
     - name                  : ENGINE
       short                 : E
       desc                  : The ENGINE target is used to alter or create the SCAN ENGINE object
   
     - name                  : POOL
       short                 : P
       desc                  : The POOL target is used to alter or create the POOL object
   
     - name                  : SCAN
       short                 : S
       desc                  : The SCAN target is used to alter or create the SCAN object
   
     - name                  : SITE
       short                 : T
       desc                  : The SITE target is used to alter or create the SITE object
   
     - name                  : ASSET
       short                 : A
       desc                  : The ASSET target is used to alter or create the ASSET object
   
     - name                  : DASSET
       short                 : D
       desc                  : The DASSET target is used to alter or create the DASSET object
   
     - name                  : TAG
       short                 : G
       desc                  : The TAG target is used to alter or create the TAG object
   
     - name                  : REPORT
       short                 : R
       desc                  : The REPORT target is used to alter or create the REPORT object
   
     - name                  : VULN
       short                 : V
       desc                  : The VULN target is used to alter or create the VULN object

     - name                  : AUTHSRC
       desc                  : The AUTHSRC target is used to alter or list the AUTHSRC object
   
     - name                  : CONSOLE
       desc                  : The CONSOLE target is used to alter the CONSOLE nsc connection object
   
     - name                  : TEMPLATE
       desc                  : The TEMPLATE target is used to alter the TEMPLATE nsc connection object
   
     - name                  : COMMAND
       short                 : C
       desc                  : The COMMAND target is only used in conjunction with the --run action
       required              : true
   
     - name                  : QUERY
       desc                  : The QUERY target is only used in conjunction with the --run action
   
     - comment               : EVM Action Argument Values
   
     - name                  : host
       short                 : h
       desc                  : The target ip or host to be acted upon by the action
       required              : true
   
     - name                  : port
       short                 : p
       desc                  : The target port to be acted upon by the action
       required              : true
   
     - name                  : password
       desc                  : The target password
       required              : true
   
     - name                  : authsrc
       desc                  : The target authsrc id
       required              : true
   
     - name                  : role
       desc                  : The target role name
       required              : true
   
     - name                  : email
       desc                  : The target email address
       required              : true
   
     - name                  : name
       short                 : n
       desc                  : The target object name
       required              : true
   
     - name                  : fullname
       desc                  : The target object full name
       required              : true
   
     - name                  : newname
       desc                  : The target object new name
       required              : true
   
     - name                  : description
       short                 : t
       desc                  : The text based description of the object being acted upon
       required              : true
   
     - name                  : id
       short                 : i
       desc                  : The object id being acted upon
       required              : true
   
     - name                  : site
       desc                  : The site id of the object being acted upon
       required              : true
   
     - name                  : range
       short                 : r
       desc                  : The comma separated (begin,end) range of ip addresses to be acted upon
       required              : true
   
     - name                  : targets
       desc                  : The network block or ip addresses to be acted upon, in CIDRv4, dotted dashed, or ip format
       required              : true
   
     - name                  : argv
       short                 : g
       desc                  : Argument vector for the action, in the form key:value pairs
       required              : true
   
     - name                  : filter
       short                 : f
       desc                  : Filters which are applied to the action, in the form key:value pairs
       required              : true
   
     - name                  : filterv
       desc                  : Filter value which are applied to the action. Formate varies by filter type
       required              : true
   
     - name                  : action
       short                 : a
       desc                  : The subaction to be performed within the target action
       required              : true
   
     - name                  : sql
       desc                  : The sql query to be executed
       required              : true
   
     - name                  : sqlvar
       desc                  : The sql query to be executed
       required              : true
   
     - name                  : sqlfile
       desc                  : The file containing the sql query to be executed
       required              : true
   
     - name                  : timeout
       desc                  : The timeout value in seconds for certain actions, such as reporting
       required              : true
   
     - name                  : attempts
       desc                  : The max number of attempts for iterative actions
       required              : true
   
     - name                  : loop_sleep
       desc                  : The sleep interval in seconds between action iterations
       required              : true
   
     - comment               : Nexpose Console credentials
   
     - name                  : config
       desc                  : The config yaml file containing the connection details of the Nexpose Console Server
       required              : true
   
     - name                  : ldapconf
       desc                  : The ldap/ad config yaml file containing the search details
       required              : true
   
     - name                  : nsc_server
       desc                  : The ip or hostname of the Nexpose Console Server
       required              : true
   
     - name                  : nsc_user
       desc                  : The username to login to the Nexpose Console Server
       required              : true
   
     - name                  : nsc_pass
       desc                  : The password to login to the Nexpose Console Server
       required              : true
   
     - name                  : logpath
       desc                  : The path for writing the logs
       required              : true
   
     - name                  : scanpath
       desc                  : The path for exported/imported scans
       required              : true
   }
end   
