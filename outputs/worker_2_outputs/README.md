# Federated Outputs
This is a placeholder folder to remind users that within Synergos Director, all federated outputs will be exported here, and can be accessed externally by mounting your own volumes to `"XXX:/orchestrator/outputs"`.

The following files will be generated:
- `"/<collab_id>/<project_id>/<expt_id>/<run_id>/"`
  
    A unique directory made composite keys identifying federated cycle(s) will be generated. 
  
    - `"global_loss_history.json"`

        JSON output recording all validation loss flucuations of the global model across all rounds .

    - `"global_model.pt"`

        PyTorch model weights for the final global model after training

    - `"local_loss_history_<participant_id>.json"`

        JSON output recording all validation loss flucuations of the specified participant's local model across all rounds.

    - `"local_model_<participant_id>.pt"`

        PyTorch model weights for the participant's final local model after training

    - `"checkpoints/<round_idx>/<epoch_idx>/"`

        Directory containing all intermediary results at per round per epoch, with artifacts similar to the aforementioned file structure above.
 
