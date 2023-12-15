if [[ $(cat /etc/environment) =~ HTTP_PROXY=.* ]]; then
  export http_proxy=http://tyo4.sme.zscaler.net:80
  export https_proxy=${http_proxy}
  export ftp_proxy=${http_proxy}
  export HTTP_PROXY=${http_proxy}
  export HTTPS_PROXY=${http_proxy}
  export FTP_PROXY=${http_proxy}
fi