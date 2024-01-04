#!/bin/bash

light_status(){
        local STATUS_REGEX="on\":true"
        local INFO=$(curl -s -H \"Accept: application/json\" http://<IP>/api/<KEY>/lights/1)
        if [[ $INFO =~ $STATUS_REGEX ]]; then
                local CMD=$(curl --request PUT --data '{"on":false}' http://<IP>/api/<KEY>/lights/1/state -o light.log)
        else
                local CMD=$(curl --request PUT --data '{"on":true}' http://<IP>/api/<KEY>/lights/1/state -o light.log)
        fi
}
light_status
