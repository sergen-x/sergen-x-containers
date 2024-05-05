# sergen-x-containers
Custom game server containers used by [Sergen X](https://github.com/sergen-x/sergen-x-api).

This repository currently houses a 
[RHEL9 UBI-Minimal](https://www.redhat.com/en/blog/introducing-red-hat-universal-base-image) 
base image that installs [Sergen-X-Agent](https://github.com/sergen-x/sergen-x-agent).

### Installation

1/ Clone this repository - `git clone https://github.com/sergen-x/sergen-x-containers`

2/ Build the container - `docker build -t sergen_x_agent_ubi9m -f ubi9 .`