# Worker Outputs
This is a placeholder folder to remind users that within Synergos Worker, all federated outputs will be exported here, and can be accessed externally by mounting your own volumes to `"XXX:/worker/outputs"`.

The following files will be generated:
- `"/<collab_id>/<project_id>"`
  
    A unique directory named after participant's registered collaboration & project

    - `"/operations.json"`

        JSON file cataloging all operations performed by the Synergos Worker node as instructed by the Synergos Director/TTP node for subsequent review/vetting.

    - `"/preprocessing"`

        Dataset-related caches generated from auto-alignment

        - `"/catalogue.json"`

            Dataset-related metadata to be used to populate Synergos Catalogue

        - `"/combined_dataframe_<meta>.csv"`

            Cached artifact generated when all participant's declared dataset partitions are combined into a single representative dataset for the specific dataset type (i.e. `"train"`, `"evaluate"`, `"predict"`)

        - `"/preprocessed_X_<meta>.npy"`

            Final preprocessed Features obtained for the specific dataset type (i.e. `"train"`, `"evaluate"`, `"predict"`)

        - `"/preprocessed_y_<meta>.npy"`

            Final preprocessed labels obtained for the specific dataset type (i.e. `"train"`, `"evaluate"`, `"predict"`)

        - `"/cache"`

            All cached preprocessing intermediaries to circumvent re-processing

            - `"/aggregates/<tag_combination>"`

                Dataset aggregations & metadata to be restored during polling

                - `"/clean_engineered_data.npy"`

                    Raw aggregated ndarray containing aggregated features & labels

                - `"/clean_engineered_headers.txt"`

                    Raw unaligned headers (i.e. post-OHE column names) corresponding to raw aggregated ndarray

                - `"/clean_engineered_schema.json"`

                    Raw unaligned schema (i.e. datatype-to-column mapping) corresponding to raw aggregated ndarray

            - `"/<data_type>"`

                Individual dataset artifacts generated pre-aggregation

                - `"/clean_engineered_data.npy"`

                    Raw re-formated ndarray containing aggregated features & labels

                - `"/clean_engineered_headers.txt"`

                    Raw unaligned headers (i.e. post-OHE column names) corresponding to raw re-formated ndarray

                - `"/clean_engineered_schema.json"`

                    Raw unaligned schema (i.e. datatype-to-column mapping) corresponding to raw re-formated ndarray

    - `"/<expt_id>/<run_id>/<meta>"`

        A unique directory named after participant's registered experiment, run and dataset type (i.e. `"train"`, `"evaluate"`, `"predict"`) declared during the federated cycle. 

        - `"inference_predictions_<meta>.txt"`

            TEXT file storing model logits (if available) otherwise same as `"inference_scores_<meta>.txt"`
 
        - `"inference_scores_<meta>.txt"`

            TEXT file storing raw model outputs for post-mortem processing

        - `"inference_statistics_<meta>.json"`

            JSON file storing the generated statistics unique to participant's
            declared datasets
