# Synergos Simulator

Afraid to commit to a full Synergos deployment? Want to test the waters first? Or maybe you just want to get a better understanding of our underlying architectures & procedures? 

Welcome to ***Synergos Simulator***! 

Your all-in-one toolbox for simulating a Synergos network :)

---

## Installation

```
# Download source repository
git clone https://gitlab.int.aisingapore.org/aims/federatedlearning/synergos_simulator.git
cd ./synergos_simulator

# Initialize & update all modules & submodules
git submodule update --init --recursive
git submodule update --recursive --remote

# Setup virtual environment
conda create -n synergos_env python=3.7
conda activate synergos_env

# Install Synergos Driver in development mode
pip install -e ./synergos
```

---

## Simulated Deployments

### A. Synergos Basic 

![Synergos Basic Components](./docs/images/synbasic_setup.png)

*Setting up Synergos Basic for simple tests*

```
# Start SynBasic grid
docker-compose -f docker-compose-synbasic.yml up --build    # with changes
OR
docker-compose -f docker-compose-synbasic.yml up            # with no changes

# Terminate SynBasic grid
docker-compose -f docker-compose-synbasic.yml down
```

> All Synergos Cluster components will be hosted on a local docker subnet of `"172.18.0.X"` called `"synergos_basic"`.<br>Please make sure that these addresses are accessible at time of simulation!

| Name | Service | Component | Host | Internal Port(s) | External Port(s) |
| ---- | ------- | --------- | ---- | ---------------- | ---------------- |
| `synb_ttp` | `synergos_ttp_basic` | synergos_ttp | `172.18.0.2` | `5000 (command port)`<br>`8020 (data port)` | `5000`<br>`8020` |
| `synb_worker_1` | `synergos_worker_1` | synergos_worker | `172.18.0.3` | `5000 (command port)`<br>`8020 (data port)` | `5001`<br>`8021` |
| `synb_worker_2` | `synergos_worker_2` | synergos_worker | `172.18.0.4` | `5000 (command port)`<br>`8020 (data port)` | `5002`<br>`8022` |
| `synb_synui_nav` | `synergos_ui_nav` | synergos_ui | `172.18.0.5` | `4000 (main port)` | `4000` |
| `synb_synui_view` | `synergos_ui_view` | synergos_ui | `172.18.0.6` | `4000 (main port)` | `4001` |
| `synb_synui_track` | `synergos_ui_track` | synergos_ui | `172.18.0.7` | `4000 (main port)` | `4002` |

<br><br>

### B. Synergos Plus 

![Synergos Plus Components](./docs/images/synplus_setup.png)

*Setting up Synergos Plus for more analytical tools*

```
# Start SynPlus grid
docker-compose -f docker-compose-synplus.yml up --build    # with changes
OR
docker-compose -f docker-compose-synplus.yml up            # with no changes

# Terminate SynPlus grid
docker-compose -f docker-compose-synplus.yml down
```

> All Synergos Cluster components will be hosted on a local docker subnet of `"172.19.0.X"` called `"synergos_plus"`.<br>Please make sure that these addresses are accessible at time of simulation!

| Name | Service | Component | Host | Internal Port(s) | External Port(s) |
| ---- | ------- | --------- | ---- | ---------------- | ---------------- |
| `synp_ttp` | `synergos_ttp_basic` | synergos_ttp | `172.19.0.2` | `5000 (command port)`<br>`8020 (data port)` | `5000`<br>`8020` |
| `synp_worker_1` | `synergos_worker_1` | synergos_worker | `172.19.0.3` | `5000 (command port)`<br>`8020 (data port)` | `5001`<br>`8021` |
| `synp_worker_2` | `synergos_worker_2` | synergos_worker | `172.19.0.4` | `5000 (command port)`<br>`8020 (data port)` | `5002`<br>`8022` |
| `synp_synui_nav` | `synergos_ui_nav` | synergos_ui | `172.19.0.5` | `4000 (main port)` | `4000` |
| `synp_synui_view` | `synergos_ui_view` | synergos_ui | `172.19.0.6` | `4000 (main port)` | `4001` |
| `synp_synui_track` | `synergos_ui_track` | synergos_ui | `172.19.0.7` | `4000 (main port)` | `4002` |
| `mongo` | `mongo` | synergos_logger | `172.19.0.8` | default | - |
| `elasticsearch` | `elasticsearch` | synergos_logger | `172.19.0.9` | default | - |
| `synp_logger` | `synergos_logger` | synergos_logger | `172.19.0.10` | `9000 (main port)`<br>`9000 (ui port)`<br>`9100 (sysmetrics port)`<br>`9200 (director port)`<br>`9300 (ttp port)`<br>`9400 (worker port)` | `9000`<br>`9000`<br>`9100`<br>`9200`<br>`9300`<br>`9400` |
| `synp_mlops` | `synergos_mlops` | synergos_mlops | `172.19.0.11` | `5500 (main port)`<br>`5500 (ui port)` | `5500`<br>`5500` |

<br><br>

### C. Synergos Cluster 

![Synergos Components](./docs/images/syncluster_setup.png)

*Setting up Synergos Cluster for complex workloads*

``` 
# Start SynCluster grid
docker-compose -f docker-compose-syncluster.yml up --build    # with changes
OR
docker-compose -f docker-compose-syncluster.yml up            # with no changes

# Terminate SynCluster grid
docker-compose -f docker-compose-syncluster.yml down
```

> All Synergos Cluster components will be hosted on a local docker subnet of `"172.20.0.X"` called `"synergos_cluster"`.<br>Please make sure that these addresses are accessible at time of simulation!


| Name | Service | Component | Host | Internal Port(s) | External Port(s) |
| ---- | ------- | --------- | ---- | ---------------- | ---------------- |
| `sync_director` | `synergos_director` | synergos_director | `172.20.0.2` | `5000 (command port)` | `5000` |
| `sync_ttp_1` | `synergos_ttp_1` | synergos_ttp | `172.20.0.3` | `5000 (command port)`<br>`8020 (data port)` | `6000`<br>`9020` |
| `sync_worker_1_n1` | `synergos_worker_1_node_1` | synergos_worker | `172.20.0.4` | `5000 (command port)`<br>`8020 (data port)` | `5001`<br>`8021` |
| `sync_worker_2_n1` | `synergos_worker_2_node_1` | synergos_worker | `172.20.0.5` | `5000 (command port)`<br>`8020 (data port)` | `5002`<br>`8022` |
| `sync_ttp_2` | `synergos_ttp_2` | synergos_ttp | `172.20.0.6` | `5000 (command port)`<br>`8020 (data port)` | `7000`<br>`10020` |
| `sync_worker_1_n2` | `synergos_worker_1_node_2` | synergos_worker | `172.20.0.7` | `5000 (command port)`<br>`8020 (data port)` | `5003`<br>`8023` |
| `sync_worker_2_n2` | `synergos_worker_2_node_2` | synergos_worker | `172.20.0.8` | `5000 (command port)`<br>`8020 (data port)` | `5004`<br>`8024` |
| `sync_synui_nav` | `synergos_ui_nav` | synergos_ui | `172.20.0.9` | `4000 (main port)` | `4000` |
| `sync_synui_view` | `synergos_ui_view` | synergos_ui | `172.20.0.10` | `4000 (main port)` | `4001` |
| `sync_synui_track` | `synergos_ui_track` | synergos_ui | `172.20.0.11` | `4000 (main port)` | `4002` |
| `mongo` | `mongo` | synergos_logger | `172.20.0.12` | default | - |
| `elasticsearch` | `elasticsearch` | synergos_logger | `172.20.0.13` | default | - |
| `sync_logger` | `synergos_logger` | synergos_logger | `172.20.0.14` | `9000 (main port)`<br>`9000 (ui port)`<br>`9100 (sysmetrics port)`<br>`9200 (director port)`<br>`9300 (ttp port)`<br>`9400 (worker port)` | `9000`<br>`9000`<br>`9100`<br>`9200`<br>`9300`<br>`9400` |
| `sync_mlops` | `synergos_mlops` | synergos_mlops | `172.20.0.15` | `5500 (main port)`<br>`5500 (ui port)` | `5500`<br>`5500` |
| `sync_mq` | `synergos_mq` | synergos_manager | `172.20.0.16` | `5672 (main port)`<br>`15672 (ui port)` | `5672`<br>`15672` |

---

## Interactions

### A. Via Synergos UI


### B. Via Synergo Driver (i.e. Jupyter notebooks)

```
# Ensure virtual environment is active
conda activate synergos_env

# Install Jupyter
pip install jupyter

# Start your Jupyter notebook server
jupyter notebook
```



---

### Cleaning Up

```
# Grant permission to run cleanup.sh
chmod +x ./cleanup.sh

# Perform cleanup!
./cleanup.sh
```