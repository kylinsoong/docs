#!/bin/bash

function_prompt () {
   echo ""
   echo "$1"
   echo "" 
}


REGISTRY=$1
VERSION=$2
ISSAVE=$3

function_prompt "Syncing Images Start ..."

if [ "$#" -ne 3 ]; then
    echo "Illegal number of parameters, run syncing images like: ./images-syncing.sh <registry> <version> <isSave>"
    exit 1
fi

echo "REGISTRY: $REGISTRY"
echo " VERSION: $VERSION"
echo "  ISSAVE: $ISSAVE"

echo "Pull all of the required OpenShift Container Platform containerized components(Total: 34)..."
docker pull registry.access.redhat.com/openshift3/csi-attacher:$VERSION
docker pull registry.access.redhat.com/openshift3/csi-driver-registrar:$VERSION
docker pull registry.access.redhat.com/openshift3/csi-livenessprobe:$VERSION
docker pull registry.access.redhat.com/openshift3/csi-provisioner:$VERSION
docker pull registry.access.redhat.com/openshift3/efs-provisioner:$VERSION
docker pull registry.access.redhat.com/openshift3/image-inspector:$VERSION
docker pull registry.access.redhat.com/openshift3/local-storage-provisioner:$VERSION
docker pull registry.access.redhat.com/openshift3/manila-provisioner:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-ansible:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-cli:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-cluster-capacity:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-deployer:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-descheduler:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-docker-builder:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-docker-registry:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-egress-dns-proxy:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-egress-http-proxy:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-egress-router:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-f5-router:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-haproxy-router:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-hyperkube:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-hypershift:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-keepalived-ipfailover:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-pod:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-docker-builder:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-node-problem-detector:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-recycler:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-web-console:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-node:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-control-plane:$VERSION
docker pull registry.access.redhat.com/openshift3/registry-console:$VERSION
docker pull registry.access.redhat.com/openshift3/snapshot-controller:$VERSION
docker pull registry.access.redhat.com/openshift3/snapshot-provisioner:$VERSION
docker pull registry.access.redhat.com/rhel7/etcd

if [ "$ISSAVE" = true ] ; then
    echo 'Save the required OpenShift Container Platform containerized components'
    docker save -o ose-images-core-$VERSION_`date +'%Y%m%d'`.tar.gz $REGISTRY/openshift3/csi-attacher:$VERSION $REGISTRY/openshift3/csi-driver-registrar:$VERSION $REGISTRY/openshift3/csi-livenessprobe:$VERSION $REGISTRY/openshift3/csi-provisioner:$VERSION $REGISTRY/openshift3/efs-provisioner:$VERSION $REGISTRY/openshift3/image-inspector:$VERSION $REGISTRY/openshift3/local-storage-provisioner:$VERSION $REGISTRY/openshift3/manila-provisioner:$VERSION $REGISTRY/openshift3/ose-ansible:$VERSION $REGISTRY/openshift3/ose-cli:$VERSION $REGISTRY/openshift3/ose-cluster-capacity:$VERSION $REGISTRY/openshift3/ose-deployer:$VERSION $REGISTRY/openshift3/ose-descheduler:$VERSION $REGISTRY/openshift3/ose-docker-builder:$VERSION $REGISTRY/openshift3/ose-docker-registry:$VERSION $REGISTRY/openshift3/ose-egress-dns-proxy:$VERSION $REGISTRY/openshift3/ose-egress-http-proxy:$VERSION $REGISTRY/openshift3/ose-egress-router:$VERSION $REGISTRY/openshift3/ose-f5-router:$VERSION $REGISTRY/openshift3/ose-haproxy-router:$VERSION $REGISTRY/openshift3/ose-hyperkube:$VERSION $REGISTRY/openshift3/ose-hypershift:$VERSION $REGISTRY/openshift3/ose-keepalived-ipfailover:$VERSION $REGISTRY/openshift3/ose-pod:$VERSION $REGISTRY/openshift3/ose-docker-builder:$VERSION $REGISTRY/openshift3/ose-node-problem-detector:$VERSION $REGISTRY/openshift3/ose-recycler:$VERSION $REGISTRY/openshift3/ose-web-console:$VERSION $REGISTRY/openshift3/ose-node:$VERSION $REGISTRY/openshift3/ose-control-plane:$VERSION $REGISTRY/openshift3/registry-console:$VERSION $REGISTRY/openshift3/snapshot-controller:$VERSION $REGISTRY/openshift3/snapshot-provisioner:$VERSION $REGISTRY/rhel7/etcd
fi


echo ""
echo "Pull additional centralized log aggregation and metrics aggregation components(Total:27)"
docker pull registry.access.redhat.com/openshift3/logging-auth-proxy:$VERSION
docker pull registry.access.redhat.com/openshift3/logging-curator:$VERSION
docker pull registry.access.redhat.com/openshift3/logging-elasticsearch:$VERSION
docker pull registry.access.redhat.com/openshift3/logging-eventrouter:$VERSION
docker pull registry.access.redhat.com/openshift3/logging-fluentd:$VERSION
docker pull registry.access.redhat.com/openshift3/logging-kibana:$VERSION
docker pull registry.access.redhat.com/openshift3/oauth-proxy:$VERSION
docker pull registry.access.redhat.com/openshift3/metrics-cassandra:$VERSION
docker pull registry.access.redhat.com/openshift3/metrics-hawkular-metrics:$VERSION
docker pull registry.access.redhat.com/openshift3/metrics-hawkular-openshift-agent:$VERSION
docker pull registry.access.redhat.com/openshift3/metrics-heapster:$VERSION
docker pull registry.access.redhat.com/openshift3/metrics-schema-installer:$VERSION
docker pull registry.access.redhat.com/openshift3/prometheus:$VERSION
docker pull registry.access.redhat.com/openshift3/prometheus-alert-buffer:$VERSION
docker pull registry.access.redhat.com/openshift3/prometheus-alertmanager:$VERSION
docker pull registry.access.redhat.com/openshift3/prometheus-node-exporter:$VERSION
docker pull registry.access.redhat.com/cloudforms46/cfme-openshift-postgresql
docker pull registry.access.redhat.com/cloudforms46/cfme-openshift-memcached
docker pull registry.access.redhat.com/cloudforms46/cfme-openshift-app-ui
docker pull registry.access.redhat.com/cloudforms46/cfme-openshift-app
docker pull registry.access.redhat.com/cloudforms46/cfme-openshift-embedded-ansible
docker pull registry.access.redhat.com/cloudforms46/cfme-openshift-httpd
docker pull registry.access.redhat.com/cloudforms46/cfme-httpd-configmap-generator
docker pull registry.access.redhat.com/rhgs3/rhgs-server-rhel7
docker pull registry.access.redhat.com/rhgs3/rhgs-volmanager-rhel7
docker pull registry.access.redhat.com/rhgs3/rhgs-gluster-block-prov-rhel7
docker pull registry.access.redhat.com/rhgs3/rhgs-s3-server-rhel7

if [ "$ISSAVE" = true ] ; then
    echo 'Save the additional centralized log aggregation and metrics aggregation components'
    docker save -o ose-images-logging-metrics-$VERSION_`date +'%Y%m%d'`.tar.gz $REGISTRY/openshift3/logging-auth-proxy:$VERSION $REGISTRY/openshift3/logging-curator:$VERSION $REGISTRY/openshift3/logging-elasticsearch:$VERSION $REGISTRY/openshift3/logging-eventrouter:$VERSION $REGISTRY/openshift3/logging-fluentd:$VERSION $REGISTRY/openshift3/logging-kibana:$VERSION $REGISTRY/openshift3/oauth-proxy:$VERSION $REGISTRY/openshift3/metrics-cassandra:$VERSION $REGISTRY/openshift3/metrics-hawkular-metrics:$VERSION $REGISTRY/openshift3/metrics-hawkular-openshift-agent:$VERSION $REGISTRY/openshift3/metrics-heapster:$VERSION $REGISTRY/openshift3/metrics-schema-installer:$VERSION $REGISTRY/openshift3/prometheus:$VERSION $REGISTRY/openshift3/prometheus-alert-buffer:$VERSION $REGISTRY/openshift3/prometheus-alertmanager:$VERSION $REGISTRY/openshift3/prometheus-node-exporter:$VERSION $REGISTRY/cloudforms46/cfme-openshift-postgresql $REGISTRY/cloudforms46/cfme-openshift-memcached $REGISTRY/cloudforms46/cfme-openshift-app-ui $REGISTRY/cloudforms46/cfme-openshift-app $REGISTRY/cloudforms46/cfme-openshift-embedded-ansible $REGISTRY/cloudforms46/cfme-openshift-httpd $REGISTRY/cloudforms46/cfme-httpd-configmap-generator $REGISTRY/rhgs3/rhgs-server-rhel7 $REGISTRY/rhgs3/rhgs-volmanager-rhel7 $REGISTRY/rhgs3/rhgs-gluster-block-prov-rhel7 $REGISTRY/rhgs3/rhgs-s3-server-rhel7 
fi

echo ""
echo "Pull OpenShift Ansible broker, and template service broker(Total: 9)"
docker pull registry.access.redhat.com/openshift3/apb-base:$VERSION
docker pull registry.access.redhat.com/openshift3/apb-tools:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-service-catalog:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-ansible-service-broker:$VERSION
docker pull registry.access.redhat.com/openshift3/mariadb-apb:$VERSION
docker pull registry.access.redhat.com/openshift3/mediawiki-apb:$VERSION
docker pull registry.access.redhat.com/openshift3/mysql-apb:$VERSION
docker pull registry.access.redhat.com/openshift3/ose-template-service-broker:$VERSION
docker pull registry.access.redhat.com/openshift3/postgresql-apb:$VERSION

if [ "$ISSAVE" = true ] ; then
    echo 'Save OpenShift Ansible broker, and template service broker'
    docker save -o ose-images-ansible-broker-$VERSION_`date +'%Y%m%d'`.tar.gz $REGISTRY/openshift3/apb-base:$VERSION $REGISTRY/openshift3/apb-tools:$VERSION $REGISTRY/openshift3/ose-service-catalog:$VERSION $REGISTRY/openshift3/ose-ansible-service-broker:$VERSION $REGISTRY/openshift3/mariadb-apb:$VERSION $REGISTRY/openshift3/mediawiki-apb:$VERSION $REGISTRY/openshift3/mysql-apb:$VERSION $REGISTRY/openshift3/ose-template-service-broker:$VERSION $REGISTRY/openshift3/postgresql-apb:$VERSION 
fi

echo ""
echo "Pull Red Hat-certified Source-to-Image (S2I) builder images that you intend to use in your OpenShift environment(Total: 30)..."
docker pull registry.access.redhat.com/jboss-amq-6/amq63-openshift
docker pull registry.access.redhat.com/jboss-datagrid-7/datagrid71-openshift
docker pull registry.access.redhat.com/jboss-datagrid-7/datagrid71-client-openshift
docker pull registry.access.redhat.com/jboss-datavirt-6/datavirt63-openshift
docker pull registry.access.redhat.com/jboss-datavirt-6/datavirt63-driver-openshift
docker pull registry.access.redhat.com/jboss-decisionserver-6/decisionserver64-openshift
docker pull registry.access.redhat.com/jboss-processserver-6/processserver64-openshift
docker pull registry.access.redhat.com/jboss-eap-6/eap64-openshift
docker pull registry.access.redhat.com/jboss-eap-7/eap70-openshift
docker pull registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat7-openshift
docker pull registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat8-openshift
docker pull registry.access.redhat.com/openshift3/jenkins-1-rhel7
docker pull registry.access.redhat.com/openshift3/jenkins-2-rhel7
docker pull registry.access.redhat.com/openshift3/jenkins-agent-maven-35-rhel7:$VERSION
docker pull registry.access.redhat.com/openshift3/jenkins-agent-nodejs-8-rhel7:$VERSION
docker pull registry.access.redhat.com/openshift3/jenkins-slave-base-rhel7
docker pull registry.access.redhat.com/openshift3/jenkins-slave-maven-rhel7
docker pull registry.access.redhat.com/openshift3/jenkins-slave-nodejs-rhel7
docker pull registry.access.redhat.com/rhscl/mongodb-32-rhel7
docker pull registry.access.redhat.com/rhscl/mysql-57-rhel7
docker pull registry.access.redhat.com/rhscl/perl-524-rhel7
docker pull registry.access.redhat.com/rhscl/php-56-rhel7
docker pull registry.access.redhat.com/rhscl/postgresql-95-rhel7
docker pull registry.access.redhat.com/rhscl/python-35-rhel7
docker pull registry.access.redhat.com/redhat-sso-7/sso70-openshift
docker pull registry.access.redhat.com/rhscl/ruby-24-rhel7
docker pull registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift
docker pull registry.access.redhat.com/redhat-sso-7/sso71-openshift
docker pull registry.access.redhat.com/rhscl/nodejs-6-rhel7
docker pull registry.access.redhat.com/rhscl/mariadb-101-rhel7

if [ "$ISSAVE" = true ] ; then
    echo 'Save Red Hat-certified Source-to-Image (S2I) builder images that you intend to use in your OpenShift environment'
    docker save -o ose-images-apps-latest_`date +'%Y%m%d'`.tar.gz $REGISTRY/jboss-amq-6/amq63-openshift $REGISTRY/jboss-datagrid-7/datagrid71-openshift $REGISTRY/jboss-datagrid-7/datagrid71-client-openshift $REGISTRY/jboss-datavirt-6/datavirt63-openshift $REGISTRY/jboss-datavirt-6/datavirt63-driver-openshift $REGISTRY/jboss-decisionserver-6/decisionserver64-openshift $REGISTRY/jboss-processserver-6/processserver64-openshift $REGISTRY/jboss-eap-6/eap64-openshift $REGISTRY/jboss-eap-7/eap70-openshift $REGISTRY/jboss-webserver-3/webserver31-tomcat7-openshift $REGISTRY/jboss-webserver-3/webserver31-tomcat8-openshift $REGISTRY/openshift3/jenkins-1-rhel7 $REGISTRY/openshift3/jenkins-2-rhel7 $REGISTRY/openshift3/jenkins-agent-maven-35-rhel7:$VERSION $REGISTRY/openshift3/jenkins-agent-nodejs-8-rhel7:$VERSION $REGISTRY/openshift3/jenkins-slave-base-rhel7 $REGISTRY/openshift3/jenkins-slave-maven-rhel7 $REGISTRY/openshift3/jenkins-slave-nodejs-rhel7 $REGISTRY/rhscl/mongodb-32-rhel7 $REGISTRY/rhscl/mysql-57-rhel7 $REGISTRY/rhscl/perl-524-rhel7 $REGISTRY/rhscl/php-56-rhel7 $REGISTRY/rhscl/postgresql-95-rhel7 $REGISTRY/rhscl/python-35-rhel7 $REGISTRY/redhat-sso-7/sso70-openshift $REGISTRY/rhscl/ruby-24-rhel7 $REGISTRY/redhat-openjdk-18/openjdk18-openshift $REGISTRY/redhat-sso-7/sso71-openshift $REGISTRY/rhscl/nodejs-6-rhel7 $REGISTRY/rhscl/mariadb-101-rhel7 
fi


function_prompt "Syncing Images Finished"
