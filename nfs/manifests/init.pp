class nfs {
$nfspackages = [ 'nfs-utils' ]
$nfspackage = [ 'rpcbind', 'nfs-server', 'nfs=lock', 'nfs-idmap' ]	
	package { $nfspackages :
	  ensure => installed,
	}
	service { $nfspackage :
 	  ensure => running,
	  enable => true,
	  hasrestart => true,
	  require => Package[ $nfspackages ],
	}
	file { '/etc/exports.d':
	  ensure => directory,
	}  
	exec { 'update-etc-exports':
	  command => '/bin/cat /etc/exports.d/* >/etc/exports',
	  notify => Service['nfs-server'],
          refreshonly => true,
	}  
}
