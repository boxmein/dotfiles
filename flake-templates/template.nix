{
  description = "ecsc.ee";

  inputs =
    {
      flake-utils.url = "github:numtide/flake-utils";
      nixpkgs.url = "github:NixOS/nixpkgs";
    };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    with pkgs;
    {
      devShells.default = mkShell {
        buildInputs = with pkgs; [
          yarn
          nodejs
        ];
      };
    }
  );
}
