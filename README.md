# origin-node-multus

An extension of the [openshift node dockerfile](https://github.com/openshift/origin/blob/master/images/node/Dockerfile), to include Multus.

Modified to not require the use of multi-stage builds, which are not supported by the shipping Docker version in Openshift 3.9.

Ideally deployable through openshift-ansible [by modifying the osn_image variable](https://github.com/openshift/openshift-ansible/blob/master/roles/openshift_node/defaults/main.yml#L101-L104)

---


