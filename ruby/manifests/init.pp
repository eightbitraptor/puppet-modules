class ruby( $chruby_ver=0.3.4, $ruby_ver=2.0.0 ) {
  exec{ "downloading-chruby=${chruby_ver}":
    command => "wget -O chruby.tar.gz https://github.com/postmodern/chruby/archive/v${chruby_ver}.tar.gz && tar zxvf chruby.tar.gz",
    cwd => "/tmp",
    creates => "/tmp/chruby.tar.gz",
  }

  exec{ "install-chruby=${chruby_ver}":
    cwd => "/tmp/chruby",
    command => "make install",
    creates => "/usr/local/bin/chruby-exec"
    require => Exec["downloading-chruby=${chruby_ver}"]
  }

  file{ "/etc/profile.d/chruby.sh":
    source => "puppet:///files/chruby.sh",
    owner => root,
    group => root,
    mode => 755
  }
}
