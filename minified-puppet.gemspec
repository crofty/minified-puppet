# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{minified-puppet}
  s.version = "0.0.15"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Croft"]
  s.date = %q{2010-11-10}
  s.email = %q{james.r.croft@gmail.com}
  s.files = [
    ".gitignore",
    "README",
    "Rakefile",
    "lib/minified/puppet.rb",
    "minified-puppet.gemspec",
    "puppet/bootstrap.sh",
    "puppet/classes/apache.pp",
    "puppet/classes/apache/centos.conf",
    "puppet/classes/apache/ssl.conf",
    "puppet/classes/base.pp",
    "puppet/classes/java/README",
    "puppet/classes/java/manifests/classes/dev.pp",
    "puppet/classes/java/manifests/classes/v6.pp",
    "puppet/classes/java/manifests/init.pp",
    "puppet/classes/java/templates/java-home.erb",
    "puppet/classes/minified.pp",
    "puppet/classes/mongo.pp",
    "puppet/classes/monit.pp",
    "puppet/classes/monit/monit.conf",
    "puppet/classes/multiverse.pp",
    "puppet/classes/munin.pp",
    "puppet/classes/munin/plugins/passenger_memory_stats",
    "puppet/classes/munin/plugins/passenger_status",
    "puppet/classes/munin/plugins/rails_database_time",
    "puppet/classes/munin/plugins/rails_request_duration",
    "puppet/classes/munin/plugins/rails_request_error",
    "puppet/classes/munin/plugins/rails_requests",
    "puppet/classes/munin/plugins/rails_view_render_time",
    "puppet/classes/munin/plugins/redis",
    "puppet/classes/munin/rails-plugin-config",
    "puppet/classes/munin/redis-plugin-config",
    "puppet/classes/mysql.pp",
    "puppet/classes/mysql/password.erb",
    "puppet/classes/nginx.pp",
    "puppet/classes/nginx/nginx.conf.erb",
    "puppet/classes/nginx/vhost.erb",
    "puppet/classes/post-flight.pp",
    "puppet/classes/postfix.pp",
    "puppet/classes/postgis/README.rst",
    "puppet/classes/postgis/files/usr/local/bin/make-postgresql-postgis-template.sh",
    "puppet/classes/postgis/manifests/classes/postgis-base.pp",
    "puppet/classes/postgis/manifests/classes/postgis-debian-base.pp",
    "puppet/classes/postgis/manifests/classes/postgis-debian-v8-3.pp",
    "puppet/classes/postgis/manifests/classes/postgis-debian-v8-4.pp",
    "puppet/classes/postgis/manifests/classes/postgis-ubuntu-base.pp",
    "puppet/classes/postgis/manifests/classes/postgis-ubuntu-v8-4.pp",
    "puppet/classes/postgis/manifests/definitions/postgis-database.pp",
    "puppet/classes/postgis/manifests/init.pp",
    "puppet/classes/postgresql-user.pp",
    "puppet/classes/postgresql.pp",
    "puppet/classes/rack.pp",
    "puppet/classes/rack/passenger.load.erb",
    "puppet/classes/redis/README",
    "puppet/classes/redis/manifests/defines/redis_source.pp",
    "puppet/classes/redis/manifests/init.pp",
    "puppet/classes/redis/templates/redis-server.erb",
    "puppet/classes/redis/templates/redis.conf.erb",
    "puppet/classes/rsyslog.pp",
    "puppet/classes/rsyslog/rails.conf.erb",
    "puppet/classes/rsyslog/rsyslog.conf",
    "puppet/classes/ruby.pp",
    "puppet/classes/ruby/gemrc",
    "puppet/classes/sudo.pp",
    "puppet/classes/sudo/sudoers",
    "puppet/classes/syslogng.pp",
    "puppet/classes/syslogng/CentOS.cnf",
    "puppet/classes/syslogng/Ubuntu.cnf",
    "puppet/classes/telnet.pp",
    "puppet/classes/wkhtmltopdf.pp",
    "puppet/classes/xml.pp",
    "puppet/classes/yum.pp",
    "puppet/classes/zsh.pp",
    "puppet/roles/blank.pp",
    "puppet/site.pp"
  ]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Apply puppet configuration to minified hosts}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>, [">= 0"])
      s.add_runtime_dependency(%q<capistrano-ext>, [">= 0"])
    else
      s.add_dependency(%q<capistrano>, [">= 0"])
      s.add_dependency(%q<capistrano-ext>, [">= 0"])
    end
  else
    s.add_dependency(%q<capistrano>, [">= 0"])
    s.add_dependency(%q<capistrano-ext>, [">= 0"])
  end
end
