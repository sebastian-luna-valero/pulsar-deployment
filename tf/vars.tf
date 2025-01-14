// Change this file according to your cloud infrastructure and personal settings
// All variables in < > should be checked and personalized

variable "nfs_disk_size" {
  default = 100
}

# Must be available in your OpenStack tenant
variable "flavors" {
  type = map(any)
  default = {
    "central-manager" = "M1-NVME-2vCPU-8R-50D"
    "nfs-server"      = "M1-NVME-2vCPU-8R-50D"
    "exec-node"       = "M1-NVME-4vCPU-16R-50D"
    "gpu-node"        = "M1-NVME-4vCPU-16R-50D"
  }
}

# This can later be increased or decreased without everything redeployed
variable "exec_node_count" {
  default = 1
}

variable "gpu_node_count" {
  default = 0
}

variable "public_key" {
  type = map(any)
  default = {
    name   = "Sebastian Luna-Valero"
    pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6NRGgoa77is6YJGo7xJP1awgMjTDC3b39vEfdTDuN85I8YAGluctwxZjCXTuCFJT6XpnD+8k6NFJytzbcX8ZsIwrFJEwW+xexbaYESnlDfYfF+tSyozMJFGCUzt9BC8tpPbK50gKNJ70rlx6I3biXA1JhhFOwVq661ISwID/akNqHb1lX4T4c9xGJKSm/GpN16KH43BtgXpdznQoVJIp/5cwWqJfmpSe2yVBZqJ3eISFlXXbMwuys8MEvyY0xQRvRIB5P+ACjRQyqrnGGP8rYwtVuvPkUrzrKuLK5J1p0xm4t5aYNGrKyL3WQkk1V4qNN+Acb/yQCyVeInJSE+4fF /home/sebastian/.ssh/id_rsa"
  }
}

variable "name_prefix" {
  default = "vgcn-"
}

variable "name_suffix" {
  default = ".pulsar"
}

variable "secgroups_cm" {
  type = list(any)
  default = [
    "public-ssh",
    "ingress-private",
    "egress-public",
  ]
}

variable "secgroups" {
  type = list(any)
  default = [
    "ingress-private", //Should open at least nfs, 9618 for HTCondor and 22 for ssh
    "egress-public",
  ]
}

# Name of the public network that is already present in your openstack tenant
variable "public_network" {
  default = "PSNC-EXT-PUB1-EDU"
}

variable "private_network" {
  type = map(any)
  default = {
    name        = "net01"
    subnet_name = "subnet01"
    cidr4       = "192.168.0.0/16" //This is important to make HTCondor work
  }
}

variable "ssh-port" {
  default = "22"
}

// Set these variables during execution terraform apply -var "pvt_key=<~/.ssh/my_private_key>" 
// -var "condor_pass=<MyCondorPassword>" 
// -var "mq_string=pyamqp://<your-rabbit-mq-user>:<the-password-we-provided-to-you>@mq.galaxyproject.eu:5671//pulsar/<your-rabbit-mq-vhost>?ssl=1"
variable "pvt_key" {}

variable "condor_pass" {}

variable "mq_string" {}
