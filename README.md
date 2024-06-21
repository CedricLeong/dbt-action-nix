# dbt-action-flakes
This GitHub custom action provides a streamlined way to install Data Build Tool (DBT) using the Nix package manager. It is designed for use in CI/CD pipelines to ensure that DBT is correctly and consistently installed across different environments. By leveraging Nix, this action guarantees reproducibility and dependency management, making your workflows more reliable and easier to maintain.

Features

- Reproducible Builds: Ensures that DBT is installed in a consistent environment, eliminating issues caused by dependency variations.
- Ease of Use: Simple configuration with minimal setup required.
- Fast: This action creates an environment quicker than traditional container methods
- Configuration Agonstic: The configuration works with any secret manager you use for your actions and works for any intended use of DBT


## Usage
To use this action in your GitHub workflow, add the following step to your .github/workflows/your_workflow.yml file:
```

name: Install DBT with Nix

on: [push, pull_request]

jobs:
install-dbt:
runs-on: ubuntu-latest

steps:
- name: Checkout repository
uses: actions/checkout@v4

- name: Install DBT using Nix
uses: CedricLeong/install-dbt-action-nix@v1

- name: Verify DBT installation
run: dbt --version

- name: Run DBT command
run: dbt run
```
## Options
If no options are specified. The action will automatically install all adapters. These options are mutually exclusive, so you cannot install two adapters.

Specify options with the `with:` keyword in your workflow file.

- `dbt-snowflake` : Installs only the snowflake adapter 
- `dbt-postgres`: Installs only the postgreSQL adapter 
- `dbt-bigquery`: Installs only the bigquery adapter 
- `dbt-redshift`: Installs only the redshift adapter 

## License
This GitHub Action is licensed under the MIT License. See the LICENSE file for more details.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request if you have any improvements or fixes.

## Acknowledgments
Special thanks to the Nix community and the DBT developers for their excellent tools and documentation.



