# -------- Import stage.
FROM openshift/node
COPY ./opt/cni/bin/* /opt/cni/bin/
ADD multus.conf /multus.conf
ADD watcher.sh /watcher.sh
ADD entrypoint.sh /entrypoint.sh

LABEL io.k8s.display-name="OpenShift Origin Node" \
      io.k8s.description="This is a component of OpenShift Origin and contains the software for individual nodes when using SDN (with Multus)." \
      io.openshift.tags="openshift,node"

VOLUME /etc/origin/node
ENV KUBECONFIG=/etc/origin/node/system:node:osmaster-1.kubeconfig
RUN /bin/bash -c 'ls -l /opt/cni/bin; ls -l /'
ENTRYPOINT [ "/entrypoint.sh" ]
