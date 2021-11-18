# ethernet-ip-sim

This repository contains all the required scripts to dockerise 
[OpENer](https://github.com/EIPStackGroup/OpENer) allowing it to be used as a 
basic Ethernet/IP device simulator.

Currently this simulator supports explicit reads

## Building and running 

### Docker Image
To build the docker image, use the dockerise script from the root of the cloned 
repository :

```
./scripts/dockerise.sh
```

After building has completed, run the docker container using the following command.

```
docker run -i iotechsys/opener-sim:{VERSION} <network_interface> 
```

Note: <code><network_interface></code> is optional, if left unspecified the  
simulator will run on the eth0 interface as default.

The Ethernet/ip device service should then be able to communicate with the 
simulator through the <code>docker:0</code> network interface.

To use the simulator you will need to find the IP address of the running container. First find the container ID using: <code>docker ps</code>

Then find the IP address of the desired container using 

```
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_id>
```

This will be the IP address used for provisioning the simulator

### Local Binary

Before building OpENer in binary insure that it is being built/run from a 
different host from that of where the device service will be running from. 

To build the binary use the build script:

``` 
./scripts/build 
```

To run first cd into the posix directory:

``` 
cd OpENer/bin/posix 
```

and run this command with the desired networkInterface:

```
./src/ports/POSIX/OpENer <NetworkInterface>
```
