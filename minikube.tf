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
  container_runtime = "docker"
  cluster_name = "terraform-provider-minikube-acc-docker"
  nodes        = 3
  cni          = "bridge"
  namespace    = "jenkins"
  addons = [
    "ingress",
    "default-storageclass",
    "storage-provisioner"
  ]
}
