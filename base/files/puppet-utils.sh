function puppetup {
  cd /etc/puppet && git pull && cd $OLDPWD
}

function puppetrun {
  sudo puppet apply --modulepath=/etc/puppet/modules /etc/puppet/site.pp
}
