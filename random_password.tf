# Generates Random Password for Sql Server Admin
resource "random_password" "password" {
  length           = 16
  min_upper        = 2
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
