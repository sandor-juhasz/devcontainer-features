# Snowflake development tools

## Tools and Features
- [Dbt Core]()
  - Customizable list of dbt plugins
  - Installation methods: user's default Python, pyenv virtualenv, pipx.
  - Implicitly installs Python environment if not present.
- [Dbt Cloud CLI]()
  - Customizable version number
  - Optional command alias
- Power User for dbt - Visual Studio Code Extension

## Usage

```json
{
	"name": "Dbt",
	"image": "mcr.microsoft.com/devcontainers/base:jammy",
	"features": {
		"ghcr.io/sandor-juhasz/devcontainer-features/dbt:latest": {
 		}
	}
}
```

## Compatibility
The feature has been tested with the following base images:
 - `mcr.microsoft.com/devcontainers/base:jammy`

## Release notes

### 1.0.9
- Option to specify dbt core installation method (pipx, user-python, pyenv-virtualenv)
- Default installation method is user-python for VSCode plugin compatibility.

## Notes, known issues

- Power User for DBT

  The plugin does not integrate well with other VSCode features unless dbt 
  core is installed into the user's Python environment. While pipx would be
  preferred, the default is user-python.
