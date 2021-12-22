resource "azurerm_virtual_machine" "main1" {
  name                  = "${var.project}-webvm"
  location              = "${var.location}"
  resource_group_name   = "${var.resource}"
  network_interface_ids = ["${var.nic}"]
  availability_set_id   = "${var.lb_id}"
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.project}"
    admin_username = "${var.project}"
    admin_password = "${var.project}-2707"
    custom_data    = file("apache.sh")
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "${var.envname}"
  }
}
resource "azurerm_virtual_machine" "main2" {
  name                  = "${var.project}-appvm"
  location              = "${var.location}"
  resource_group_name   = "${var.resource}"
  network_interface_ids = ["${var.nic3}"]
  availability_set_id   = "${var.lb_id}"
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.project}"
    admin_username = "${var.project}"
    admin_password = "${var.project}-2707"
    custom_data    = file("tomcat.sh")
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "${var.envname}"
  }
}
resource "azurerm_virtual_machine" "main3" {
  name                  = "${var.project}-managvm"
  location              = "${var.location}"
  resource_group_name   = "${var.resource}"
  network_interface_ids = ["${var.nic2}"]
  availability_set_id   = "${var.lb_id}"
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk3"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.project}"
    admin_username = "${var.project}"
    admin_password = "${var.project}-2707"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "${var.envname}"
  }
}
resource "azurerm_virtual_machine" "main4" {
  name                  = "${var.project}-dbvm"
  location              = "${var.location}"
  resource_group_name   = "${var.resource}"
  network_interface_ids = ["${var.nic4}"]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk4"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.project}"
    admin_username = "${var.project}"
    admin_password = "${var.project}-2707"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "${var.envname}"
  }
}