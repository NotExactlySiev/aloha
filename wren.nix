{
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "wren";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "wren-lang";
    repo = "wren";
    rev = "0.4.0";
    sha256 = "0w8n5lyn3wa1nmdyci0zi249w1qbq725cr1d9xsg067irq17v8k5";
  };

  buildPhase = ''
    cd projects/make
    make wren_test
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp ../../bin/wren_test $out/bin/wren_test

    runHook postInstall
  '';
}
