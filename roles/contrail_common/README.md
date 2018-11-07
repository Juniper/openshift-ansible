# Contrail SDN

[Contrail Networking](https://www.juniper.net/us/en/products-services/sdn/contrail/contrail-networking/), based on [OpenContrail](http://www.opencontrail.org/) project, is a truly open, multi-cloud network virtualization and policy management platform. Contrail / OpenContrail SDN stack is integrated with various orchestration systems such as Kubernetes, OpenShift, OpenStack and Mesos, and provides different isolation modes for virtual machines, containers/pods and bare metal workloads

## SUPPORTED ARCHITECTURE

* Contrail SDN installed through OpenShift ansible supports both **SINGLE-MASTER** and **MULTI-MASTER (High-Availability)** configurations 
* Contrail components are installed on the infra-node

## COMPONENTS

### Contrail Master (Pods)

* Contrail Image Installer
* Contrail Controller Config
* Contrail Controller Control
* Contrail Controller WebUI
* Contrail Analytics
* Contrail Analytics Database
* Contrail Config DB Node Manager
* Contrail Config DB
* Contrail DB Node Manager
* Contrail Kubernetes Manager

### Nodes (Pods)

* Contrail Agent

Note: As part of the agent pod we install the **vrouter kernel module** and the **contrail-cni**.

### Contrail Roles

* **Contrail common**: This role contains common functions which are required by other contrail roles
* **Contrail controller**: Installs all contrail master components
* **Contrail master**: Preps up the openshift master node
* **Contrail node**: Installs cni binaries on all nodes
* **Contrail st**: Preps the contrail schema transformer
* **Contrail web console**: Installs contrail web console on infra nodes

## INSTALLATION

To install Contrail SDN with OpenShift Enterprise, follow this [install guide](https://github.com/Juniper/contrail-kubernetes-docs)

Refer to this example [openshift 3.9 contrail installation](https://github.com/Juniper/contrail-kubernetes-docs/blob/master/install/openshift/3.9/standalone-openshift.md) for non-HA/HA deployments

#### Set the flag to "false" to disable OVS

        openshift_use_openshift_sdn=false

#### Set this flag to "cni" to use CNI plugins

        os_sdn_network_plugin_name='cni'

#### Set the flag to "true" to install Contrail SDN stack

        openshift_use_contrail=true

#### Set this parameter to the downloaded Contrail SDN image version

        contrail_version=5.0

#### Set Contrail Analytics Database size

        analyticsdb_min_diskgb=50

#### Set Contrail Config Database size

        configdb_min_diskgb=25

### CONTACT

Pragash Vijayaragavan <pvijayaragav@juniper.net>
