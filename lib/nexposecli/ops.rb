require 'set'

module Nexposecli
   # Allowed Search and Filter Operators by field, in Set form
   CVSS_SCORE_OPS = Set["IS", "IS_NOT", "IN_RANGE", "GREATER_THAN", "LESS_THAN"]
   IP_RANGE_OPS   = Set["IN_RANGE", "NOT_IN"]
   OS_OPS         = Set["CONTAINS", "NOT_CONTAINS", "IS_EMPTY", "IS_NOT_EMPTY"]
   RISK_SCORE_OPS = Set["IS", "IS_NOT", "IN_RANGE", "GREATER_THAN", "LESS_THAN"]
   SITE_ID_OPS    = Set["IN", "NOT_IN"]
   SCAN_DATE_OPS  = Set["ON_OR_BEFORE", "ON_OR_AFTER", "BETWEEN", "EARLIER_THAN", "WITHIN_THE_LAST"]
end
