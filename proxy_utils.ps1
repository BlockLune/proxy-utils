function __proxy_utils_load_variables {
    $fileMap = @{
        _HTTP_PROXY  = 'http_proxy'
        _HTTPS_PROXY = 'https_proxy'
        _FTP_PROXY   = 'ftp_proxy'
        _RSYNC_PROXY = 'rsync_proxy'
        _ALL_PROXY   = 'all_proxy'
        _NO_PROXY    = 'no_proxy'
    }

    foreach ($var in $fileMap.Keys) {
        $fileName = $fileMap[$var]
        $filePath = Join-Path -Path $HOME -ChildPath ".proxy/$fileName"
        try {
            $content = Get-Content -Path $filePath -Raw -ErrorAction Stop
        } catch {
            $content = ''
        }
        Set-Variable -Scope Script -Name $var -Value $content
    }
}

__proxy_utils_load_variables

function lsproxy {
    $proxyVars = @(
        'http_proxy', 'HTTP_PROXY',
        'https_proxy', 'HTTPS_PROXY',
        'ftp_proxy', 'FTP_PROXY',
        'rsync_proxy', 'RSYNC_PROXY',
        'all_proxy', 'ALL_PROXY',
        'no_proxy', 'NO_PROXY'
    )

    foreach ($var in $proxyVars) {
        $value = [Environment]::GetEnvironmentVariable($var, 'Process')
        if (-not [string]::IsNullOrEmpty($value)) {
            Write-Output "${var}=`"$value`""
        }
    }
}

function proxy {
    __proxy_utils_load_variables

    $env:http_proxy = $script:_HTTP_PROXY
    $env:HTTP_PROXY = $script:_HTTP_PROXY
    $env:https_proxy = $script:_HTTPS_PROXY
    $env:HTTPS_PROXY = $script:_HTTPS_PROXY
    $env:ftp_proxy = $script:_FTP_PROXY
    $env:FTP_PROXY = $script:_FTP_PROXY
    $env:rsync_proxy = $script:_RSYNC_PROXY
    $env:RSYNC_PROXY = $script:_RSYNC_PROXY
    $env:all_proxy = $script:_ALL_PROXY
    $env:ALL_PROXY = $script:_ALL_PROXY
    $env:no_proxy = $script:_NO_PROXY
    $env:NO_PROXY = $script:_NO_PROXY

    lsproxy
}

function noproxy {
    $proxyVars = @(
        'http_proxy', 'HTTP_PROXY',
        'https_proxy', 'HTTPS_PROXY',
        'ftp_proxy', 'FTP_PROXY',
        'rsync_proxy', 'RSYNC_PROXY',
        'all_proxy', 'ALL_PROXY',
        'no_proxy', 'NO_PROXY'
    )

    foreach ($var in $proxyVars) {
        Remove-Item -Path "Env:\$var" -ErrorAction SilentlyContinue
    }
}

function myip {
    try {
        $ipv4 = (Invoke-WebRequest -Uri 'https://api-ipv4.ip.sb/ip' -UserAgent 'blocklune-proxy-utils' -SkipCertificateCheck -ErrorAction Stop).Content.Trim()
        if ($ipv4) {
            Write-Output "IPv4: $ipv4"
        }
    } catch {
        Write-Warning "Failed to get IPv4 address: $_"
    }

    try {
        $ipv6 = (Invoke-WebRequest -Uri 'https://api-ipv6.ip.sb/ip' -UserAgent 'blocklune-proxy-utils' -SkipCertificateCheck -ErrorAction Stop).Content.Trim()
        if ($ipv6) {
            Write-Output "IPv6: $ipv6"
        }
    } catch {
        Write-Warning "Failed to get IPv6 address: $_"
    }

    try {
        $geoip = (Invoke-WebRequest -Uri 'https://api.ip.sb/geoip' -UserAgent 'blocklune-proxy-utils' -SkipCertificateCheck -ErrorAction Stop).Content.Trim()
        if ($geoip) {
            Write-Output "GeoIP: $geoip"
        }
    } catch {
        Write-Warning "Failed to get GeoIP information: $_"
    }
}