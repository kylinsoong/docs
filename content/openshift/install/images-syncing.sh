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

echo "Pull all of the required OpenShift Container Platform containerized components..."
docker pull $REGISTRY/openshift3/ose-ansible:$VERSION
docker pull $REGISTRY/openshift3/ose-cluster-capacity:$VERSION
docker pull $REGISTRY/openshift3/ose-deployer:$VERSION
docker pull $REGISTRY/openshift3/ose-docker-builder:$VERSION
docker pull $REGISTRY/openshift3/ose-docker-registry:$VERSION
docker pull $REGISTRY/openshift3/ose-egress-http-proxy:$VERSION
docker pull $REGISTRY/openshift3/ose-egress-router:$VERSION
docker pull $REGISTRY/openshift3/ose-f5-router:$VERSION
docker pull $REGISTRY/openshift3/ose-haproxy-router:$VERSION
docker pull $REGISTRY/openshift3/ose-keepalived-ipfailover:$VERSION
docker pull $REGISTRY/openshift3/ose-pod:$VERSION
docker pull $REGISTRY/openshift3/ose-sti-builder:$VERSION
docker pull $REGISTRY/openshift3/ose:$VERSION
docker pull $REGISTRY/openshift3/container-engine:$VERSION
docker pull $REGISTRY/openshift3/node:$VERSION
docker pull $REGISTRY/openshift3/openvswitch:$VERSION
docker pull $REGISTRY/rhel7/etcd

if [ "$ISSAVE" = true ] ; then
    echo 'Save the required OpenShift Container Platform containerized components'
    docker save -o ose-images-core-$VERSION_`date +'%Y%m%d'`.tar.gz $REGISTRY/openshift3/ose-ansible:$VERSION $REGISTRY/openshift3/ose-cluster-capacity:$VERSION $REGISTRY/openshift3/ose-deployer:$VERSION $REGISTRY/openshift3/ose-docker-builder:$VERSION $REGISTRY/openshift3/ose-docker-registry:$VERSION $REGISTRY/openshift3/ose-egress-http-proxy:$VERSION $REGISTRY/openshift3/ose-egress-router:$VERSION $REGISTRY/openshift3/ose-f5-router:$VERSION $REGISTRY/openshift3/ose-haproxy-router:$VERSION $REGISTRY/openshift3/ose-keepalived-ipfailover:$VERSION $REGISTRY/openshift3/ose-pod:$VERSION $REGISTRY/openshift3/ose-sti-builder:$VERSION $REGISTRY/openshift3/ose:$VERSION $REGISTRY/openshift3/container-engine:$VERSION $REGISTRY/openshift3/node:$VERSION $REGISTRY/openshift3/openvswitch:$VERSION $REGISTRY/rhel7/etcd 
fi


echo ""
echo "Pull additional centralized log aggregation and metrics aggregation components"
docker pull $REGISTRY/openshift3/logging-auth-proxy:$VERSION
docker pull $REGISTRY/openshift3/logging-curator:$VERSION
docker pull $REGISTRY/openshift3/logging-elasticsearch:$VERSION
docker pull $REGISTRY/openshift3/logging-fluentd:$VERSION
docker pull $REGISTRY/openshift3/logging-kibana:$VERSION
docker pull $REGISTRY/openshift3/metrics-cassandra:$VERSION
docker pull $REGISTRY/openshift3/metrics-hawkular-metrics:$VERSION
docker pull $REGISTRY/openshift3/metrics-hawkular-openshift-agent:$VERSION
docker pull $REGISTRY/openshift3/metrics-heapster:$VERSION
docker pull $REGISTRY/openshift3/prometheus:$VERSION
docker pull $REGISTRY/openshift3/prometheus-alert-buffer:$VERSION
docker pull $REGISTRY/openshift3/prometheus-alertmanager:$VERSION
docker pull $REGISTRY/openshift3/prometheus-node-exporter:$VERSION
docker pull $REGISTRY/cloudforms46/cfme-openshift-postgresql:$VERSION
docker pull $REGISTRY/cloudforms46/cfme-openshift-memcached:$VERSION
docker pull $REGISTRY/cloudforms46/cfme-openshift-app-ui:$VERSION
docker pull $REGISTRY/cloudforms46/cfme-openshift-app:$VERSION
docker pull $REGISTRY/cloudforms46/cfme-openshift-embedded-ansible:$VERSION
docker pull $REGISTRY/cloudforms46/cfme-openshift-httpd:$VERSION
docker pull $REGISTRY/cloudforms46/cfme-httpd-configmap-generator:$VERSION
docker pull $REGISTRY/rhgs3/rhgs-server-rhel7:$VERSION
docker pull $REGISTRY/rhgs3/rhgs-volmanager-rhel7:$VERSION
docker pull $REGISTRY/rhgs3/rhgs-gluster-block-prov-rhel7:$VERSION
docker pull $REGISTRY/rhgs3/rhgs-s3-server-rhel7:$VERSION

if [ "$ISSAVE" = true ] ; then
    echo 'Save the additional centralized log aggregation and metrics aggregation components'
    docker save -o ose-images-logging-metrics-$VERSION_`date +'%Y%m%d'`.tar.gz $REGISTRY/openshift3/logging-auth-proxy:$VERSION $REGISTRY/openshift3/logging-curator:$VERSION $REGISTRY/openshift3/logging-elasticsearch:$VERSION $REGISTRY/openshift3/logging-fluentd:$VERSION $REGISTRY/openshift3/logging-kibana:$VERSION $REGISTRY/openshift3/metrics-cassandra:$VERSION $REGISTRY/openshift3/metrics-hawkular-metrics:$VERSION $REGISTRY/openshift3/metrics-hawkular-openshift-agent:$VERSION $REGISTRY/openshift3/metrics-heapster:$VERSION $REGISTRY/openshift3/prometheus:$VERSION $REGISTRY/openshift3/prometheus-alert-buffer:$VERSION $REGISTRY/openshift3/prometheus-alertmanager:$VERSION $REGISTRY/openshift3/prometheus-node-exporter:$VERSION $REGISTRY/cloudforms46/cfme-openshift-postgresql:$VERSION $REGISTRY/cloudforms46/cfme-openshift-memcached:$VERSION $REGISTRY/cloudforms46/cfme-openshift-app-ui:$VERSION $REGISTRY/cloudforms46/cfme-openshift-app:$VERSION $REGISTRY/cloudforms46/cfme-openshift-embedded-ansible:$VERSION $REGISTRY/cloudforms46/cfme-openshift-httpd:$VERSION $REGISTRY/cloudforms46/cfme-httpd-configmap-generator:$VERSION $REGISTRY/rhgs3/rhgs-server-rhel7:$VERSION $REGISTRY/rhgs3/rhgs-volmanager-rhel7:$VERSION $REGISTRY/rhgs3/rhgs-gluster-block-prov-rhel7:$VERSION $REGISTRY/rhgs3/rhgs-s3-server-rhel7:$VERSION
fi

echo ""
echo "Pull OpenShift Ansible broker, and template service broker"
docker pull $REGISTRY/openshift3/ose-service-catalog:$VERSION
docker pull $REGISTRY/openshift3/ose-ansible-service-broker:$VERSION
docker pull $REGISTRY/openshift3/mediawiki-apb:$VERSION
docker pull $REGISTRY/openshift3/postgresql-apb:$VERSION

if [ "$ISSAVE" = true ] ; then
    echo 'Save OpenShift Ansible broker, and template service broker'
    docker save -o ose-images-ansible-broker-$VERSION_`date +'%Y%m%d'`.tar.gz $REGISTRY/openshift3/ose-service-catalog:$VERSION $REGISTRY/openshift3/ose-ansible-service-broker:$VERSION $REGISTRY/openshift3/mediawiki-apb:$VERSION $REGISTRY/openshift3/postgresql-apb:$VERSION
fi


echo ""
echo "Pull Red Hat-certified Source-to-Image (S2I) builder images that you intend to use in your OpenShift environment"
docker pull $REGISTRY/jboss-webserver-3/webserver31-tomcat7-openshift:latest;
docker pull $REGISTRY/jboss-webserver-3/webserver31-tomcat8-openshift:latest;
docker pull $REGISTRY/jboss-eap-7/eap70-openshift:latest;
docker pull $REGISTRY/jboss-processserver-6/processserver64-openshift:latest;
docker pull $REGISTRY/jboss-decisionserver-6/decisionserver64-openshift:latest;
docker pull $REGISTRY/redhat-sso-7/sso71-openshift:latest;
docker pull $REGISTRY/jboss-datavirt-6/datavirt63-openshift:latest;
docker pull $REGISTRY/jboss-amq-6/amq63-openshift:latest;
docker pull $REGISTRY/jboss-datagrid-6/datagrid65-openshift:latest;
docker pull $REGISTRY/jboss-datagrid-7/datagrid71-openshift:latest;
docker pull $REGISTRY/jboss-fuse-6/fis-java-openshift:latest;
docker pull $REGISTRY/rhscl/mongodb-32-rhel7:latest;
docker pull $REGISTRY/rhscl/mysql-57-rhel7:latest;
docker pull $REGISTRY/rhscl/php-56-rhel7:latest;
docker pull $REGISTRY/rhscl/php-70-rhel7:latest;
docker pull $REGISTRY/rhscl/python-36-rhel7:latest;
docker pull $REGISTRY/rhscl/ruby-24-rhel7:latest;
docker pull $REGISTRY/rhscl/redis-32-rhel7:latest;
docker pull $REGISTRY/openshift3/jenkins-1-rhel7:latest;
docker pull $REGISTRY/openshift3/jenkins-2-rhel7:latest;
docker pull $REGISTRY/openshift3/jenkins-slave-base-rhel7:latest;
docker pull $REGISTRY/openshift3/jenkins-slave-maven-rhel7:latest;
docker pull $REGISTRY/openshift3/jenkins-slave-nodejs-rhel7:latest;
docker pull $REGISTRY/rhscl/nodejs-6-rhel7:latest;

if [ "$ISSAVE" = true ] ; then
    echo 'Save Red Hat-certified Source-to-Image (S2I) builder images that you intend to use in your OpenShift environment'
    docker save -o ose-images-apps-latest_`date +'%Y%m%d'`.tar.gz $REGISTRY/jboss-webserver-3/webserver31-tomcat7-openshift:latest $REGISTRY/jboss-webserver-3/webserver31-tomcat8-openshift:latest $REGISTRY/jboss-eap-7/eap70-openshift:latest $REGISTRY/jboss-processserver-6/processserver64-openshift:latest $REGISTRY/jboss-decisionserver-6/decisionserver64-openshift:latest $REGISTRY/redhat-sso-7/sso71-openshift:latest $REGISTRY/jboss-datavirt-6/datavirt63-openshift:latest $REGISTRY/jboss-amq-6/amq63-openshift:latest $REGISTRY/jboss-datagrid-6/datagrid65-openshift:latest $REGISTRY/jboss-datagrid-7/datagrid71-openshift:latest $REGISTRY/jboss-fuse-6/fis-java-openshift:latest $REGISTRY/rhscl/mongodb-32-rhel7:latest $REGISTRY/rhscl/mysql-57-rhel7:latest $REGISTRY/rhscl/php-56-rhel7:latest $REGISTRY/rhscl/php-70-rhel7:latest $REGISTRY/rhscl/python-36-rhel7:latest $REGISTRY/rhscl/ruby-24-rhel7:latest $REGISTRY/rhscl/redis-32-rhel7:latest $REGISTRY/openshift3/jenkins-1-rhel7:latest $REGISTRY/openshift3/jenkins-2-rhel7:latest $REGISTRY/openshift3/jenkins-slave-base-rhel7:latest $REGISTRY/openshift3/jenkins-slave-maven-rhel7:latest $REGISTRY/openshift3/jenkins-slave-nodejs-rhel7:latest $REGISTRY/rhscl/nodejs-6-rhel7:latest
fi


function_prompt "Syncing Images Finished"
