# Duality-Based Framework for Minimal Cut Set Computation

This repository contains the implementation and analysis developed during my MSc thesis in Systems Biology and Bioinformatics. The project investigates the duality between **Minimal Cut Sets (MCSs)** and **Elementary Conversion Modes (ECMs)**, with the goal determining MCSs from dual ECMs. ECMs in this work were primarily determined using [ecmtool] (https://github.com/SystemsBioinformatics/ecmtool/tree/master)

---

## Repository Structure

```
Thesis/
├── ecmtool/                    # Extended fork of ecmtool (ECM computation engine)
│   ├── ecmtool/                # Core Python package
│   │   ├── conversion_cone.py  # ECM enumeration (indirect & dual methods)
│   │   ├── helpers.py          # Utilities: MPI printing, redundancy, I/O
│   │   ├── network.py          # SBML parsing, network compression
│   │   ├── intersect_directly_mpi.py  # Direct MPI-parallel enumeration
│   │   └── nullspace.py        # Nullspace computations
│   ├── main.py                 # CLI entry point
│   ├── ExampleUseECM.py        # Library usage example
│   ├── models/                 # SBML metabolic network models (e.g. e_coli_core, iND750)
│   ├── tests/                  # Pytest test suite
│   ├── docker/                 # Dockerfile and Singularity definition
│   ├── results_and_corresponding_runscripts/  # Pre-computed results + run scripts
│   └── requirements.txt
├── efmtool_link/               # Python bridge to EFMtool (Java-based EFM enumerator)
│   └── efmtool_link/
│       ├── efmtool4cobra.py    # COBRApy-compatible interface
│       ├── efmtool_intern.py   # Internal Java interface via JPype
│       └── efmtool_extern.py   # External process interface
├── notebooks/                  # Jupyter notebooks for analysis
│   ├── write-dual-sbml.ipynb           # Construct dual SBML model
│   ├── write-dual-MZ-sbml.ipynb        # Construct dual SBML with M/Z structure
│   ├── MCS_from_dual_EFMs.ipynb        # Derive MCS from dual EFMs
│   ├── analyze_dual_conversions.ipynb  # Analyse ECM/EFM results
│   └── milp/                           # MILP-based MCS computation notebooks
│       ├── EFM_milp.ipynb
│       ├── ECMs_milp.ipynb
│       ├── MCS_milp_EFM.ipynb
│       └── MCS_milp_ECM.ipynb
├── results/                    # Output CSV files from model runs
│   ├── ecoli5010.csv
│   ├── dual_MZ_PQS_model.csv
│   └── ...
└── ecmtool3.9.yml              # Full conda environment specification
```

---

## Installation

The repository includes a complete conda environment file that pins all dependencies.

```bash
# Clone the repository
git clone <your-repo-url>
cd Thesis

# Create the environment from the lockfile
conda env create -f ecmtool3.9.yml

# Activate it
conda activate ecmtool3.9
```

This installs Python 3.9, NumPy, SciPy, COBRApy, ecmtool, efmtool-link, CPLEX (IBM Decision Optimization), Jupyter, and all other dependencies.

## Usage

### 1. Jupyter notebooks

Start Jupyter from the repository root:

```bash
jupyter notebook
```

The `notebooks/` directory contains the main analytical workflows:

- **`write-dual-sbml.ipynb`** — Constructs the dual SBML model from a primal metabolic network.
- **`write-dual-MZ-sbml.ipynb`** — Extends the dual construction with MZ structure
- **`MCS_from_dual_EFMs.ipynb`** — Enumerates EFMs on the dual network and converts them to MCS of the primal network.
- **`analyze_dual_conversions.ipynb`** — Post-processing of dual ECMs into primal MCS and outputs across model variants.
- **`milp/`** — Alternative MCS computation via Mixed-Integer Linear Programming (requires CPLEX). Shortest enumeration of ECMs and EFMs is included, as well as their implementations for shortest MCS computation

### 2. Bash scripts

Several scripts are provided for the automated and replicable enumeration of ECMs/dual ECMs for different models. Scripts used to process the intermediate enumerated rays using mplrs and to time running times are also provided.


