# Snowflake development tools

## Tools and Features
- [SnowSQL](https://docs.snowflake.com/en/user-guide/snowsql)
  - Customizable version number. `latest` is not supported yet.
- [Snowflake CLI](https://docs.snowflake.com/en/developer-guide/snowflake-cli-v2/index)
  - Latest version gets installed using `pipx` in a virtual environment.
- Python toolchain 
  - Installed using the `ghcr.io/sandor-juhasz/devcontainer-features/python` feature.
  - Installed after the Snowflake feature if it exists in the `devcontainer.json`.
  - System Python is configured by default.
- Official [Snowflake Extension for Visual Studio Code](https://docs.snowflake.com/en/user-guide/vscode-ext)

## Usage

```json
{
	"name": "Snowflake",
	"image": "mcr.microsoft.com/devcontainers/base:jammy",
	"features": {
		"ghcr.io/sandor-juhasz/devcontainer-features/snowflake:latest": {
         "installSnowflakeCLI": true,
			   "installSnowSQL": true,
			   "snowSQLVersion": "1.3.1"	
		}
	},
	"forwardPorts": [53154, 53154]
}
```

## Compatibility
The feature has been tested with the following base images:
 - `mcr.microsoft.com/devcontainers/base:jammy`

## Release notes

## Notes, known issues

- VSCode Extension for Visual Studio Code - Port forwarding issues
 
  When using browser-based external authentication for corporate SSO, the 
  extension opens a random port which is not auto forwarded by VSCode. Because
  of this, the browser session will end on a 404 error page.

  Workaround: copy the URL from the browser and execute it from the DevContainer
  terminal using `curl`.

  Long term solution could be to print the port number of the server onto the
  VSCode debug console or terminal using the plugin to let VSCode recognize and
  auto-forward the port. A less convenient workaround could be to let the 
  Typescript Snowflake library recognize the `SF_AUTH_SOCKET_PORT` that the
  Python API recognizes.
 
- SnowSQL: A fixed port number was assigned for external browser-based SSO.

  By default a random port is used and the SSO flow gets redirected to
  localhost:<port-number>. In containers this port needs to be forwarded.
  The easiest way to solve this was to fix the port number to a random
  5-digit port number.

  Warning: the port needs to be forwarded in the devcontainer.json which
           uses the feature.

