# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "D_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "D_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MODE" -parent ${Page_0}


}

proc update_PARAM_VALUE.D_DEPTH { PARAM_VALUE.D_DEPTH } {
	# Procedure called to update D_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.D_DEPTH { PARAM_VALUE.D_DEPTH } {
	# Procedure called to validate D_DEPTH
	return true
}

proc update_PARAM_VALUE.D_WIDTH { PARAM_VALUE.D_WIDTH } {
	# Procedure called to update D_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.D_WIDTH { PARAM_VALUE.D_WIDTH } {
	# Procedure called to validate D_WIDTH
	return true
}

proc update_PARAM_VALUE.MODE { PARAM_VALUE.MODE } {
	# Procedure called to update MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MODE { PARAM_VALUE.MODE } {
	# Procedure called to validate MODE
	return true
}


proc update_MODELPARAM_VALUE.D_WIDTH { MODELPARAM_VALUE.D_WIDTH PARAM_VALUE.D_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.D_WIDTH}] ${MODELPARAM_VALUE.D_WIDTH}
}

proc update_MODELPARAM_VALUE.D_DEPTH { MODELPARAM_VALUE.D_DEPTH PARAM_VALUE.D_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.D_DEPTH}] ${MODELPARAM_VALUE.D_DEPTH}
}

proc update_MODELPARAM_VALUE.MODE { MODELPARAM_VALUE.MODE PARAM_VALUE.MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MODE}] ${MODELPARAM_VALUE.MODE}
}

