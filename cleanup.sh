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
    local artifacts=($(ls -d $(find $1) | grep -v '.md$'))
    echo $artifacts
} 

orchestrator_mlflow=$(listArtifacts "${ORCHESTRATOR_DATA_MLFLOW_GLOBSTRING}")
orchestrator_outputs=$(listArtifacts "${ORCHESTRATOR_OUTPUTS_GLOBSTRING}")

all_files=("${orchestrator_mlflow[@]}" "${orchestrator_outputs[@]}")
my_array_length=${#all_files[@]}
echo $orchestrator_mlflow $my_array_length

array=( ${PARTY_1_OUTPUTS_GLOBSTRING}* )
# array=( "${array[@]/#"$location"/}" )

echo $array

# array=()
# while IFS=  read -r -d $'\0'; do
#     array+=("$REPLY")
# done < <(find $ORCHESTRATOR_DATA_MLFLOW_GLOBSTRING -print0)

# mapfile -d $'\0' array < <(find $ORCHESTRATOR_DATA_MLFLOW_GLOBSTRING -print0)
# echo "-->"$array

# for file in ( "${orchestrator_mlflow[@]}" "${orchestrator_outputs[@]}" );
# do
#     echo file
# done

##########
# Script #
##########

echo "Current Directory: ${PWD}"

# echo "Orchestrator metadata targetted for removal:"
# ls -d $(find $ORCHESTRATOR_DATA_MLFLOW_GLOBSTRING) | grep -v '.md$' | sed "${IDENT}"
# ls -d $(find $ORCHESTRATOR_DATA_METADATA_GLOBSTRING) | grep -v '.md$' | sed "${IDENT}"

# echo "Orchestrator outputs targetted for removal:"
# ls -d $(find $ORCHESTRATOR_OUTPUTS_GLOBSTRING) | grep -v '.md$' | sed "${IDENT}"

# echo "Worker 1 outputs targetted for removal:"
# ls -d $(find $PARTY_1_OUTPUTS_GLOBSTRING) | grep -v '.md$' | sed "${IDENT}"

# echo "Worker 2 outputs targetted for removal:"
# ls -d $(find $PARTY_2_OUTPUTS_GLOBSTRING) | grep -v '.md$' | sed "${IDENT}"


# read -p "Continue (y/n)?" choice
# case "$choice" in 
#   y|Y ) echo "yes";;
#   n|N ) echo "no";;
#   * ) echo "invalid";;
# esac

# # Clean up orchestrator generated metadata
# rm ./metadata/orchestrator_data/database.json

# # Clean up orchestrator generated outputs
# rm 