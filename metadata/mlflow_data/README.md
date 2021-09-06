# MLFlow Logs
This is a placeholder folder to remind users that within Synergos Director/TTP, all MLFlow-related logs, parameters, metrics & artifacts will be exported here, and can be accessed externally by mounting your own volumes to `"XXX:/mlflow"`.

The following files will be generated:
- `"/<mlflow_expt_id>"`
  
    A unique directory named using MLFLow's internal experiment indexing
  
    - `"meta.yaml"`

        Metadata describing the current MLFlow experiment

    - `"/<mlflow_run_id>"`

        A unique directory named using MLFlow's internal run indexing

        - `"meta.yml"`

            Metadata describing the current MLFlow run

        - `"/artifacts/*"`

            All cached files generated from a federated cycle

        - `"/metrics/*"`

            All computed metrics generated from a federated cycle

        - `"/params/*"`

            All parameters used to configure aforementioned federated cycle

        - `"/tags/*"`

            All tags used to classify/partition generated metadata
    
