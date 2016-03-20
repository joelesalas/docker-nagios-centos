## Nagios in Docker on CentOS 7  

Basic Docker image for running Nagios.<br />
This is running Nagios 4.0.8 (default in CentOS 7)

## Running ##
`docker run -v /path/to/nagios-config:/etc/nagios joelesalas/nagios-centos`

## Building ##
`docker build -t nagios-centos .`

### What this does ###
This offers a simple, clean entry point into a Nagios daemon. Maybe you have lots of CentOS-specific config that you don't want to tear out. Maybe you think CentOS is better for some reason.

### What this does not do ###
This doesn't bundle in the Web UI or run anything other than the Nagios daemon itself.
