consul {
  address = "consul:8500"
  retry {
    enabled = true
    attempts = 12
    backoff = "250ms"
    max_backoff = "1m"
  }
}

template {
  source = "/etc/haproxy/haproxy.ctmpl"
  # the template
  destination = "/etc/haproxy/haproxy.cfg"
  # the generated file destination
  perms = 0600
  //  command = "/bin/sh /reload.sh" # the haproxy reload script
}