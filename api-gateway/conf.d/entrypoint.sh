#!/bin/sh

set -o errexit
set -o nounset

readonly RSYSLOG_PID="/var/run/rsyslogd.pid"
HAPROXY_CONFIG=${HAPROXY_CONFIG:-"/etc/haproxy/haproxy.cfg"}
HAPROXY_PID_FILE="/var/run/haproxy.pid"
HAPROXY_CMD="haproxy -f ${HAPROXY_CONFIG} -p ${HAPROXY_PID_FILE}"

start_rsyslogd() {
  rm -f $RSYSLOG_PID
  rsyslogd
}

safe_run() {
  start_rsyslogd
  if [[ ! -f "${HAPROXY_CONFIG}" ]]; then
    echo "No config.." >&2
    exit 1
  fi
  if [[ -f "${HAPROXY_PID_FILE}" ]]; then
    ${HAPROXY_CMD} -sf $(cat ${HAPROXY_PID_FILE})
  else
    ${HAPROXY_CMD}
  fi
}

main() {
  safe_run
  while inotifywait -r -e create,delete,modify,attrib,close_write,move "${HAPROXY_CONFIG}"; do
    safe_run
  done
}

main "$@"
