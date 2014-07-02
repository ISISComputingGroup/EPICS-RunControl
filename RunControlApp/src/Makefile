TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#==================================================
# build a support library

LIBRARY_IOC += RunControl

# xxxRecord.h will be created from xxxRecord.dbd
#DBDINC += xxxRecord
# install RunControl.dbd into <top>/dbd
DBD += RunControl.dbd

# specify all source files to be compiled and added to the library
#RunControl_SRCS += xxx

RunControl_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

