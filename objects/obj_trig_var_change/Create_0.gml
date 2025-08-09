if variable == undefined {show_error("trigger variable not defined", true)}
if instance == undefined {show_error("trigger instance not defined", true)}
if !instance_exists(instance) {show_error("invalid trigger instance", true)}