{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    (callPackage ./default.nix {})
    gcc
    gnumake
    pkg-config
    SDL2
    SDL2_image
    SDL2_mixer
    SDL2_ttf
    assimp
    fftw
  ];

  shellHook = ''
    # Configuration pour les bibliothèques partagées
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.lib.makeLibraryPath [
      pkgs.SDL2
      pkgs.SDL2_image
      pkgs.SDL2_mixer
      pkgs.SDL2_ttf
      pkgs.assimp
      pkgs.fftw
    ]}"

    # Configuration pour pkg-config
    export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$out/lib/pkgconfig"

    # Configuration pour les fichiers d'en-tête
    export C_INCLUDE_PATH="$C_INCLUDE_PATH:${pkgs.SDL2.dev}/include/SDL2"
  '';
}
