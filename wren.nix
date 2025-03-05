{
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "wren-cli";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "wren-lang";
    repo = "wren-cli";
    rev = "18553636618a4d33f10af9b5ab92da6431784a8c";
    hash = "sha256-UqGdIsLoSh5bTxf7AvPBh+abSPylKMlMbDw+j0IclKM=";
  };

  buildPhase = ''
    cd projects/make
    make wren_cli
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp ../../bin/wren_cli $out/bin/wren_cli

    runHook postInstall
  '';
}
