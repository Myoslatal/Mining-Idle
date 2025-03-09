--Load all modules
Strings = require("src.locales.zh_CN")         --0,0
--no depend 0
require("src.lib.class")                       --0,1
require("src.lib.activity")                    --0,2
require("src.lib.math")                        --0,3
require("src.lib.readline")                    --0,4
Layout = require("src.lib.layout")             --0,5
Actor = require("src.lib.layoutActor")         --0,6
json = require("src.lib.json.json")            --0,7
Big = require("src.lib.bignumber")             --0,8
BigDouble = require("src.lib.bigdouble")       --0,9
--depend 0 ,1
require("vars")                                -- depend 0,1 / 1,0
UI = {}
UI.text = require("src.lib.ui.text")           --deoend 0,6 / 1,1
UI.rectangle = require("src.lib.ui.rectangle") --deoend 0,6 / 1,2
UI.button = require("src.lib.ui.button")       --deoend 0,6 / 1,3
--depend 1,2
DataVar = require("src.cores.vars")            -- depend 1,0/2,0
require("src.global.mainactivity")             -- depend 1,0/2,0
--highest level
