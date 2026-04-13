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

# Corresponding cluster regions
regions=(
"europe-west1"
"europe-west1"
"europe-west1"
"europe-west1"
"europe-west1"
"europe-west1"
"europe-west1"
"europe-west1"
"europe-west1"
"europe-west4"
"europe-west1"
"europe-west1"
"europe-west1"
"europe-west1"
"europe-west1"
"europe-west1"
)

# Corresponding cluster namespaces
namespaces=(
"xs2a-dev-bd2-1"
"xs2a-dev-sd2-1"
"xs2a-dev-sd2-2"
"xs2a-qa-qa1"
"xs2a-qa-qa2"
"xs2a-qa-qa3"
"xs2a-qa-qa4"
"obp-prod-prod1"
"obp-prod-prod1"
"obp-prod-prod2"
"obp-qa-qa1"
"obp-qa-qa1"
"obp-qa-qa2"
"obp-qa-qa2"
"obp-qa-qa4"
"obp-qa-qa4"
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

# Terraform directories per project
terraform_dirs=(
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
"./terraform_dir"
)

# Helm directories per project
helm_dirs=(
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
"./helm_dir"
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

########################################################################################

init_file() {
  local file="$1"
  local base_dir
  local full_path

  # Directory where project.sh is located
  base_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

  full_path="$base_dir/$file"

  # Ensure parent directory exists
  mkdir -p "$(dirname "$full_path")"

  # Delete existing file if it exists
  [ -f "$full_path" ] && rm -f "$full_path"

  # Create + initialize file
  echo "#!/bin/bash" > "$full_path"
  echo "" >> "$full_path"

  # Make executable
  chmod +x "$full_path"
}

write_with_cmd() {
  local cmd="$1"
  local file="$2"
  local base_dir
  local full_path

  # Directory where project.sh is located
  base_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

  full_path="$base_dir/$file"

  echo "$cmd"              # Print to console
  echo "$cmd" >> "$full_path"   # Write to correct file
}

write_without_cmd() {
  local cmd="$1"
  local file="$2"
  local base_dir
  local full_path

  # Directory where project.sh is located
  base_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

  full_path="$base_dir/$file"

  echo "$cmd" >> "$full_path"   # Write to correct file
}

########################################################################################

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
region="${regions[$index]}"
namespace="${namespaces[$index]}"
gcsfuse_zone="${gcsfuse_zones[$index]}"
terraform_dir="${terraform_dirs[$index]}"
helm_dir="${helm_dirs[$index]}"
base_url="${base_urls[$index]}"
rs_available="$base_url/xs2a/routingservice/available"
msp_available="$base_url/msp/available"
is_available="$base_url/is/available"
wero_available="$base_url/wero/service/available"

echo "Selected project: $project"

########################################################################################

auth_script="auth.sh"
init_file "$auth_script"
write_without_cmd "gcloud auth login  --no-launch-browser" "$auth_script"
write_without_cmd "gcloud auth application-default login --no-launch-browser" "$auth_script"
write_without_cmd "gcloud config set project $project_id" "$auth_script"
write_without_cmd "gcloud container clusters get-credentials $cluster_name --region=europe-west1" "$auth_script"

########################################################################################

ssh_gcsfuse_script="ssh_gcsfuse.sh"
init_file "$ssh_gcsfuse_script"
write_without_cmd "gcloud compute start-iap-tunnel --project=$project_id $short_gcsfuse_hostname 22 --local-host-port=localhost:2222 --zone=$gcsfuse_zone" "$ssh_gcsfuse_script"

########################################################################################

ssh_striim_script="ssh_striim.sh"
init_file "$ssh_striim_script"
write_without_cmd "gcloud compute start-iap-tunnel --project=$project_id $short_gcsfuse_hostname 9080 --local-host-port=localhost:9080 --zone=$gcsfuse_zone" "$ssh_striim_script"

########################################################################################

echo "SSH to gcsfuse machine: ssh a783283@$full_gcsfuse_hostname -o StrictHostKeyChecking=no"

########################################################################################

available_script="available.sh"
init_file "$available_script"
# ---- Variables ----
write_without_cmd "base_url=\"$base_url\"" "$available_script"
write_without_cmd "rs_available=\"$rs_available\"" "$available_script"
write_without_cmd "msp_available=\"$msp_available\"" "$available_script"
write_without_cmd "is_available=\"$is_available\"" "$available_script"
write_without_cmd "wero_available=\"$wero_available\"" "$available_script"
write_without_cmd "" "$available_script"

# ---- Helper ----
write_without_cmd 'run_cmd() {' "$available_script"
write_without_cmd '  echo ""' "$available_script"
write_without_cmd '  echo "➡️  $1"' "$available_script"
write_without_cmd '  echo "--------------------------------"' "$available_script"
write_without_cmd '  eval "$1"' "$available_script"
write_without_cmd '}' "$available_script"
write_without_cmd "" "$available_script"

# ---- Functions ----
write_without_cmd 'get_base_url() { run_cmd "echo $base_url"; }' "$available_script"
write_without_cmd 'get_xs2a_rs_available() { run_cmd "curl -s $rs_available"; }' "$available_script"
write_without_cmd 'get_xs2a_msp_available() { run_cmd "curl -s $msp_available"; }' "$available_script"
write_without_cmd 'get_is_available() { run_cmd "curl -s $is_available"; }' "$available_script"
write_without_cmd 'get_wero_available() { run_cmd "curl -s $wero_available"; }' "$available_script"

# ---- Menu ----
write_without_cmd 'while true; do' "$available_script"
write_without_cmd 'echo ""' "$available_script"
write_without_cmd 'echo "============================="' "$available_script"
write_without_cmd 'echo "   AVAILABLE SERVICES MENU"' "$available_script"
write_without_cmd 'echo "============================="' "$available_script"
write_without_cmd 'echo "Base URL: $base_url"' "$available_script"
write_without_cmd 'echo "XS2A RS Available: $rs_available"' "$available_script"
write_without_cmd 'echo "XS2A MSP (BO) Available: $msp_available"' "$available_script"
write_without_cmd 'echo "IS Available: $is_available"' "$available_script"
write_without_cmd 'echo "WERO Available: $wero_available"' "$available_script"
write_without_cmd 'echo "-----------------------------"' "$available_script"

write_without_cmd 'echo "1) Get Base URL"' "$available_script"
write_without_cmd 'echo "2) Get XS2A RS Available"' "$available_script"
write_without_cmd 'echo "3) Get XS2A MSP Available"' "$available_script"
write_without_cmd 'echo "4) Get IS Available"' "$available_script"
write_without_cmd 'echo "5) Get WERO Available"' "$available_script"
write_without_cmd 'echo "0) Exit"' "$available_script"

write_without_cmd 'read -p "Choice: " choice' "$available_script"

write_without_cmd 'case $choice in' "$available_script"
write_without_cmd '1) get_base_url ;;' "$available_script"
write_without_cmd '2) get_xs2a_rs_available ;;' "$available_script"
write_without_cmd '3) get_xs2a_msp_available ;;' "$available_script"
write_without_cmd '4) get_is_available ;;' "$available_script"
write_without_cmd '5) get_wero_available ;;' "$available_script"
write_without_cmd '0) exit 0 ;;' "$available_script"
write_without_cmd '*) echo "Invalid option" ;;' "$available_script"
write_without_cmd 'esac' "$available_script"

write_without_cmd 'done' "$available_script"

########################################################################################

k8s_script="k8s.sh"
init_file "$k8s_script"
# ---- Variables ----
write_without_cmd "PROJECT_ID=\"$project_id\"" "$k8s_script"
write_without_cmd "CLUSTER=\"$cluster_name\"" "$k8s_script"
write_without_cmd "REGION=\"$region\"" "$k8s_script"
write_without_cmd "NAMESPACE=\"$namespace\"" "$k8s_script"
write_without_cmd "" "$k8s_script"

# ---- Helper ----
write_without_cmd 'run_cmd() {' "$k8s_script"
write_without_cmd '  echo ""' "$k8s_script"
write_without_cmd '  echo "➡️  $1"' "$k8s_script"
write_without_cmd '  echo "--------------------------------"' "$k8s_script"
write_without_cmd '  eval "$1"' "$k8s_script"
write_without_cmd '}' "$k8s_script"
write_without_cmd "" "$k8s_script"

# ---- Functions ----
write_without_cmd 'connect_cluster() { run_cmd "gcloud container clusters get-credentials $CLUSTER --region $REGION --project $PROJECT_ID"; }' "$k8s_script"
write_without_cmd 'show_nodes() { run_cmd "kubectl get nodes -o wide"; }' "$k8s_script"
write_without_cmd 'show_namespaces() { run_cmd "kubectl get ns"; }' "$k8s_script"
write_without_cmd 'switch_namespace() { run_cmd "kubectl config set-context --current --namespace=$NAMESPACE"; }' "$k8s_script"
write_without_cmd 'show_all_pods() { run_cmd "kubectl get pods -A -o wide"; }' "$k8s_script"
write_without_cmd 'show_ns_pods() { run_cmd "kubectl get pods -n $NAMESPACE"; }' "$k8s_script"

write_without_cmd 'describe_pod() { read -p "Pod: " pod; run_cmd "kubectl describe pod $pod -n $NAMESPACE"; }' "$k8s_script"
write_without_cmd 'logs_pod() { read -p "Pod: " pod; run_cmd "kubectl logs -f $pod -n $NAMESPACE"; }' "$k8s_script"
write_without_cmd 'exec_pod() { read -p "Pod: " pod; run_cmd "kubectl exec -it $pod -n $NAMESPACE -- /bin/bash"; }' "$k8s_script"
write_without_cmd 'restart_deployment() { read -p "Deployment: " dep; run_cmd "kubectl rollout restart deployment $dep -n $NAMESPACE"; }' "$k8s_script"
write_without_cmd 'show_services() { run_cmd "kubectl get svc -n $NAMESPACE"; }' "$k8s_script"

write_without_cmd 'port_forward() {' "$k8s_script"
write_without_cmd '  read -p "Service: " svc' "$k8s_script"
write_without_cmd '  read -p "Local port: " lp' "$k8s_script"
write_without_cmd '  read -p "Service port: " sp' "$k8s_script"
write_without_cmd '  run_cmd "kubectl port-forward svc/$svc $lp:$sp -n $NAMESPACE"' "$k8s_script"
write_without_cmd '}' "$k8s_script"

# ---- Menu ----
write_without_cmd 'while true; do' "$k8s_script"
write_without_cmd 'echo ""' "$k8s_script"
write_without_cmd 'echo "============================="' "$k8s_script"
write_without_cmd 'echo "   KUBERNETES MENU"' "$k8s_script"
write_without_cmd 'echo "============================="' "$k8s_script"
write_without_cmd 'echo "Project: $PROJECT_ID"' "$k8s_script"
write_without_cmd 'echo "Cluster: $CLUSTER"' "$k8s_script"
write_without_cmd 'echo "Namespace: $NAMESPACE"' "$k8s_script"
write_without_cmd 'echo "-----------------------------"' "$k8s_script"

write_without_cmd 'echo "1) Connect to cluster $CLUSTER"' "$k8s_script"
write_without_cmd 'echo "2) Show nodes"' "$k8s_script"
write_without_cmd 'echo "3) Show namespaces"' "$k8s_script"
write_without_cmd 'echo "4) Switch to namespace to $NAMESPACE"' "$k8s_script"
write_without_cmd 'echo "5) Show all pods"' "$k8s_script"
write_without_cmd 'echo "6) Show namespace pods"' "$k8s_script"
write_without_cmd 'echo "7) Describe pod"' "$k8s_script"
write_without_cmd 'echo "8) Logs"' "$k8s_script"
write_without_cmd 'echo "9) Exec into pod"' "$k8s_script"
write_without_cmd 'echo "10) Restart deployment"' "$k8s_script"
write_without_cmd 'echo "11) Show services"' "$k8s_script"
write_without_cmd 'echo "12) Port forward"' "$k8s_script"
write_without_cmd 'echo "0) Exit"' "$k8s_script"

write_without_cmd 'read -p "Choice: " choice' "$k8s_script"

write_without_cmd 'case $choice in' "$k8s_script"
write_without_cmd '1) connect_cluster ;;' "$k8s_script"
write_without_cmd '2) show_nodes ;;' "$k8s_script"
write_without_cmd '3) show_namespaces ;;' "$k8s_script"
write_without_cmd '4) switch_namespace ;;' "$k8s_script"
write_without_cmd '5) show_all_pods ;;' "$k8s_script"
write_without_cmd '6) show_ns_pods ;;' "$k8s_script"
write_without_cmd '7) describe_pod ;;' "$k8s_script"
write_without_cmd '8) logs_pod ;;' "$k8s_script"
write_without_cmd '9) exec_pod ;;' "$k8s_script"
write_without_cmd '10) restart_deployment ;;' "$k8s_script"
write_without_cmd '11) show_services ;;' "$k8s_script"
write_without_cmd '12) port_forward ;;' "$k8s_script"
write_without_cmd '0) exit 0 ;;' "$k8s_script"
write_without_cmd '*) echo "Invalid option" ;;' "$k8s_script"
write_without_cmd 'esac' "$k8s_script"

write_without_cmd 'done' "$k8s_script"
