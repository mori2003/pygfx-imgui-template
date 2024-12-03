{
  description = "FHS environment for python";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    # Set up a FHS development shell using standard packages based on appimageTools package.
    devShells.${system}.default = (pkgs.buildFHSEnv (pkgs.appimageTools.defaultFhsEnvArgs // {
          name = "python-dev-env";

          # Packages installed in the development shell
          targetPkgs = pkgs: with pkgs; [

            python3
            python3Packages.uv
          ];
          # Commands to be executed in the development shell
          runScript = "echo \n\"entering nix-shell...\"";
        })).env;
  };
}
