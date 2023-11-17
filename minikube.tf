provider "minikube" {
  kubernetes_version = "v1.26.3"
}

resource "minikube_cluster" "hyperkit" {
  vm           = true
  driver       = "hyperkit"
  cluster_name = "terraform-provider-minikube-acc-hyperkit"
  nodes        = 3
  cni          = "bridge" # Allows pods to communicate with each other via DNS
  addons = [
    "dashboard",
    "default-storageclass",
    "ingress",
    "storage-provisioner"
  ]
}
