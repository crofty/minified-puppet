Exec {
  path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"
}

import "classes/*"
import "classes/**/*"

include base
include ruby
include multiverse
include monit
include postfix

import "roles/*"
