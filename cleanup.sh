#!/usr/bin/env bash

######################
# Formatting Globals #
######################

IDENT='s/^/    /'

########################
# Orchestrator Globals #
########################

ORCHESTRATOR_DATA_MLFLOW_GLOBSTRING=${PWD}/metadata/mlflow_data/*
ORCHESTRATOR_DATA_METADATA_GLOBSTRING=${PWD}/metadata/orchestrator_data/*
ORCHESTRATOR_OUTPUTS_GLOBSTRING=${PWD}/outputs/orchestrator_outputs/*

#######################
# Participant Globals #
#######################

PARTY_1_OUTPUTS_GLOBSTRING=${PWD}/outputs/worker_1_outputs/*
PARTY_2_OUTPUTS_GLOBSTRING=${PWD}/outputs/worker_2_outputs/*

###########
# Helpers #
###########

function listArtifacts() {
    local artifacts=$(find $1 | grep -v '.md$')
    echo $artifacts
} 

##########
# Script #
##########

verbose=false

# Process all options supplied on the command line 
while getopts ':v' 'OPTKEY'; do
    case ${OPTKEY} in
        'v')
            verbose='true'
            ;;
        '?')
            echo "INVALID OPTION -- ${OPTARG}" >&2
            exit 1
            ;;
        ':')
            echo "MISSING ARGUMENT for option -- ${OPTARG}" >&2
            exit 1
            ;;
        *)
            echo "UNIMPLEMENTED OPTION -- ${OPTKEY}" >&2
            exit 1
            ;;
    esac
done

echo "Current Directory: ${PWD}"
echo

orchestrator_mlflow=($(listArtifacts "${ORCHESTRATOR_DATA_MLFLOW_GLOBSTRING}"))
orchestrator_metadata=($(listArtifacts "${ORCHESTRATOR_DATA_METADATA_GLOBSTRING}"))
orchestrator_outputs=($(listArtifacts "${ORCHESTRATOR_OUTPUTS_GLOBSTRING}"))
worker_1_outputs=($(listArtifacts "${PARTY_1_OUTPUTS_GLOBSTRING}"))
worker_2_outputs=($(listArtifacts "${PARTY_2_OUTPUTS_GLOBSTRING}"))

echo "Orchestrator metadata targetted for removal:"
if [[ ! -z "$orchestrator_mlflow" ]];
then
    if $verbose;
    then
        find $orchestrator_mlflow | sed "${IDENT}"
    else
        echo $orchestrator_mlflow | sed "${IDENT}"
    fi
fi
if [[ ! -z "$orchestrator_metadata" ]];
then
    if $verbose;
    then 
        find $orchestrator_metadata | sed "${IDENT}"
    else
        echo $orchestrator_metadata | sed "${IDENT}"
    fi
fi
echo

echo "Orchestrator outputs targetted for removal:"
if [[ ! -z "$orchestrator_outputs" ]];
then
    if $verbose;
    then
        find $orchestrator_outputs | sed "${IDENT}"
    else
        echo $orchestrator_outputs | sed "${IDENT}"
    fi
fi
echo

echo "Worker 1 outputs targetted for removal:"
if [[ ! -z "$worker_1_outputs" ]];
then
    if $verbose;
    then
        find $worker_1_outputs | sed "${IDENT}"
    else
        echo $worker_1_outputs | sed "${IDENT}"
    fi
fi
echo

echo "Worker 2 outputs targetted for removal:"
if [[ ! -z "$worker_2_outputs" ]];
then
    if $verbose;
    then
        find $worker_2_outputs | sed "${IDENT}"
    else
        echo $worker_2_outputs | sed "${IDENT}"
    fi
fi
echo

read -p "You are about to permanantly remove these artifacts. Continue? (y/n)?" choice
case "$choice" in 
    y|Y ) 
        printf "%0.s-" {1..50}; echo;

        if [ ! -z "$orchestrator_mlflow" ];
        then 
            echo "MLFlow logs found! Clearing artifacts..."
            rm -rf $orchestrator_mlflow
            echo "MLFlow logs: Process completed!"
        else
            echo "No MLFlow logs detected!"
        fi

        printf "%0.s-" {1..50}; echo;

        if [ ! -z "$orchestrator_metadata" ];
        then 
            echo "Orchestrator metadata found! Clearing artifacts..."
            rm -rf $orchestrator_metadata
            echo "Orchestrator metadata: Process completed!"
        else
            echo "No orchestrator metadata detected!"
        fi

        printf "%0.s-" {1..50}; echo;

        if [ ! -z "$orchestrator_outputs" ];
        then 
            echo "Orchestrator outputs found! Clearing artifacts..."
            rm -rf $orchestrator_outputs
            echo "Orchestrator outputs: Process completed!"
        else
            echo "No orchestrator outputs detected!"
        fi

        printf "%0.s-" {1..50}; echo;

        if [ ! -z "$worker_1_outputs" ];
        then 
            echo "Worker 1 outputs found! Clearing artifacts..."
            rm -rf $worker_1_outputs
            echo "Worker 1 outputs: Process completed!"
        else
            echo "No worker 1 outputs detected!"
        fi

        printf "%0.s-" {1..50}; echo;

        if [ ! -z "$worker_2_outputs" ];
        then 
            echo "Worker 2 outputs found! Clearing artifacts..."
            rm -rf $worker_2_outputs
            echo "Worker 2 outputs: Process completed!"
        else
            echo "No worker 2 outputs detected!"
        fi

        printf "%0.s-" {1..50}; echo;
        ;;
    n|N ) 
        echo "Removal halted! Please review & archive any artifact targets and try again."
        ;;
    * ) 
        echo "Invalid choice specified!"
        ;;
esac
