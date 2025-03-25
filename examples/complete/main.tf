data "alicloud_zones" "default" {
}

data "alicloud_images" "default" {
  name_regex = "^centos_6"
}

data "alicloud_instance_types" "default" {
  availability_zone    = data.alicloud_zones.default.zones[0].id
  cpu_core_count       = 2
  memory_size          = 8
  instance_type_family = "ecs.g6"
}

module "example" {
  source                     = "../.."
  name                       = var.name
  availability_zone          = data.alicloud_zones.default.zones[0].id
  vpc_cidr_block             = "172.16.0.0/12"
  vs_cidr_block              = "172.16.0.0/21"
  instance_type              = data.alicloud_instance_types.default.instance_types[0].id
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = var.system_disk_name
  system_disk_description    = var.system_disk_description
  image_id                   = data.alicloud_images.default.images[0].id
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  ecs_size                   = 1200
  data_disks_name            = "data_disks_name"
  category                   = "cloud_efficiency"
  description                = "tf-vpc-ecs-description"
  encrypted                  = true
}
