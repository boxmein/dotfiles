#
# Completion scripts
#

if [[ $- == *i* ]]; then
  # Kubernetes
  source <(kubectl completion zsh)

  # ROS
  [[ -f /opt/ros/melodic/setup.zsh ]] && echo "Run 'source /opt/ros/melodic/setup.zsh' to activate ROS environment"
fi

