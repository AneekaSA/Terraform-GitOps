terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

# Provision a Kind Cluster
resource "null_resource" "minikube_cluster" {
  provisioner "local-exec" {
    command = "sudo sh -c '/home/aneeka/bin/minikube create cluster --name my-gitops-cluster'"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "sudo sh -c '/home/aneeka/bin/minikube delete cluster --name my-gitops-cluster'"
  }
}
