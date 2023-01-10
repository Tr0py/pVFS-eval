#!/bin/bash
# Usage: ./perf.sh <name> <command-to-run-program>
# Set FLAME_GRAPH_ROOT  to the root of the FlameGraph directory
# Output: ./perf-data/<name>.svg containing the FlameGraph

#Please run as root!

set -x

PERF=~/perf
FLAME_GRAPH_ROOT=/home/ziyi/git/pvfs-eval/scripts/FlameGraph

mkdir perf-data

# Use perf to get data
time $PERF record -F 99 --call-graph fp -g  $2 $3 $4 $5 $6 $7   #generate perf data
$PERF script > ./perf-data/out.$1   # generate stack data

# Use FlameGraph to generate graph
$FLAME_GRAPH_ROOT/stackcollapse-perf.pl ./perf-data/out.$1 > ./perf-data/$1.fold # fold data
$FLAME_GRAPH_ROOT/flamegraph.pl ./perf-data/$1.fold > ./perf-data/$1.svg # generate flame graph
echo "The graph is at:"
realpath ./perf-data/$1.svg
