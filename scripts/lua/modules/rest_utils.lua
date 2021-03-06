--
-- (C) 2020 - ntop.org
--
-- 

local dirs = ntop.getDirs()
package.path = dirs.installdir .. "/scripts/lua/modules/?.lua;" .. package.path

require "lua_utils"
local json = require ("dkjson")

local rest_utils = {}

rest_utils.consts_ok                               =  0
rest_utils.consts_not_found                        = -1
rest_utils.consts_invalid_interface                = -2
rest_utils.consts_not_granted                      = -3
rest_utils.consts_invalid_host                     = -4
rest_utils.consts_invalid_args                     = -5
rest_utils.consts_internal_error                   = -6
rest_utils.consts_bad_format                       = -7
rest_utils.consts_bad_content                      = -8
rest_utils.consts_resolution_failed                = -9
rest_utils.consts_snmp_device_already_added        = -10
rest_utils.consts_snmp_device_unreachable          = -11
rest_utils.consts_snmp_device_no_device_discovered = -12

local rc_str_consts = {
   [rest_utils.consts_ok] = "OK",
   [rest_utils.consts_not_found] = "NOT_FOUND",
   [rest_utils.consts_invalid_interface] = "INVALID_INTERFACE",
   [rest_utils.consts_not_granted] = "NOT_GRANTED",
   [rest_utils.consts_invalid_host] = "INVALID_HOST",
   [rest_utils.consts_invalid_args] = "INVALID_ARGUMENTS",
   [rest_utils.consts_internal_error] = "INTERNAL_ERROR",
   [rest_utils.consts_bad_format] = "BAD_FORMAT",
   [rest_utils.consts_bad_content] = "BAD_CONTENT",
   [rest_utils.consts_resolution_failed] = "NAME_RESOLUTION_FAILED",
   [rest_utils.consts_snmp_device_already_added] = "SNMP_DEVICE_ALREADY_ADDED",
   [rest_utils.consts_snmp_device_unreachable] = "SNMP_DEVICE_UNREACHABLE",
   [rest_utils.consts_snmp_device_no_device_discovered] = "NO_SNMP_DEVICE_DISCOVERED",
}

function rest_utils.rc(ret_code, response)
   local client_rsp = { rc = ret_code, rc_str = rc_str_consts[ret_code], rsp = response or {} }
   return(json.encode(client_rsp))
end


return rest_utils
