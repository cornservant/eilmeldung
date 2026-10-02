{ lib
, rustPlatform
, pkg-config
, cmake
, perl
, openssl
, libxml2
, sqlite
}:

{ src, version }:

rustPlatform.buildRustPackage {
  pname = "eilmeldung";
  inherit version src;

  cargoLock = {
    lockFile = "${src}/Cargo.lock";

    outputHashes = {
      "ratatui-0.30.2" = "sha256-8l6XZ+xm339kQibmNo21G5BHVvvNVJlYOfwftWQSs4s=";
      "ratatui-core-0.1.2" = "";
      "ratatui-crossterm-0.1.2" = "";
      "ratatui-macros-0.7.2" = "";
      "ratatui-termina-0.1.0" = "";
      "ratatui-widgets-0.3.2" = "";
    };
  };

  nativeBuildInputs = [
    rustPlatform.bindgenHook
    pkg-config
    cmake
    perl
  ];

  buildInputs = [
    openssl
    libxml2
    sqlite
  ];

  meta = {
    description = "Feature-rich TUI RSS Reader based on the news-flash library";
    homepage = "https://github.com/christo-auer/eilmeldung";
    license = lib.licenses.gpl3Plus;
    #maintainers = with lib.maintainers [ christo-auer ];
    mainProgram = "eilmeldung";
  };
}
