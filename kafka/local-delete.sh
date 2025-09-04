#!/bin/sh

if [ -z "$SHELLED" ]; then
    export SHELLED=1
    exec "$SHELL" "$0" "$@"
fi

kafkactl delete topic prompt
kafkactl delete topic saga.in
kafkactl delete topic saga.out
kafkactl delete topic read
kafkactl delete topic write
kafkactl delete topic vec
kafkactl delete topic response
kafkactl delete topic logs.parsed
