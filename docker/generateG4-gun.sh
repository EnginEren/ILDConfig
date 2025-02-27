#!/bin/bash

ILCSOFT=/cvmfs/clicdp.cern.ch/iLCSoft/builds/current/CI_gcc
source $ILCSOFT/init_ilcsoft.sh

echo $ILCSOFT

cd /home/ilc/data/StandardConfig/production

export SIM_MODEL=ILD_l5_v02

##
## Generate G4 showers with gun DDSim
##
echo "-- Running DDSim ${SIM_MODEL} ..."
ddsim \
    --outputFile photon-shower-100kEvents-$1.slcio \
  --compactFile $lcgeo_DIR/ILD/compact/${SIM_MODEL}/${SIM_MODEL}.xml \
  --steeringFile ddsim_steer_gun.py > ${SIM_MODEL}.log 2>&1


