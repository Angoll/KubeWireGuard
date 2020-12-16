# Wireguard Server on Kubernetes

Wireguard server over a kubernetes cluster, this pod image requires the use of the kernel module wireguard located in the host server.

**Note:**  I'm still testing configurations and parameters

## The setup

I'm using this service to have a wireguard server on my kubernetes cluster based on rasberry pi 4 nodes and a amd64 master node.

As I configured MetalLB with bgp load balancer I use a Service type LoadBalancer to get one of the range of IPs of MetalLB to access the Wiregaurd server.
For me to get the IP I use:  `kubectl get services -n wireguard`


## To build the image

The image configured is using the lastest version of a docker.io/angoll/wireguard:latest

```
cd Docker
docker buildx build --platform linux/arm64,linux/amd64 --push -t {REPO} .
```

## Some issues
I still tunning the double nat process, and some times I have to reconnect the vpn if it loses connection or the pod is regenerated.


## To setup the WireGuard config 

You have to edit the `deployment.yaml` file and modify the ConfigFile I left a mockup of config file to get a sense on how it looks like, there is plenty online websites on how to create the keys.


## Thanks and references

https://www.wireguard.com/

https://math.rousse.me/sysadmin/2020/05/21/wireguard-k8s.html

https://dev.to/ivanmoreno/how-to-connect-with-kubernetes-internal-network-using-wireguard-48bh
