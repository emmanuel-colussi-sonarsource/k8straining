#!/bin/bash

export NAMESPACE="student1"
export SONARQUBE_JDBC_USERNAME="sonarqube"
export SONARQUBE_JDBC_PASSWORD="sonarqube"
export DATABASE="sonarqube9"
export CLUSTIP=`kubectl -n ${NAMESPACE} get -o template service/pgsql-svc1 --template='{{.spec.clusterIP}}'`

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: sonarqube-config 
  namespace: ${NAMESPACE}
data:
    SONAR_SEARCH_JAVAADDITIONALOPTS: "-Dbootstrap.system_call_filter=false"
    SONARQUBE_JDBC_USERNAME: "sonarqube"
    SONARQUBE_JDBC_PASSWORD: "sonarqube"
    SONARQUBE_JDBC_URL: "jdbc:postgresql://${CLUSTIP}:5432/sonarqube9"
EOF
