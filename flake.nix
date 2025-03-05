{
  description = "Minimal PSX Development Environment";

  # TODO: add my super awesome Nix build of PCSX-Redux

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    lib = nixpkgs.lib;
    forAllSystems = lib.genAttrs lib.systems.flakeExposed;
  in
    {
      devShells = forAllSystems (system:
      let
        pkgs = import nixpkgs {
          localSystem = { system = system; };
        };
        crossPkgs = import nixpkgs {
          localSystem = { system = system; };
          crossSystem = { system = "mipsel-none-elf"; };
        };
      in
      {
        default = pkgs.mkShell {
          packages = [
            crossPkgs.buildPackages.gcc-unwrapped
            crossPkgs.buildPackages.binutils-unwrapped
          ];
        };
      });
    };
}
