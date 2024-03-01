#!/bin/sh

# Function to display a message with animation
display_message() {
  echo -e "\n$1"
  sleep $2
}

# Function to display progress bar
progress_bar() {
  local duration=$1
  local steps=$2

  i=0
  while [ $i -le $steps ]; do
    percent=$((i * 100 / steps))
    echo -ne "["
    j=0
    while [ $j -lt $((i * 10 / steps)) ]; do
      echo -ne "■"
      j=$((j + 1))
    done
    while [ $j -lt 10 ]; do
      echo -ne "□"
      j=$((j + 1))
    done
    echo -ne "] $percent% \r"
    sleep $((duration / steps))
    i=$((i + 1))
  done
  echo -e "\n"
}

# Function to update the script
update_script() {
  echo "Checking for updates..."
  new_script_url="https://github.com/EstProject01/ExclusiveAutoUp/blob/main/coba3.sh"  # Replace with the actual URL of your updated script
  new_script_content=$(curl -s $new_script_url)
  
  if [ -n "$new_script_content" ]; then
    echo "Updating the script..."
    echo "$new_script_content" > updated_script.sh
    mv updated_script.sh $0
    chmod +x $0
    echo "Update complete. Please run the script again."
    exit 0
  else
    echo "No updates available."
  fi
}

# Main script
if [ "$1" == "update" ]; then
  update_script
  exit 0
fi

display_message "EXCLUSIVE GAMING OPTIMIZER" 2

echo ""
echo "| Version: 5.0 | Developer: @EstProject01 | Credit: @EstProject01 | Build Release: 28/02/2024 | Upload Time: ? |"
echo ""
sleep 3

echo "[ Device Info ]"
sleep 2
echo "Build Release   [🕗] • $(getprop ro.build.date)"
sleep 1
echo "Device Model    [📱] • $(getprop ro.product.model)"
sleep 1
echo "Codename Model  [📲] • $(getprop ro.build.product)"
sleep 1
echo "Device Brand    [🆔] • $(getprop ro.product.brand)"
sleep 1
echo "SDK Build       [💽] • $(getprop ro.build.version.sdk)"
sleep 1
echo "Kernel Type     [📀] • $(uname -r)"
sleep 2

echo -e "\n[ SupportDev ]"
echo "DEVELOPER: @EstProject01"
echo "SOURCE: https://t.me/+oUDz7SD5a14wZDE9"
echo "DISC: JOIN DULU"
sleep 2

echo ""
sleep 5

# Uncomment the line below to enable automatic updates
# update_script

progress_bar 5 10
