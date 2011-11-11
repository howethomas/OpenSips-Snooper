# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110921203502) do

  create_table "acc", :force => true do |t|
    t.string   "method",     :limit => 16, :default => "", :null => false
    t.string   "from_tag",   :limit => 64, :default => "", :null => false
    t.string   "to_tag",     :limit => 64, :default => "", :null => false
    t.string   "callid",     :limit => 64, :default => "", :null => false
    t.string   "sip_code",   :limit => 3,  :default => "", :null => false
    t.string   "sip_reason", :limit => 32, :default => "", :null => false
    t.datetime "time",                                     :null => false
    t.integer  "duration",                 :default => 0,  :null => false
    t.integer  "setuptime",                :default => 0,  :null => false
    t.datetime "created",                                  :null => false
  end

  add_index "acc", ["callid"], :name => "acc_callid_idx"

  create_table "active_watchers", :force => true do |t|
    t.string  "presentity_uri",   :limit => 128,                         :null => false
    t.string  "watcher_username", :limit => 64,                          :null => false
    t.string  "watcher_domain",   :limit => 64,                          :null => false
    t.string  "to_user",          :limit => 64,                          :null => false
    t.string  "to_domain",        :limit => 64,                          :null => false
    t.string  "event",            :limit => 64,  :default => "presence", :null => false
    t.string  "event_id",         :limit => 64
    t.string  "to_tag",           :limit => 64,                          :null => false
    t.string  "from_tag",         :limit => 64,                          :null => false
    t.string  "callid",           :limit => 64,                          :null => false
    t.integer "local_cseq",                                              :null => false
    t.integer "remote_cseq",                                             :null => false
    t.string  "contact",          :limit => 128,                         :null => false
    t.text    "record_route"
    t.integer "expires",                                                 :null => false
    t.integer "status",                          :default => 2,          :null => false
    t.string  "reason",           :limit => 64,                          :null => false
    t.integer "version",                         :default => 0,          :null => false
    t.string  "socket_info",      :limit => 64,                          :null => false
    t.string  "local_contact",    :limit => 128,                         :null => false
  end

  add_index "active_watchers", ["presentity_uri", "callid", "to_tag", "from_tag"], :name => "active_watchers_active_watchers_idx", :unique => true

  create_table "address", :force => true do |t|
    t.integer "grp",          :limit => 2,  :default => 0,     :null => false
    t.string  "ip",           :limit => 50,                    :null => false
    t.integer "mask",         :limit => 2,  :default => 32,    :null => false
    t.integer "port",         :limit => 2,  :default => 0,     :null => false
    t.string  "proto",        :limit => 4,  :default => "any", :null => false
    t.string  "pattern",      :limit => 64
    t.string  "context_info", :limit => 32
  end

  create_table "aliases", :force => true do |t|
    t.string   "username",      :limit => 64,  :default => "",                    :null => false
    t.string   "domain",        :limit => 64
    t.string   "contact",                      :default => "",                    :null => false
    t.string   "received",      :limit => 128
    t.string   "path",          :limit => 128
    t.datetime "expires",                      :default => '2020-05-28 21:32:15', :null => false
    t.float    "q",                            :default => 1.0,                   :null => false
    t.string   "callid",                       :default => "Default-Call-ID",     :null => false
    t.integer  "cseq",                         :default => 13,                    :null => false
    t.datetime "last_modified",                :default => '1900-01-01 00:00:01', :null => false
    t.integer  "flags",                        :default => 0,                     :null => false
    t.integer  "cflags",                       :default => 0,                     :null => false
    t.string   "user_agent",                   :default => "",                    :null => false
    t.string   "socket",        :limit => 64
    t.integer  "methods"
  end

  add_index "aliases", ["username", "domain", "contact"], :name => "aliases_alias_idx"

  create_table "carrierfailureroute", :force => true do |t|
    t.integer "carrier",                    :default => 0,  :null => false
    t.string  "domain",      :limit => 64,  :default => "", :null => false
    t.string  "scan_prefix", :limit => 64,  :default => "", :null => false
    t.string  "host_name",   :limit => 128, :default => "", :null => false
    t.string  "reply_code",  :limit => 3,   :default => "", :null => false
    t.integer "flags",                      :default => 0,  :null => false
    t.integer "mask",                       :default => 0,  :null => false
    t.string  "next_domain", :limit => 64,  :default => "", :null => false
    t.string  "description"
  end

  create_table "carrierroute", :force => true do |t|
    t.integer "carrier",                       :default => 0,   :null => false
    t.string  "domain",         :limit => 64,  :default => "",  :null => false
    t.string  "scan_prefix",    :limit => 64,  :default => "",  :null => false
    t.integer "flags",                         :default => 0,   :null => false
    t.integer "mask",                          :default => 0,   :null => false
    t.float   "prob",                          :default => 0.0, :null => false
    t.integer "strip",                         :default => 0,   :null => false
    t.string  "rewrite_host",   :limit => 128, :default => "",  :null => false
    t.string  "rewrite_prefix", :limit => 64,  :default => "",  :null => false
    t.string  "rewrite_suffix", :limit => 64,  :default => "",  :null => false
    t.string  "description"
  end

  create_table "cpl", :force => true do |t|
    t.string "username", :limit => 64,                 :null => false
    t.string "domain",   :limit => 64, :default => "", :null => false
    t.text   "cpl_xml"
    t.text   "cpl_bin"
  end

  add_index "cpl", ["username", "domain"], :name => "cpl_account_idx", :unique => true

  create_table "dbaliases", :force => true do |t|
    t.string "alias_username", :limit => 64, :default => "", :null => false
    t.string "alias_domain",   :limit => 64, :default => "", :null => false
    t.string "username",       :limit => 64, :default => "", :null => false
    t.string "domain",         :limit => 64, :default => "", :null => false
  end

  add_index "dbaliases", ["alias_username", "alias_domain"], :name => "dbaliases_alias_idx", :unique => true
  add_index "dbaliases", ["username", "domain"], :name => "dbaliases_target_idx"

  create_table "dialog", :force => true do |t|
    t.integer "hash_entry",                                     :null => false
    t.integer "hash_id",                                        :null => false
    t.string  "callid",                                         :null => false
    t.string  "from_uri",         :limit => 128,                :null => false
    t.string  "from_tag",         :limit => 64,                 :null => false
    t.string  "to_uri",           :limit => 128,                :null => false
    t.string  "to_tag",           :limit => 64,                 :null => false
    t.string  "caller_cseq",      :limit => 11,                 :null => false
    t.string  "callee_cseq",      :limit => 11,                 :null => false
    t.text    "caller_route_set"
    t.text    "callee_route_set"
    t.string  "caller_contact",   :limit => 128,                :null => false
    t.string  "callee_contact",   :limit => 128,                :null => false
    t.string  "caller_sock",      :limit => 64,                 :null => false
    t.string  "callee_sock",      :limit => 64,                 :null => false
    t.integer "state",                                          :null => false
    t.integer "start_time",                                     :null => false
    t.integer "timeout",                                        :null => false
    t.text    "vars"
    t.text    "profiles"
    t.integer "script_flags",                    :default => 0, :null => false
  end

  add_index "dialog", ["hash_entry", "hash_id"], :name => "dialog_hash_idx"

  create_table "dialplan", :force => true do |t|
    t.integer "dpid",                    :null => false
    t.integer "pr",                      :null => false
    t.integer "match_op",                :null => false
    t.string  "match_exp", :limit => 64, :null => false
    t.integer "match_len",               :null => false
    t.string  "subst_exp", :limit => 64, :null => false
    t.string  "repl_exp",  :limit => 32, :null => false
    t.string  "attrs",     :limit => 32, :null => false
  end

  create_table "dispatcher", :force => true do |t|
    t.integer "setid",                      :default => 0,  :null => false
    t.string  "destination", :limit => 192, :default => "", :null => false
    t.integer "flags",                      :default => 0,  :null => false
    t.integer "weight",                     :default => 1,  :null => false
    t.string  "attrs",       :limit => 128, :default => "", :null => false
    t.string  "description", :limit => 64,  :default => "", :null => false
  end

  create_table "domain", :force => true do |t|
    t.string   "domain",        :limit => 64, :default => "",                    :null => false
    t.datetime "last_modified",               :default => '1900-01-01 00:00:01', :null => false
  end

  add_index "domain", ["domain"], :name => "domain_domain_idx", :unique => true

  create_table "domainpolicy", :force => true do |t|
    t.string "rule",                       :null => false
    t.string "type",                       :null => false
    t.string "att"
    t.string "val",         :limit => 128
    t.string "description",                :null => false
  end

  add_index "domainpolicy", ["rule", "att", "val"], :name => "domainpolicy_rav_idx", :unique => true
  add_index "domainpolicy", ["rule"], :name => "domainpolicy_rule_idx"

  create_table "dr_gateways", :primary_key => "gwid", :force => true do |t|
    t.integer "type",                       :default => 0,  :null => false
    t.string  "address",     :limit => 128,                 :null => false
    t.integer "strip",                      :default => 0,  :null => false
    t.string  "pri_prefix",  :limit => 16
    t.string  "attrs"
    t.integer "probe_mode",                 :default => 0,  :null => false
    t.string  "description", :limit => 128, :default => "", :null => false
  end

  create_table "dr_groups", :force => true do |t|
    t.string  "username",    :limit => 64,                  :null => false
    t.string  "domain",      :limit => 128, :default => "", :null => false
    t.integer "groupid",                    :default => 0,  :null => false
    t.string  "description", :limit => 128, :default => "", :null => false
  end

  create_table "dr_gw_lists", :force => true do |t|
    t.string "gwlist",                                     :null => false
    t.string "description", :limit => 128, :default => "", :null => false
  end

  create_table "dr_rules", :primary_key => "ruleid", :force => true do |t|
    t.string  "groupid",                                    :null => false
    t.string  "prefix",      :limit => 64,                  :null => false
    t.string  "timerec",                                    :null => false
    t.integer "priority",                   :default => 0,  :null => false
    t.string  "routeid",                                    :null => false
    t.string  "gwlist",                                     :null => false
    t.string  "attrs"
    t.string  "description", :limit => 128, :default => "", :null => false
  end

  create_table "globalblacklist", :force => true do |t|
    t.string  "prefix",      :limit => 64, :default => "", :null => false
    t.integer "whitelist",   :limit => 2,  :default => 0,  :null => false
    t.string  "description"
  end

  add_index "globalblacklist", ["prefix"], :name => "globalblacklist_globalblacklist_idx"

  create_table "grp", :force => true do |t|
    t.string   "username",      :limit => 64, :default => "",                    :null => false
    t.string   "domain",        :limit => 64, :default => "",                    :null => false
    t.string   "grp",           :limit => 64, :default => "",                    :null => false
    t.datetime "last_modified",               :default => '1900-01-01 00:00:01', :null => false
  end

  add_index "grp", ["username", "domain", "grp"], :name => "grp_account_group_idx", :unique => true

  create_table "gw", :force => true do |t|
    t.string  "gw_name",    :limit => 128,                :null => false
    t.integer "grp_id",                                   :null => false
    t.string  "ip_addr",    :limit => 15,                 :null => false
    t.integer "port",       :limit => 2
    t.integer "uri_scheme", :limit => 2
    t.integer "transport",  :limit => 2
    t.integer "strip",      :limit => 2
    t.string  "tag",        :limit => 16
    t.integer "flags",                     :default => 0, :null => false
  end

  add_index "gw", ["grp_id"], :name => "gw_grp_id_idx"
  add_index "gw", ["gw_name"], :name => "gw_gw_name_idx", :unique => true

  create_table "imc_members", :force => true do |t|
    t.string  "username", :limit => 64, :null => false
    t.string  "domain",   :limit => 64, :null => false
    t.string  "room",     :limit => 64, :null => false
    t.integer "flag",                   :null => false
  end

  add_index "imc_members", ["username", "domain", "room"], :name => "imc_members_account_room_idx", :unique => true

  create_table "imc_rooms", :force => true do |t|
    t.string  "name",   :limit => 64, :null => false
    t.string  "domain", :limit => 64, :null => false
    t.integer "flag",                 :null => false
  end

  add_index "imc_rooms", ["name", "domain"], :name => "imc_rooms_name_domain_idx", :unique => true

  create_table "lcr", :force => true do |t|
    t.string  "prefix",   :limit => 16
    t.string  "from_uri", :limit => 64
    t.integer "grp_id",                 :null => false
    t.integer "priority",               :null => false
  end

  add_index "lcr", ["from_uri"], :name => "lcr_from_uri_idx"
  add_index "lcr", ["grp_id"], :name => "lcr_grp_id_idx"
  add_index "lcr", ["prefix"], :name => "lcr_prefix_idx"

  create_table "load_balancer", :force => true do |t|
    t.integer "group_id",                   :default => 0,  :null => false
    t.string  "dst_uri",     :limit => 128,                 :null => false
    t.string  "resources",                                  :null => false
    t.integer "probe_mode",                 :default => 0,  :null => false
    t.string  "description", :limit => 128, :default => "", :null => false
  end

  add_index "load_balancer", ["dst_uri"], :name => "load_balancer_dsturi_idx"

  create_table "location", :force => true do |t|
    t.string   "username",      :limit => 64,  :default => "",                    :null => false
    t.string   "domain",        :limit => 64
    t.string   "contact",                      :default => "",                    :null => false
    t.string   "received",      :limit => 128
    t.string   "path",          :limit => 128
    t.datetime "expires",                      :default => '2020-05-28 21:32:15', :null => false
    t.float    "q",                            :default => 1.0,                   :null => false
    t.string   "callid",                       :default => "Default-Call-ID",     :null => false
    t.integer  "cseq",                         :default => 13,                    :null => false
    t.datetime "last_modified",                :default => '1900-01-01 00:00:01', :null => false
    t.integer  "flags",                        :default => 0,                     :null => false
    t.integer  "cflags",                       :default => 0,                     :null => false
    t.string   "user_agent",                   :default => "",                    :null => false
    t.string   "socket",        :limit => 64
    t.integer  "methods"
  end

  add_index "location", ["username", "domain", "contact"], :name => "location_account_contact_idx"

  create_table "missed_calls", :force => true do |t|
    t.string   "method",     :limit => 16, :default => "", :null => false
    t.string   "from_tag",   :limit => 64, :default => "", :null => false
    t.string   "to_tag",     :limit => 64, :default => "", :null => false
    t.string   "callid",     :limit => 64, :default => "", :null => false
    t.string   "sip_code",   :limit => 3,  :default => "", :null => false
    t.string   "sip_reason", :limit => 32, :default => "", :null => false
    t.datetime "time",                                     :null => false
  end

  add_index "missed_calls", ["callid"], :name => "missed_calls_callid_idx"

  create_table "nh_sockets", :force => true do |t|
    t.text    "rtpproxy_sock", :null => false
    t.integer "set_id",        :null => false
  end

  create_table "pdt", :force => true do |t|
    t.string "sdomain", :limit => 128,                 :null => false
    t.string "prefix",  :limit => 32,                  :null => false
    t.string "domain",  :limit => 128, :default => "", :null => false
  end

  add_index "pdt", ["sdomain", "prefix"], :name => "pdt_sdomain_prefix_idx", :unique => true

  create_table "presentity", :force => true do |t|
    t.string  "username",      :limit => 64,                  :null => false
    t.string  "domain",        :limit => 64,                  :null => false
    t.string  "event",         :limit => 64,                  :null => false
    t.string  "etag",          :limit => 64,                  :null => false
    t.integer "expires",                                      :null => false
    t.integer "received_time",                                :null => false
    t.binary  "body",                                         :null => false
    t.binary  "extra_hdrs",                   :default => "", :null => false
    t.string  "sender",        :limit => 128,                 :null => false
  end

  add_index "presentity", ["username", "domain", "event", "etag"], :name => "presentity_presentity_idx", :unique => true

  create_table "pua", :force => true do |t|
    t.string  "pres_uri",        :limit => 128, :null => false
    t.string  "pres_id",                        :null => false
    t.integer "event",                          :null => false
    t.integer "expires",                        :null => false
    t.integer "desired_expires",                :null => false
    t.integer "flag",                           :null => false
    t.string  "etag",            :limit => 64
    t.string  "tuple_id",        :limit => 64
    t.string  "watcher_uri",     :limit => 128
    t.string  "to_uri",          :limit => 128
    t.string  "call_id",         :limit => 64
    t.string  "to_tag",          :limit => 64
    t.string  "from_tag",        :limit => 64
    t.integer "cseq"
    t.text    "record_route"
    t.string  "contact",         :limit => 128
    t.string  "remote_contact",  :limit => 128
    t.integer "version"
    t.text    "extra_headers"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "re_grp", :force => true do |t|
    t.string  "reg_exp",  :limit => 128, :default => "", :null => false
    t.integer "group_id",                :default => 0,  :null => false
  end

  add_index "re_grp", ["group_id"], :name => "re_grp_group_idx"

  create_table "rls_presentity", :force => true do |t|
    t.string  "rlsubs_did",                    :null => false
    t.string  "resource_uri",   :limit => 128, :null => false
    t.string  "content_type",                  :null => false
    t.binary  "presence_state",                :null => false
    t.integer "expires",                       :null => false
    t.integer "updated",                       :null => false
    t.integer "auth_state",                    :null => false
    t.string  "reason",         :limit => 64,  :null => false
  end

  add_index "rls_presentity", ["rlsubs_did", "resource_uri"], :name => "rls_presentity_rls_presentity_idx", :unique => true
  add_index "rls_presentity", ["updated"], :name => "rls_presentity_updated_idx"

  create_table "rls_watchers", :force => true do |t|
    t.string  "presentity_uri",   :limit => 128,                         :null => false
    t.string  "to_user",          :limit => 64,                          :null => false
    t.string  "to_domain",        :limit => 64,                          :null => false
    t.string  "watcher_username", :limit => 64,                          :null => false
    t.string  "watcher_domain",   :limit => 64,                          :null => false
    t.string  "event",            :limit => 64,  :default => "presence", :null => false
    t.string  "event_id",         :limit => 64
    t.string  "to_tag",           :limit => 64,                          :null => false
    t.string  "from_tag",         :limit => 64,                          :null => false
    t.string  "callid",           :limit => 64,                          :null => false
    t.integer "local_cseq",                                              :null => false
    t.integer "remote_cseq",                                             :null => false
    t.string  "contact",          :limit => 64,                          :null => false
    t.text    "record_route"
    t.integer "expires",                                                 :null => false
    t.integer "status",                          :default => 2,          :null => false
    t.string  "reason",           :limit => 64,                          :null => false
    t.integer "version",                         :default => 0,          :null => false
    t.string  "socket_info",      :limit => 64,                          :null => false
    t.string  "local_contact",    :limit => 128,                         :null => false
  end

  add_index "rls_watchers", ["presentity_uri", "callid", "to_tag", "from_tag"], :name => "rls_watchers_rls_watcher_idx", :unique => true

  create_table "route_tree", :force => true do |t|
    t.string "carrier", :limit => 64
  end

  create_table "silo", :force => true do |t|
    t.string  "src_addr", :limit => 128, :default => "",           :null => false
    t.string  "dst_addr", :limit => 128, :default => "",           :null => false
    t.string  "username", :limit => 64,  :default => "",           :null => false
    t.string  "domain",   :limit => 64,  :default => "",           :null => false
    t.integer "inc_time",                :default => 0,            :null => false
    t.integer "exp_time",                :default => 0,            :null => false
    t.integer "snd_time",                :default => 0,            :null => false
    t.string  "ctype",    :limit => 32,  :default => "text/plain", :null => false
    t.binary  "body",                    :default => "",           :null => false
  end

  add_index "silo", ["username", "domain"], :name => "silo_account_idx"

  create_table "sip_trace", :force => true do |t|
    t.datetime "time_stamp",                 :default => '1900-01-01 00:00:01', :null => false
    t.string   "callid",                     :default => "",                    :null => false
    t.string   "traced_user", :limit => 128
    t.text     "msg",                                                           :null => false
    t.string   "method",      :limit => 32,  :default => "",                    :null => false
    t.string   "status",      :limit => 128
    t.string   "fromip",      :limit => 50,  :default => "",                    :null => false
    t.string   "toip",        :limit => 50,  :default => "",                    :null => false
    t.string   "fromtag",     :limit => 64,  :default => "",                    :null => false
    t.string   "direction",   :limit => 4,   :default => "",                    :null => false
  end

  add_index "sip_trace", ["callid"], :name => "sip_trace_callid_idx"
  add_index "sip_trace", ["fromip"], :name => "sip_trace_fromip_idx"
  add_index "sip_trace", ["time_stamp"], :name => "sip_trace_date_idx"
  add_index "sip_trace", ["traced_user"], :name => "sip_trace_traced_user_idx"

  create_table "speed_dial", :force => true do |t|
    t.string "username",    :limit => 64,  :default => "", :null => false
    t.string "domain",      :limit => 64,  :default => "", :null => false
    t.string "sd_username", :limit => 64,  :default => "", :null => false
    t.string "sd_domain",   :limit => 64,  :default => "", :null => false
    t.string "new_uri",     :limit => 128, :default => "", :null => false
    t.string "fname",       :limit => 64,  :default => "", :null => false
    t.string "lname",       :limit => 64,  :default => "", :null => false
    t.string "description", :limit => 64,  :default => "", :null => false
  end

  add_index "speed_dial", ["username", "domain", "sd_domain", "sd_username"], :name => "speed_dial_speed_dial_idx", :unique => true

  create_table "subscriber", :force => true do |t|
    t.string "username",      :limit => 64, :default => "", :null => false
    t.string "domain",        :limit => 64, :default => "", :null => false
    t.string "password",      :limit => 25, :default => "", :null => false
    t.string "email_address", :limit => 64, :default => "", :null => false
    t.string "ha1",           :limit => 64, :default => "", :null => false
    t.string "ha1b",          :limit => 64, :default => "", :null => false
    t.string "rpid",          :limit => 64
  end

  add_index "subscriber", ["username", "domain"], :name => "subscriber_account_idx", :unique => true
  add_index "subscriber", ["username"], :name => "subscriber_username_idx"

  create_table "uri", :force => true do |t|
    t.string   "username",      :limit => 64, :default => "",                    :null => false
    t.string   "domain",        :limit => 64, :default => "",                    :null => false
    t.string   "uri_user",      :limit => 64, :default => "",                    :null => false
    t.datetime "last_modified",               :default => '1900-01-01 00:00:01', :null => false
  end

  add_index "uri", ["username", "domain", "uri_user"], :name => "uri_account_idx", :unique => true

  create_table "userblacklist", :force => true do |t|
    t.string  "username",  :limit => 64, :default => "", :null => false
    t.string  "domain",    :limit => 64, :default => "", :null => false
    t.string  "prefix",    :limit => 64, :default => "", :null => false
    t.integer "whitelist", :limit => 2,  :default => 0,  :null => false
  end

  add_index "userblacklist", ["username", "domain", "prefix"], :name => "userblacklist_userblacklist_idx"

  create_table "usr_preferences", :force => true do |t|
    t.string   "uuid",          :limit => 64,  :default => "",                    :null => false
    t.string   "username",      :limit => 128, :default => "0",                   :null => false
    t.string   "domain",        :limit => 64,  :default => "",                    :null => false
    t.string   "attribute",     :limit => 32,  :default => "",                    :null => false
    t.integer  "type",                         :default => 0,                     :null => false
    t.string   "value",         :limit => 128, :default => "",                    :null => false
    t.datetime "last_modified",                :default => '1900-01-01 00:00:01', :null => false
  end

  add_index "usr_preferences", ["username", "domain", "attribute"], :name => "usr_preferences_uda_idx"
  add_index "usr_preferences", ["uuid", "attribute"], :name => "usr_preferences_ua_idx"
  add_index "usr_preferences", ["value"], :name => "usr_preferences_value_idx"

  create_table "version", :id => false, :force => true do |t|
    t.string  "table_name",    :limit => 32,                :null => false
    t.integer "table_version",               :default => 0, :null => false
  end

  add_index "version", ["table_name"], :name => "version_t_name_idx", :unique => true

  create_table "watchers", :force => true do |t|
    t.string  "presentity_uri",   :limit => 128,                         :null => false
    t.string  "watcher_username", :limit => 64,                          :null => false
    t.string  "watcher_domain",   :limit => 64,                          :null => false
    t.string  "event",            :limit => 64,  :default => "presence", :null => false
    t.integer "status",                                                  :null => false
    t.string  "reason",           :limit => 64
    t.integer "inserted_time",                                           :null => false
  end

  add_index "watchers", ["presentity_uri", "watcher_username", "watcher_domain", "event"], :name => "watchers_watcher_idx", :unique => true

  create_table "xcap", :force => true do |t|
    t.string  "username", :limit => 64,  :null => false
    t.string  "domain",   :limit => 64,  :null => false
    t.binary  "doc",                     :null => false
    t.integer "doc_type",                :null => false
    t.string  "etag",     :limit => 64,  :null => false
    t.integer "source",                  :null => false
    t.string  "doc_uri",  :limit => 128, :null => false
    t.integer "port",                    :null => false
  end

  add_index "xcap", ["source"], :name => "xcap_source_idx"
  add_index "xcap", ["username", "domain", "doc_type", "doc_uri"], :name => "xcap_account_doc_type_idx", :unique => true

end
