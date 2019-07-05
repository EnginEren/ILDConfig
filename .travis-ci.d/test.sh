#!/bin/bash

ILCSOFT=/cvmfs/clicdp.cern.ch/iLCSoft/builds/current/CI_gcc
source $ILCSOFT/init_ilcsoft.sh

echo $ILCSOFT

cd /home/ilc/data/Package/StandardConfig/production

##
## Test DDSim
##
echo "-- Running DDSim ${SIM_MODEL} ..."
ddsim \
  --inputFiles Examples/bbudsc_3evt/bbudsc_3evt.stdhep \
  --outputFile /home/ilc/data/Package/bbudsc_3evt_SIM_test_${SIM_MODEL}.slcio \
  --compactFile $lcgeo_DIR/ILD/compact/${SIM_MODEL}/${SIM_MODEL}.xml \
  --steeringFile ddsim_steer.py 

ddsimStatus=$?

if [[ $ddsimStatus != 0 ]]
then
  echo "-- ERROR - DDSim ${SIM_MODEL}: 3 events test failed"
  exit $ddsimStatus
else
  echo "-- DDSim ${SIM_MODEL}: test passing !"
fi

# test presence of output file
if [ ! -f "/home/ilc/data/Package/bbudsc_3evt_SIM_test_${SIM_MODEL}.slcio" ]
then
  ls -lthr
  echo "-- ERROR - DDSim ${SIM_MODEL}: No output file found (bbudsc_3evt_SIM_test_${SIM_MODEL}.slcio)"
  exit 1
fi



