# Proxy Utils

Scripts for fast setting of the system proxy environment variables.

Inspired by:

- [SukkaW/zsh-proxy](https://github.com/SukkaW/zsh-proxy)
- [escalate/oh-my-zsh-proxy-plugin](https://github.com/escalate/oh-my-zsh-proxy-plugin/)

## Installation

### As a Zim Module

1. Add the module to your Zim configuration file:

   ```text
   zmodule BlockLune/proxy-utils
   ```

2. Edit the configuration files in `~/.proxy/` to set your proxy settings. An example configuration is provided in `example/.proxy/`.
3. Restart your terminal.

### As an Oh-My-Zsh Plugin

1. Clone the repository into the Oh-My-Zsh custom plugins directory:

   ```shell
   git clone --depth=1 https://github.com/BlockLune/proxy-utils.git ~/.oh-my-zsh/custom/plugins/proxy-utils
   ```

2. Edit the configuration files in `~/.proxy/` to set your proxy settings. Or copy the example configuration as a starting point:

   ```shell
   cp -r ~/.oh-my-zsh/custom/plugins/proxy-utils/example/.proxy/ ~/.proxy/
   ```

3. Update the zsh configuration file:

   ```zsh
   plugin=(... proxy-utils)
   ```

4. Restart your terminal.

### As a Standalone Script

1. Clone the repository:

   ```shell
   git clone https://github.com/BlockLune/proxy-utils.git --depth=1
   ```

2. Edit the configuration files in `~/.proxy/` to set your proxy settings. Or copy the example configuration as a starting point:

   ```shell
   cp -r proxy-utils/example/.proxy/ ~/.proxy/
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
