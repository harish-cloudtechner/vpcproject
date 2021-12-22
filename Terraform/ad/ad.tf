resource "azuread_group" "devops" {
  display_name = "${var.project}-Devops"
}
resource "azuread_group" "readonly" {
  display_name = "${var.project}-readonly"
}
resource "azuread_group" "Admin" {
  display_name = "${var.project}-Admin"
}