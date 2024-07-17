![logo](./logo250.png)

KRAUD CLOUD ENTERPRISE FOUNDATIONS
==================================


An opinionated foundational set of services for managed kubernetes.
We manage, tests, audits and support this stack for our customer clusters.
It is available to the public as a learning example only.
Pull requests will be ignored.
Please contact support at kraud dot cloud for support.


| chart        | version | license      | grade |
|--------------|---------|--------------|-------|
| cert-manager | 1.15    | Apache 2.0   | A     |
| cilium       | 1.15    | Apache 2.0   | A     | 
| flux         | 2.3     | Apache 2.0   | A     | 
| haproxy      | 1.4     | GPL-         | A     | 
| longhorn     | 1.6     | Apache 2.0   | B     | 
| openebs      | 4.1     | Apache 2.0   | B     | 
| prometheus   | 56.8    | Apache 2.0   | B     |



## Bootstrapping

![test](https://github.com/kraudcloud/foundations/actions/workflows/test-bootstrap.yaml/badge.svg)
![architecture](./bootstrap/bootstrap.png)

In a clean cluster, edit `bootstrap/user-skeleton.yaml` then run `./bootstrap/bootstrap.sh`

## Upgrading

### Flux

```sh
flux install --export --namespace foundations > flux/flux.yaml
```

Then the source stuff will pick it up and it will auto-upgrade

### Other components

Upgrade the respective helm version in `./charts/foundations/templates`
