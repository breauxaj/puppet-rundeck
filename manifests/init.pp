# Class: rundeck
#
# This class installs Rundeck
#
# Parameters:
#
# Actions:
#   - Adds the Rundeck repo
#   - Installs the rundeck package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'rundeck': }
#
class rundeck {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'rundeck',
  }

  yumrepo { 'rundeck-release-bintray':
    baseurl        => 'http://dl.bintray.com/rundeck/rundeck-rpm'
    failovermethod => 'priority',
    enabled        => '1',
    gpgcheck       => '0',
    descr          => 'Rundeck - Release'
  }


  package { $required:
    ensure  => installed,
    require => Yumrepo['rundeck-release-bintray'],
  }

}
