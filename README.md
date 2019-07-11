# ILDConfig
This package contains ilcsoft configuration files for running simulation and reconstruction for the ILD detector in iLCSoft with lcio, Marlin and DD4hep.

ILDConfig is distributed under the [GPLv3 License](http://www.gnu.org/licenses/gpl-3.0.en.html)

[![License](https://www.gnu.org/graphics/gplv3-127x51.png)](https://www.gnu.org/licenses/gpl-3.0.en.html)


## StandardConfig

- ./production
	- current example/standard configuration files for running simulation (ddsim) and reconstruction (Marlin) for ILD
	
See [./StandardConfig/production/README.md](./StandardConfig/production/README.md) for details.
Following the examples in this file is the quickest way to get started with running iLCSoft for ILD.

## LCFIPlusConfig

Input files for flavor tagging:

- ./steer
	- example steering files

- ./vtxprob
	- input histograms used for flavor tagging

- ./lcfiweights
	- TMVA weight files

## Docker and Singularity

1) Pull the image 

`singularity pull docker://engineren/centos7-ilc:latest`

2) Start the instance 

`singularity instance start --bind $(pwd):/home/ilc/data --bind /cvmfs/clicdp.cern.ch:/cvmfs/clicdp.cern.ch centos7-ilc_latest.sif ilc-gun`

3) Run the script

`singularity run instance://ilc-gun ./docker/generateG4-gun.sh 1`


If you want to run with `N` containers, you need to create `N` instances with the following loop :

`for i in {1..N}; do singularity instance start --bind $(pwd):/home/ilc/data --bind /cvmfs/clicdp.cern.ch:/cvmfs/clicdp.cern.ch centos7-ilc_latest.sif ilc-gun-$i; done`

and run them : 

`for i in {1..N}; do singularity run instance://ilc-gun-$i ./docker/generateG4-gun.sh $i & done`


## License and Copyright
Copyright (C), ILDConfig Authors

ILDConfig is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License long with this program.  If not, see <http://www.gnu.org/licenses/>.
