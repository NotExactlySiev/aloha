{
  description = "Project Aloha Development Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs {
            localSystem = {
              system = system;
            };
          };
          crossPkgs = import nixpkgs {
            localSystem = {
              system = system;
            };
            crossSystem = {
              system = "mipsel-none-elf";
            };
          };
        in
        {
          default = pkgs.mkShell {
            packages = [
              crossPkgs.buildPackages.gcc-unwrapped
              crossPkgs.buildPackages.binutils-unwrapped
            ];

            # buildInputs = with pkgs; [
            #   expat
            #   fontconfig
            #   freetype
            # ];

            nativeBuildInputs = with pkgs; [
              pkg-config

              # The user is probably gonna have python installed anyway. Let's
              # not download it for no reason.
              # python3
            ];
          };
        }
      );
    };
}
