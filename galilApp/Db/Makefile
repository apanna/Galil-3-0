TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
DB += galil_analog_in.template
DB += galil_analog_out.template
DB += galil_coordinate_system.template
DB += galil_digital_in_bit.template
DB += galil_digital_out_bit.template
DB += galil_dmc_ctrl.template
DB += galil_forward_transform.template
DB += galil_kinematic_variable.template
DB += galil_motor.template
DB += galil_motor_extras.template
DB += galil_profileMoveAxis.template
DB += galil_profileMoveController.template
DB += galil_reverse_transforms.template
DB += galil_rio_ctrl.template
DB += galil_user_array.template
DB += galil_userdef_records.template

ifdef DEVIOCSTATS
	DB_INSTALLS += $(DEVIOCSTATS)/db/iocAdminSoft.db
endif
ifdef AUTOSAVE
	DB_INSTALLS += $(AUTOSAVE)/asApp/Db/save_restoreStatus.db
endif
#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

