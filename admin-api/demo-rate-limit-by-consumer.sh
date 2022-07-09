#!/bin/bash

http POST kongcluster:8001/services \
  name=mockbin_service \
  url=http://mockbin:8080/request

# curl -sX POST kongcluster:8001/services \
#        -d name=mockbin_service \
#        -d url=http://mockbin:8080/request \
#        | jq

http -f POST kongcluster:8001/services/mockbin_service/routes \
  name=mockbin_route \
  paths=/mockbin

# curl -sX POST kongcluster:8001/services/mockbin_service/routes \
#       -d name=mockbin_route \
#       -d paths=/mockbin \
#       | jq
      
http -f POST kongcluster:8001/services/mockbin_service/plugins \
  name=rate-limiting \
  config.minute=16 \
  config.policy=local

# curl -sX POST kongcluster:8001/services/mockbin_service/plugins \
#       -d name=rate-limiting \
#       -d config.minute=16 \
#       -d config.policy=local \
#       | jq

http POST kongcluster:8001/services/mockbin_service/plugins name=key-auth

# curl -sX POST kongcluster:8001/services/mockbin_service/plugins \
#       -d name=key-auth \
#       | jq

http POST kongcluster:8001/consumers username=Jane
# curl -sX POST kongcluster:8001/consumers \
#       -d username=Jane \
#       | jq

http POST kongcluster:8001/consumers/Jane/key-auth key=JanePassword
# curl -sX POST kongcluster:8001/consumers/Jane/key-auth \
#       -d key=JanePassword \
#       | jq



