# Configuring terraform kubernetes provider with minikube context and pointing to local kube config

provider "kubernetes" {
  config_context_cluster   = "minikube"
  config_path = "~/.kube/config"
}
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
#  version    = "3.6.0"
#  namespace  = "jenkins"
  timeout    = 600
#  values = [
#    file("values.yaml"),
#  ]
#
#  set {
#    name  = "controller.adminUser"
#    value = "admin"
#  }
#
#  set {
#    name  = ""controller.adminPassword""
#    value = "yfcved44"
#  }
  
}
