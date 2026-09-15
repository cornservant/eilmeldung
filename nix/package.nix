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
      "ratatui-table-0.1.0" = "sha256-vgHE8FnhXvY16buGsqj9ObfqmWHdIP+LblHTg1O9v+Q=";
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
