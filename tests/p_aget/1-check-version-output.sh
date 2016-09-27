#!/bin/bash
# Author: Dries Verachtert <dries.verachtert@dries.eu>

t_Log "Running $0 - check if aget binary returns version info"
# the version info contains the name 'Aget'
aget -v | grep Aget
