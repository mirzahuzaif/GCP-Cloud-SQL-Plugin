#cat main.tf
variable "project" {}
variable "region" {}
provider "google" {
project = "${var.project}"
region = "${var.region}"
}
resource "google_sql_database_instance" "master" {
name = "instance11"
database_version = "POSTGRES_14"
region = "${var.region}"
settings {
tier = "db-f1-micro"
}
}
resource "google_sql_database" "database" {
name = "database11"
instance = "${google_sql_database_instance.master.name}"
charset = "utf8"
collation = "en_US.UTF8"
}
#resource "google_sql_user" "users" {
#name = "root"
#instance = "${google_sql_database_instance.master.name}"
#host = "%"
#password = "Huzaif"
#}