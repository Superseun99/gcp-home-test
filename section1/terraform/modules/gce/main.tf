resource "google_compute_instance" "super-sandbox" {
  boot_disk {
    auto_delete = true
    device_name = var.name
  

    initialize_params {
      image = "projects/debian-cloud/global/images/debian-12-bookworm-v20240815"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = var.machine_type
  name         = "myinstance"
  zone = var.zone

  network_interface {
    network = var.network_name
    subnetwork  = var.subnet_name
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

 

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }


}
