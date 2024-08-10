# Snowflake development tools

# Notes

- SnowSQL: A fixed port number was assigned for external browser-based SSO.

  By default a random port is used and the SSO flow gets redirected to
  localhost:<port-number>. In containers this port needs to be forwarded.
  The easiest way to solve this was to fix the port number to a random
  5-digit port number.

