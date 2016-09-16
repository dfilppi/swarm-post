## Docker Swarm Example Blueprint

The blueprints in this project provide orchestration for starting, healing, and scaling a Docker Swarm cluster on Openstack.  There are 3 blueprints, with slightly different use cases:
* **swarm-local-blueprint.yaml** : a cfy local blueprint that orchestrates setup and teardown of the cluster without a manager
* **swarm-openstack-blueprint.yaml** : an Openstack blueprint that orchestrates setup and teardown of the cluster with a manager
* **swarm-scale-blueprint.yaml** : an Openstack bluieprint that orchestrates setup, teardown, autohealing, and autoscaling of the cluster

### Prerequisites

These blueprints have only been tested against an Ubuntu 14.04 image with 2GB of RAM.  The image used must be pre-installed with Docker 1.12.  Any image use should have passwordless ssh, and passwordless sudo with `requiretty` false or commented out in sudoers.  Also required is an Openstack cloud environment.  The blueprints were tested on Openstack Kilo.

### Cloudify Version

These blueprints were tested on Cloudify 3.4.0.

### Operation

#### swarm-local-blueprint.yaml instructions

* Clone the repo to a system that access to the target Openstack cloud
* Edit the `inputs/local.yaml` file as follows:
 * image : the image id on Openstack of the Ubuntu 14.04 image
 * flavor : the Openstack flavor id
 * ssh_user : the ssh user to log into the instances (probably `ubuntu`)
 * ssh_keyfile : the path to the key used to ssh to the instance
 * ssh_keyname : the name of the key in openstack
* run `cfy local install-plugins -p swarm-local-blueprint.yaml`
* run `cfy local execute -w install --task-retries 10`

This will create the Swarm cluster.  The manager node is assigned a public ip.  You can see it by running `cfy local outputs`.

To tear down the structure, run `cfy local execute -w uninstall --task-retries 10`.


