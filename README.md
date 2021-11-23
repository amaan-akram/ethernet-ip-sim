# ethernet-ip-sim

This repository contains all the required scripts to dockerise the
[rta-server](https://github.com/IOTechSystems/rta-ethernet-ip-stack/tree/rta-server) allowing it to be used as a 
basic Ethernet/IP device simulator.

Currently this simulator supports explicit and implicit communication.

## Building and running 

### Docker Image
To build the docker image, use the dockerise script from the root of the cloned 
repository :

```
./scripts/dockerise.sh
```

After building has completed, run the docker container using the following command.

```
docker run -i iotechsys/ethernet-ip-sim:{VERSION} <network_interface> 
```

  ***Note:** <code><network_interface></code>
  is optional, if left unspecified the 
simulator will run on the eth0 interface of the docker container as default.*

The Ethernet/ip device service should then be able to communicate with the 
simulator through the <code>docker:0</code> network interface from where the container is being run from .

To use the simulator you will need to find the IP address of the running container. First find the container ID using: 

```
docker ps
```

Then find the IP address of the desired container using 

```
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_id>
```

This will be the IP address used for provisioning the simulator

### Local Binary

Before building the rta-server binary locally insure that it is being built/run from a 
different host from that of where the device service will be running from. 

To build the binary use the build script:

``` 
./scripts/build 
```

To run first cd into the rta-ethernet-ip-stack directory:

``` 
cd rta-ethernet-ip-stack 
```

and run the the desired networkInterface:

```
./rta-server <NetworkInterface>
```
