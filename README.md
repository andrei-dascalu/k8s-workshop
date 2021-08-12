## Yopese K8s Workshop ##

### Requirements ###

* `kubectl` (`brew install kubernetes-cli`)
* `gcloud` (Google Cloud SDK: `brew install --cask google-cloud-sdk`)
* `Lens`(`brew install --cask lens`)
* `VSCode` (`brew install --cask visual-studio-code` or an IDE that has some Go syntax highlights)


### Setup ###

* Register `gcloud`: `gcloud auth application-default login`
* Init your configuration: `gcloud init` and login again with your Yopeso Google account. When prompted, select the project and choose to setup a default zone then select "15" (europe-west4-b)
* Load cluster config: `gcloud container clusters get-credentials workshop-k8s`
