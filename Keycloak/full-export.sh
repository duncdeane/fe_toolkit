#!/bin/bash

docker exec -it keycloak /opt/jboss/keycloak/bin/standalone.sh -Djboss.socket.binding.port-offset=100 -Dkeycloak.migration.action=export -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.realmName=kong -Dkeycloak.migration.usersExportStrategy=REALM_FILE -Dkeycloak.migration.file=/data/export.json
