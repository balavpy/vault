vault {
  address      = "http://18.236.82.255:8200/"

  # I'm using the environment variable VAULT_TOKEN instead.
  token        = "s.urqniCdSkUMKAIDBDK71l3FL"
  #grace        = "10s"
  unwrap_token = false
  renew_token  = true
}

syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/grafana/grafana_cert.tpl"
  destination = "/etc/grafana/grafana_cert.pem"
  perms       = 0644
  command     = "sudo systemctl restart grafana-server"
}

template {
  source      = "/etc/grafana/grafana_key.tpl"
  destination = "/etc/grafana/grafana_key.pem"
  perms       = 0644
  command     = "sudo systemctl restart grafana-server"
}
