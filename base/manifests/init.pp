class base{
  file{ "/etc/profile.d/puppet-utils.sh":
    owner => "root",
    group => "root",
    source => "puppet:///modules/base/puppet-utils.sh",
  }
}
