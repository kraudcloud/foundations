KRAUD CLOUD ENTERPRISE FOUNDATIONS
==================================

an opinionated foundational set of services for managed kubernetes that is

- well tested
- audited for high availability, security and compliance
- supported by kraud

## Bootstrapping

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
