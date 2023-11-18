terraform {
  required_version = ">= 1.0"

  required_providers {
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = ">= 0.3.4"
    }
  }
}

provider "minikube" {
  kubernetes_version = "v1.27.3"
}

resource "minikube_cluster" "docker" {
  driver       = "docker"
  cluster_name = "terraform-provider-minikube-acc-docker"
  nodes        = 3
  namespace    = "jenkins"
  addons = [
    "default-storageclass",
    "storage-provisioner"
  ]
}
