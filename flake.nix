{
  description = "FHS environment for python with uv";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      forAllSystems =
        function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "aarch64-linux"
        ] (system: function nixpkgs.legacyPackages.${system});
    in
    {
      # Set up a FHS development shell using standard packages based on appimageTools package.
      devShells = forAllSystems (pkgs: {
        default =
          (pkgs.buildFHSEnv (
            pkgs.appimageTools.defaultFhsEnvArgs
            // {
              name = "python-dev-env";

              # Packages available in the dev-shell
              targetPkgs =
                pkgs: with pkgs; [
                  python3
                  python3Packages.uv
                ];

              profile = ''
                echo -e "\e[1;34mentering dev-shell...\e[0m"
              '';
            }
          )).env;
      });
    };
}
