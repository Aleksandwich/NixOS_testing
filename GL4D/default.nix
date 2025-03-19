{ lib
, stdenv
, fetchFromGitHub
, pkg-config
, SDL2
, SDL2_image
, SDL2_mixer
, SDL2_ttf
, assimp
, fftw
, automake
, autoconf
, libtool
}:

stdenv.mkDerivation rec {
  pname = "gl4dummies";
  version = "master";

  src = fetchFromGitHub {
    owner = "noalien";
    repo = "GL4Dummies";
    rev = "master";
    sha256 = "sha256-FLrqrDO2fQ4DlN3RIvbAw1aEo9pacZGp3z18umJY9p0="; 
  };

  nativeBuildInputs = [
    pkg-config
    automake
    autoconf
    libtool
  ];

  buildInputs = [
    SDL2
    SDL2_image
    SDL2_mixer
    SDL2_ttf
    assimp
    fftw
  ];

  configurePhase = ''
    make -f Makefile.autotools
    ./configure --prefix=$out
  '';

  meta = with lib; {
    description = "GL4Dummies library for OpenGL programming";
    homepage = "https://github.com/noalien/GL4Dummies";
    license = licenses.lgpl3;
    platforms = platforms.linux;
  };
}
