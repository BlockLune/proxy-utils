#!/bin/sh
__proxy_utils_load_variables() {
  _HTTP_PROXY=$(cat "${HOME}/.proxy/http_proxy")
  _HTTPS_PROXY=$(cat "${HOME}/.proxy/https_proxy")
  _FTP_PROXY=$(cat "${HOME}/.proxy/ftp_proxy")
  _RSYNC_PROXY=$(cat "${HOME}/.proxy/rsync_proxy")
  _ALL_PROXY=$(cat "${HOME}/.proxy/all_proxy")
  _NO_PROXY=$(cat "${HOME}/.proxy/no_proxy")
}

__proxy_utils_load_variables

lsproxy() {
  if [ -n "${http_proxy}" ]; then
    echo "http_proxy=\"${http_proxy}\""
  fi

  if [ -n "${HTTP_PROXY}" ]; then
    echo "HTTP_PROXY=\"${HTTP_PROXY}\""
  fi

  if [ -n "${https_proxy}" ]; then
    echo "https_proxy=\"${https_proxy}\""
  fi

  if [ -n "${HTTPS_PROXY}" ]; then
    echo "HTTPS_PROXY=\"${HTTPS_PROXY}\""
  fi

  if [ -n "${ftp_proxy}" ]; then
    echo "ftp_proxy=\"${ftp_proxy}\""
  fi

  if [ -n "${FTP_PROXY}" ]; then
    echo "FTP_PROXY=\"${FTP_PROXY}\""
  fi

  if [ -n "${rsync_proxy}" ]; then
    echo "rsync_proxy=\"${rsync_proxy}\""
  fi

  if [ -n "${RSYNC_PROXY}" ]; then
    echo "RSYNC_PROXY=\"${RSYNC_PROXY}\""
  fi

  if [ -n "${all_proxy}" ]; then
    echo "all_proxy=\"${all_proxy}\""
  fi

  if [ -n "${ALL_PROXY}" ]; then
    echo "ALL_PROXY=\"${ALL_PROXY}\""
  fi

  if [ -n "${no_proxy}" ]; then
    echo "no_proxy=\"${no_proxy}\""
  fi

  if [ -n "${NO_PROXY}" ]; then
    echo "NO_PROXY=\"${NO_PROXY}\""
  fi
}

proxy() {
  __proxy_utils_load_variables

  export http_proxy="${_HTTP_PROXY}"
  export HTTP_PROXY="${_HTTP_PROXY}"
  export https_proxy="${_HTTPS_PROXY}"
  export HTTPS_PROXY="${_HTTPS_PROXY}"
  export ftp_proxy="${_FTP_PROXY}"
  export FTP_PROXY="${_FTP_PROXY}"
  export rsync_proxy="${_RSYNC_PROXY}"
  export RSYNC_PROXY="${_RSYNC_PROXY}"
  export all_proxy="${_ALL_PROXY}"
  export ALL_PROXY="${_ALL_PROXY}"
  export no_proxy="${_NO_PROXY}"
  export NO_PROXY="${_NO_PROXY}"

  lsproxy
}

noproxy() {
  unset http_proxy
  unset HTTP_PROXY
  unset https_proxy
  unset HTTPS_PROXY
  unset ftp_proxy
  unset FTP_PROXY
  unset rsync_proxy
  unset RSYNC_PROXY
  unset all_proxy
  unset ALL_PROXY
  unset no_proxy
  unset NO_PROXY
}

myip() {
  ipv4=$(curl -s -k https://api-ipv4.ip.sb/ip -A blocklune-proxy-utils)
  if [ -n "$ipv4" ]; then
    echo "IPv4: $ipv4"
  fi

  ipv6=$(curl -s -k https://api-ipv6.ip.sb/ip -A blocklune-proxy-utils)
  if [ -n "$ipv6" ]; then
    echo "IPv6: $ipv6"
  fi

  geoip=$(curl -s -k https://api.ip.sb/geoip -A blocklune-proxy-utils)
  if [ -n "$geoip" ]; then
    echo "GeoIP: $geoip"
  fi
}