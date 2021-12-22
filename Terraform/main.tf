module "vpc" {
    source = ".//vpc/"
    project_name = var.project
    vnet-cidr = var.vnet
}
module "elb" {
    source = ".//elb/"
    project = var.project
    location = "${module.vpc.azurerm_resource_group-loc}"
    resource = "${module.vpc.azurerm_resource_group}"
    nic = "${module.nic.azurerm_network_interface}"
    #nic2 = "${module.nic.azurerm_network_interface-nic}"
    nic4 = "${module.nic.azurerm_network_interface-nic4}"
    nic3 = "${module.nic.azurerm_network_interface-nic3}"
    }
module "vm" {
    source = ".//vm/"
    project = var.project
    envname = var.envname
    resource = "${module.vpc.azurerm_resource_group}"
    subnet = "${module.vpc.azurerm_subnet}"
    #dbsubnet = "${module.vpc.azurerm_subnet-db}"
    mansubnet = "${module.vpc.azurerm_subnet-manage}"
    nic = "${module.nic.azurerm_network_interface}"
    nic2 = "${module.nic.azurerm_network_interface-nic}"
    location = "${module.vpc.azurerm_resource_group-loc}"
    lb_id = "${module.elb.azurerm_availability_set}"
    nic3 = "${module.nic.azurerm_network_interface-nic3}"
    nic4 = "${module.nic.azurerm_network_interface-nic4}"
     } 
module "SG"{
    source = ".//SG/"
    project = var.project
    vnet-cidr = var.vnet
    resource = "${module.vpc.azurerm_resource_group}"
    location = "${module.vpc.azurerm_resource_group-loc}"
    #lbpip = "${module.elb.PublicIPForLB}"  
}
#module "ad"{
 #   source = ".//ad/"
  #  project = var.project
#}
module "nic"{
    source = ".//nic/"
    project = var.project
    subnet = "${module.vpc.azurerm_subnet}"
    mansubnet = "${module.vpc.azurerm_subnet-manage}"
    appsubnet = "${module.vpc.azurerm_subnet-app}"
    dbsubnet = "${module.vpc.azurerm_subnet-db}"
    resource = "${module.vpc.azurerm_resource_group}"
    location = "${module.vpc.azurerm_resource_group-loc}"
}
#module "sga"{
 #   source = ".//sga/"
  #  project = var.project
   # msg_id = "${module.SG.azurerm_network_security_group}"
    #mansubnet = "${module.vpc.azurerm_subnet-manage}"
    #subnet = "${module.vpc.azurerm_subnet}"
    #appsubnet = "${module.vpc.azurerm_subnet-app}"
    #dbsubnet = "${module.vpc.azurerm_subnet-db}"
    #websg = "${module.SG.azurerm_network_security_group-web}"
    #appsg = "${module.SG.azurerm_network_security_group-app}"
    #dbsg = "${module.SG.azurerm_network_security_group-db}"
    #resource = "${module.vpc.azurerm_resource_group}"
    #location = "${module.vpc.azurerm_resource_group-loc}" 
#}
    