

require "./wcl/macros"
require "./wcl/types"
require "./wcl/wcserver"
require "./wcl/door32.cr"

module WCL
  VERSION = {{`shards version #{__DIR__}`.chomp.stringify}}
end
