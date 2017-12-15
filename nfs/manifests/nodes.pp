node 'puppetlabs.com' {
	
	nfs::share { 'data' :
    	path => '/data',
    	allowed => '192.168.1.0/24',
    	options => 'rw,sync,no_root_squash',
  	}
	nfs::share { 'data2' :
    	path => '/data2',
    	allowed => '192.168.1.0/24',
    	options => 'rw,sync,no_root_squash',
  	}	
}
