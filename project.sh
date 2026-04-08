#!/bin/bash

# List of project labels
projects=(
"XS2A: BD2-1"
"XS2A: SD2-1"
"XS2A: QA0 (sd2-2)"
"XS2A: QA1"
"XS2A: QA2"
"XS2A: QA3"
"XS2A: QA4"
"XS2A: PROD"
"BVN: PRODGP1"
"BVN: PRODGP2"
"BVN: QA1 OBP (Legacy)"
"BVN: QA1 WERO"
"BVN: QA2 OBP (Legacy)"
"BVN: QA2 WERO"
"BVN: QA4 (PREP) OBP (Legacy)"
"BVN: QA4 (PREP) WERO"
)

base_urls=(
"https://xs2a-dev-bd2-1.awltest.de"
"https://xs2a-dev-sd2-1.awltest.de"
"https://xs2a-dev-sd2-2.awltest.de"
"https://xs2a-qa1.awltest.de"
"https://xs2a-qa2.awltest.de"
"https://xs2a-qa3.awltest.de"
"https://xs2a-qa4.awltest.de"
"https://xs2a-prod1.awltest.de"
"https://prod1.obp.worldline-solutions.com"
"https://prod2.obp.worldline-solutions.com"
"https://qa1.obp.iacc.as8677.net"
"https://qa1.wero.iacc.as8677.net"
"https://qa2.obp.iacc.as8677.net"
"https://qa2.wero.iacc.as8677.net"
"https://prep.obp.eacc.as8677.net"
"https://prep.wero.eacc.as8677.net"
)

# Corresponding project IDs
project_ids=(
"deu-fs-ob-tpp-nonprd-dev-bd2-1"
"deu-fs-ob-tpp-nonprd-dev-sd2-1"
"deu-fs-ob-tpp-nonprd-dev-sd2-2"
"deu-fs-ob-tpp-nonprd-iacc-qa1"
"deu-fs-ob-tpp-nonprd-eacc-qa2"
"deu-fs-ob-tpp-nonprd-iacc-qa3"
"deu-fs-ob-tpp-nonprd-eacc-qa4"
"deu-fs-ob-tpp-prd-prod-prod1"
"deu-obp-prod"
"deu-obp-prod"
"deu-obp-iacc"
"deu-obp-iacc"
"deu-obp-eacc"
"deu-obp-eacc"
"deu-obp-eacc"
"deu-obp-eacc"
)

# Corresponding cluster names
cluster_names=(
"xs2a-bd2-1-gke"
"xs2a-sd2-1-gke"
"xs2a-sd2-2-gke"
"xs2a-qa1-gke"
"xs2a-qa2-gke"
"xs2a-qa3-gke"
"xs2a-qa4-gke"
"xs2a-prod1-gke"
"obp-prod1-gke"
"obp-prod2-gke"
"obp-qa1-gke"
"obp-qa1-gke"
"obp-qa2-gke"
"obp-qa2-gke"
"obp-qa4-gke"
"obp-qa4-gke"
)

# Corresponding full gcsfuse names
full_gcsfuse_hostnames=(
"xs2a-dev-bd2-1-gcsfuse.xs2a-dev-bd2-1-vm.gcp.meshcore.net"
"xs2a-dev-sd2-1-gcsfuse.xs2a-dev-sd2-1-vm.gcp.meshcore.net"
"xs2a-dev-sd2-2-gcsfuse.xs2a-dev-sd2-2-vm.gcp.meshcore.net"
"xs2a-qa-qa1-gcsfuse.xs2a-qa-qa1-vm.gcp.meshcore.net"
"xs2a-qa-qa2-gcsfuse.xs2a-qa-qa2-vm.gcp.meshcore.net"
"xs2a-qa-qa3-gcsfuse.xs2a-qa-qa3-vm.gcp.meshcore.net"
"xs2a-qa-qa4-gcsfuse.xs2a-qa-qa4-vm.gcp.meshcore.net"
"xs2a-prod-prod1-gcsfuse.xs2a-prod-prod1-vm.gcp.meshcore.net"
"obp-prod-prod1-gcsfuse.obp-prod-prod1-vm.gcp.meshcore.net"
"obp-prod-prod2-gcsfuse.obp-prod-prod2-vm.gcp.meshcore.net"
"obp-qa-qa1-gcsfuse.obp-qa-qa1-vm.gcp.meshcore.net"
"obp-qa-qa1-gcsfuse.obp-qa-qa1-vm.gcp.meshcore.net"
"obp-qa-qa2-gcsfuse.obp-qa-qa2-vm.gcp.meshcore.net"
"obp-qa-qa2-gcsfuse.obp-qa-qa2-vm.gcp.meshcore.net"
"obp-qa-qa4-gcsfuse.obp-qa-qa4-vm.gcp.meshcore.net"
"obp-qa-qa4-gcsfuse.obp-qa-qa4-vm.gcp.meshcore.net"
)

# Corresponding short gcsfuse names
short_gcsfuse_hostnames=(
"xs2a-dev-bd2-1-gcsfuse"
"xs2a-dev-sd2-1-gcsfuse"
"xs2a-dev-sd2-2-gcsfuse"
"xs2a-qa-qa1-gcsfuse"
"xs2a-qa-qa2-gcsfuse"
"xs2a-qa-qa3-gcsfuse"
"xs2a-qa-qa4-gcsfuse"
"xs2a-prod-prod1-gcsfuse"
"obp-prod-prod1-gcsfuse"
"obp-prod-prod2-gcsfuse"
"obp-qa-qa1-gcsfuse"
"obp-qa-qa1-gcsfuse"
"obp-qa-qa2-gcsfuse"
"obp-qa-qa2-gcsfuse"
"obp-qa-qa4-gcsfuse"
"obp-qa-qa4-gcsfuse"
)

# Corresponding gcsfuse zones
gcsfuse_zones=(
"europe-west1-c"
"europe-west1-c"
"europe-west1-c"
"europe-west1-c"
"europe-west1-c"
"europe-west1-c"
"europe-west1-c"
"europe-west1-c"
"europe-west1-b"
"europe-west4-b"
"europe-west1-b"
"europe-west1-b"
"europe-west1-c"
"europe-west1-c"
"europe-west1-b"
"europe-west1-b"
)

echo "Select a project:"

# Print menu
for i in "${!projects[@]}"; do
  printf "%2d) %s\n" $((i+1)) "${projects[$i]}"
done

# Read input
read -p "Enter choice [1-${#projects[@]}]: " choice

# Validate
if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt "${#projects[@]}" ]; then
  echo "Invalid selection."
  exit 1
fi

# Map selection
index=$((choice-1))
project="${projects[$index]}"
project_id="${project_ids[$index]}"
cluster_name="${cluster_names[$index]}"
full_gcsfuse_hostname="${full_gcsfuse_hostnames[$index]}"
short_gcsfuse_hostname="${short_gcsfuse_hostnames[$index]}"
gcsfuse_zone="${gcsfuse_zones[$index]}"

base_url="${base_urls[$index]}"

rs_available="$base_url/xs2a/routingservice/available"
msp_available="$base_url/msp/available"
is_available="$base_url/is/available"
wero_available="$base_url/wero/service/available"

echo "Selected project: $project"

echo ""
echo "Base URL: $base_url"
echo ""

echo "XS2A RS Available: $rs_available"
curl_rs_available=$(curl -s "$rs_available")
echo $curl_rs_available
echo ""

echo "XS2A MSP (BO) Available: $msp_available"
curl_msp_available=$(curl -s "$msp_available")
echo $curl_msp_available
echo ""

echo "IS Available: $is_available"
curl_is_available=$(curl -s "$is_available")
echo $curl_is_available
echo ""

echo "WERO Available: $wero_available"
curl_wero_available=$(curl -s "$wero_available")
echo $curl_wero_available
echo ""

# Commands
echo "gcloud auth login  --no-launch-browser"
echo "gcloud auth application-default login --no-launch-browser"
echo "gcloud config set project $project_id"
echo "gcloud container clusters get-credentials $cluster_name --region=europe-west1"
echo "ssh a783283@$full_gcsfuse_hostname -o StrictHostKeyChecking=no"
echo "gcloud compute start-iap-tunnel --project=$project_id $short_gcsfuse_hostname 9080 --local-host-port=localhost:9080 --zone=$gcsfuse_zone"
echo "gcloud compute start-iap-tunnel --project=$project_id $short_gcsfuse_hostname 22 --local-host-port=localhost:2222 --zone=$gcsfuse_zone"

