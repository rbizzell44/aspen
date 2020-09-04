resource "google_folder" "default" {
  display_name = "${var.folder_name}"
  parent       = "${var.parent}"
}
