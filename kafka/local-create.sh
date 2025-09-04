#!/bin/sh

if [ -z "$SHELLED" ]; then
    export SHELLED=1
    exec "$SHELL" "$0" "$@"
fi

kafkactl create topic prompt
kafkactl create topic saga.in
kafkactl create topic saga.out
kafkactl create topic read
kafkactl create topic write
kafkactl create topic vec
kafkactl create topic response
kafkactl create topic logs.parsed
