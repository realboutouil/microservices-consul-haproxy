#!/bin/sh

HAPROXY_CONFIG=${HAPROXY_CONFIG:-"/etc/haproxy/haproxy.cfg"}
HAPROXY_PID_FILE="/var/run/haproxy.pid"
HAPROXY_CMD="haproxy -f ${HAPROXY_CONFIG} -p ${HAPROXY_PID_FILE}"

function safe_run() {
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

safe_run
while inotifywait -r -e create,delete,modify,attrib,close_write,move "${HAPROXY_CONFIG}"; do
  safe_run
done
