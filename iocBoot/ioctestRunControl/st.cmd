#!../../bin/windows-x64/testRunControl

## You may have to change testRunControl to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/testRunControl.dbd"
testRunControl_registerRecordDeviceDriver pdbbase

##ISIS## Run IOC initialisation 
< $(IOCSTARTUP)/init.cmd

## Load record instances

##ISIS## Load common DB records 
< $(IOCSTARTUP)/dbload.cmd

## Load our record instances
# create records
dbLoadRecords("db/testRunControl.db","P=$(MYPVPREFIX),N=TEST1")
dbLoadRecords("db/testRunControl.db","P=$(MYPVPREFIX),N=TEST2")
# add run control
dbLoadRecords("db/runcontrolMgr.db","P=$(MYPVPREFIX)")
dbLoadRecords("db/runcontrol.db","P=$(MYPVPREFIX),PV=$(MYPVPREFIX)TEST1")
dbLoadRecords("db/runcontrol.db","P=$(MYPVPREFIX),PV=$(MYPVPREFIX)TEST2")
dbLoadRecords("db/gencontrolMgr.db","P=$(MYPVPREFIX),MODE=DC")
dbLoadRecords("db/gencontrol.db","P=$(MYPVPREFIX),PV=$(MYPVPREFIX)TEST1,MODE=DC")
dbLoadRecords("db/gencontrol.db","P=$(MYPVPREFIX),PV=$(MYPVPREFIX)TEST2,MODE=DC")

##ISIS## Stuff that needs to be done after all records are loaded but before iocInit is called 
< $(IOCSTARTUP)/preiocinit.cmd

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=faa59Host"

##ISIS## Stuff that needs to be done after iocInit is called e.g. sequence programs 
< $(IOCSTARTUP)/postiocinit.cmd
