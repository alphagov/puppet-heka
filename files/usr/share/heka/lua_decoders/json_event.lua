-- This file is controlled via puppet. Any changes you make in here
-- will be clobbered when puppet is next run.
--[[
Parse logstash json_event entries.

Config:

- type (string, optional, default nil):
    Sets the message 'Type' header to the specified value

- payload_keep (bool, optional, default false)
    Always preserve the original log line in the message payload.

--]]

local msg_type     = read_config("type")
local payload_keep = read_config("payload_keep")

local msg = {
Timestamp   = nil,
Type        = msg_type,
Payload     = nil,
Fields      = nil
}

require "cjson"

function process_message()
    local raw_msg = read_message("Payload")
    local ok, json_msg = pcall(cjson.decode, raw_msg)
    if not ok then
        return -1
    end

    msg.Timestamp = json_msg["@timestamp"]
    json_msg["@timestamp"] = nil

    msg.Fields = json_msg["@fields"]
    if payload_keep then
        msg.Payload = raw_msg
    end

    inject_message(msg)
    return 0
end
