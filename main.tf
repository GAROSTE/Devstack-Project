terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.47.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name         = "<OS_USERNAME>"
  tenant_name       = "<OS_PASSWORD>"
  tenant_id         = "<OS_PROJECT_ID>"
  password          = "<OS_PASSWORD>"
  auth_url          = "<OS_AUTH_URL>"
  region            = "<OS_REGION_NAME>"
  user_domain_name  = "<OS_USER_DOMAIN_NAME>"
  project_domain_id = "<OS_PROJECT_DOMAIN_ID>"
}

resource "openstack_compute_keypair_v2" "test-keypair" {
  name = "my-keypair"
}



resource "openstack_blockstorage_volume_v3" "volume_1" {
  name        = "volume1-test-server"
  description = "first test volume"
  size        = 20                      # volume size in GB
  image_id    = "dfc1dfb0-d7bf-4fff-8994-319dd6f703d7"            # OS image id
}

resource "openstack_compute_instance_v2" "instance_1" {
  name            = "test-server"           # Server name
  flavor_id       = 4           # OS flavor ID
  key_pair        = "my-keypair"   # SSH key provided in OS
  security_groups = ["default"]

  network {
    name = "default_network"
  }

  block_device {
    uuid                  = "${openstack_blockstorage_volume_v3.volume_1.id}"
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
  }
}

resource "openstack_compute_floatingip_associate_v2" "floatip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.floatip_1.address}"
  instance_id = "${openstack_compute_instance_v2.instance_1.id}"
}