# GRASP-isoelectronic-sequence
calculating ground states of sequential atomic number Z having same number of electrons.

## Install
1. Install GRASP92
1. `git clone https://github.com/harapekoaomushi/GRASP-isoelectronic-sequence.git`

## Usage
1. `cd GRASP-isoelectronic-sequence`
1. Run `./mkenv.sh` then you enter new Bash environment with those scripts PATH.
1. Make CSL file by `gencsl` of GRASP92. Generating file name should be "grasp92.csl" (default setting of GRASP92)
1. `testallatoms.sh (lowest atomic number) (largest atomic number)`
Then you got the result on level1 and level123 directories.
