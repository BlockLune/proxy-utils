# Proxy Utils

Scripts for fast setting of the system proxy environment variables.

Inspired by:

- [SukkaW/zsh-proxy](https://github.com/SukkaW/zsh-proxy)
- [escalate/oh-my-zsh-proxy-plugin](https://github.com/escalate/oh-my-zsh-proxy-plugin/)

## Installation

### As an Oh-My-Zsh Plugin

1. Clone the repository into the Oh-My-Zsh custom plugins directory:

   ```shell
   git clone https://github.com/BlockLune/proxy-utils.git ~/.oh-my-zsh/custom/plugins/proxy-utils --depth=1
   ```

2. Copy the configuration file:

   ```shell
   cp -r ~/.oh-my-zsh/custom/plugins/proxy-utils/example/.proxy/ ~/.proxy/
   ```

3. Update the zsh configuration file:

   ```zsh
   plugin=(... proxy-utils)
   ```

4. Restart the terminal.

### As a Standalone Script

1. Clone the repository:

   ```shell
   git clone https://github.com/BlockLune/proxy-utils.git --depth=1
   ```

2. Copy the configuration file:

   ```shell
   cp -r proxy-utils/example/.proxy/ ~
   ```

3. Update your shell configuration file:

   ```shell
   source /path/to/proxy-utils/proxy_utils.sh
   ```

4. Restart the terminal.
  
## Usage

```shell
# Set proxy environment variables
proxy

# Unset proxy environment variables
noproxy

# List proxy environment variables
lsproxy

# Check the current ip address by sending request to ip.sb
myip
```
