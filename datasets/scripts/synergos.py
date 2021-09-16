from synergos import Driver

host = "localhost"
port = 5000

# Initiate Driver
driver = Driver(host=host, port=port)

############################################################
# Phase 1: CONNECT - Submitting TTP & Participant metadata #
############################################################

# 1A. TTP creates a collaboration

collab_task = driver.collaborations
collab_task.create('test_collaboration')

# 1B. TTP controller creates a project

driver.projects.create(
    collab_id="test_collaboration",
    project_id="test_project",
    action="classify",
    incentives={
        'tier_1': [],
        'tier_2': [],
    }
)

# 1C. TTP controller creates an experiment

driver.experiments.create(
    collab_id="test_collaboration",
    project_id="test_project",
    expt_id="test_experiment",
    model = [
        # Input: N, C, Height, Width [N, 1, dimension, dimension]
        {
            "activation": "relu",
            "is_input": True,
            "l_type": "Conv2d",
            "structure": {
                "in_channels": 1, 
                "out_channels": 4, # [N, 4, 32, 32]
                "kernel_size": 3,
                "stride": 1,
                "padding": 1
            }
        },
        {
            "activation": None,
            "is_input": False,
            "l_type": "Flatten",
            "structure": {}
        },
        # ------------------------------
        {
            "activation": "sigmoid",
            "is_input": False,
            "l_type": "Linear",
            "structure": {
                "bias": True,
                "in_features": 4 * 32 * 32,
                "out_features": 1
            }
        }
    ]
)


# 1D. TTP controller creates a run

driver.runs.create(
    collab_id="test_collaboration",
    project_id="test_project",
    expt_id="test_experiment",
    run_id="test_run",
    rounds=2, 
    epochs=1,
    base_lr=0.0005,
    max_lr=0.005,
    criterion="L1Loss"
)


# 1E. Participants registers their servers' configurations and roles

participant_resp_1 = driver.participants.create(
    participant_id="worker_1",
)

participant_resp_2 = driver.participants.create(
    participant_id="worker_2",
)

registration_task = driver.registrations

    # Add and register worker_1 node
registration_task.add_node(
    host='172.17.0.2',
    port=8020,
    f_port=5000,
    log_msgs=True,
    verbose=True
)
registration_task.list_nodes()

registration_task.create(
    collab_id="test_collaboration",
    project_id="test_project",
    participant_id="worker_1",
    role="host"
)

    # Add and register worker_2 node
registration_task = driver.registrations
registration_task.add_node(
    host='172.17.0.3',
    port=8020,
    f_port=5000,
    log_msgs=True,
    verbose=True
)
registration_task.list_nodes()

registration_task.create(
    collab_id="test_collaboration",
    project_id="test_project",
    participant_id="worker_2",
    role="guest"
)

# 1F. Participants registers their tags for a specific project

driver.tags.create(
    collab_id="test_collaboration",
    project_id="test_project",
    participant_id="worker_1",
    train=[["train"]],
    evaluate=[["evaluate"]],
    predict = [["predict"]]
)

driver.tags.create(
    project_id="test_project",
    participant_id="worker_2",
    train=[["train"]],
    evaluate=[["evaluate"]],
    predict=[["predict"]]
)


#######################################################
# Phase 2: TRAIN - Alignment, Training & Optimisation #
#######################################################

# 2A. Perform multiple feature alignment to dynamically configure datasets and models for cross-grid compatibility

driver.alignments.create(
    collab_id='test_collaboration',
    project_id="test_project",
    verbose=False,
    log_msg=False
)


# 2B. Trigger training across the federated grid

model_resp = driver.models.create(
    collab_id="test_collaboration",
    project_id="test_project",
    expt_id="test_experiment",
    run_id="test_run",
    log_msg=False,
    verbose=False
)


################################################
# Phase 3: EVALUATE - Validation & Predictions #
################################################

# 3A. Perform validation(s) of combination(s)

driver.validations.create(
    collab_id='test_collaboration',
    project_id="test_project",
    expt_id="test_experiment",
    run_id="test_run",
    log_msg=False,
    verbose=False
)


# 3B. Perform prediction(s) of combination(s)

driver.predictions.create(
    collab_id="test_collaboration",
    tags={"test_project": [["predict"]]},
    participant_id="worker_1",
    project_id="test_project",
    expt_id="test_experiment",
    run_id="test_run"
)
