.PHONY: cluster cluster-create cluster-delete cluster-get

CLUSTER := $(shell linode-cli lke clusters-list --json | jq '.[] | select(.label == "argocd-labs") | .id' -r)

cluster:
	@echo "Usage: make cluster-[create|delete|kube]"

cluster-kube:
	@echo "Cluset id: $(CLUSTER)"
	linode-cli lke kubeconfig-view $(CLUSTER) --text | grep -v kubeconfig | base64 -d > kube

ifeq ($(CLUSTER),)
cluster-create:
	linode-cli lke cluster-create --label argocd-labs --region br-gru --k8s_version 1.32 --node_pools.type g6-standard-1 --node_pools.count 2

cluster-delete:
	@echo "Cluster not found"
else
cluster-create:
	@echo "Cluster already exists with id: $(CLUSTER)"

cluster-delete:
	linode-cli lke cluster-delete $(CLUSTER)
endif

