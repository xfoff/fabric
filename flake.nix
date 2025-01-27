{
  description = "Foo Bar";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs } @inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs;
  in {
    system = system;
    devShells = system (system: {
      default = pkgs.${system}.callPackage ./shell.nix { };
    });
  };
}

