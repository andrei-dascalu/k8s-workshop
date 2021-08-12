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


### Tools ###

* Various GCP features need to be activated per project on first use (list: `gcloud services list --available`)
* Of interest: cloudbuild.googleapis.com, containerregistry.googleapis.com, gkeconnect.googleapis.com, gkehub.googleapis.com
* The correct procedure to setup cluster access is to create a SA with limited access then grant it access to the registry from which the cluster can read images
* 1) `gcloud iam service-accounts list`, 2) `gsutil ls`, 3) eg: `gsutil iam ch serviceAccount:sa-k8s-workshop@workshops-yopeso.iam.gserviceaccount.com:roles/storage.admin gs://eu.artifacts.workshops-yopeso.appspot.com/`
