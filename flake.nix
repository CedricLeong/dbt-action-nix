{
  description = "A minimal dbt system";
  inputs = {
    nixpkgs.url = "nixpkgs/release-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages = {
        default = pkgs.dbt.withAdapters (adapters: [adapters.dbt-snowflake adapters.dbt-postgres adapters.dbt-redshift adapters.dbt-bigquery]);
      };
    });
}
