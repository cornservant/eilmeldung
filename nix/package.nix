{ src, version }:

{ lib
, rustPlatform
, pkg-config
, cmake
, perl
, mold
, aws-lc
, sqlite
}:

rustPlatform.buildRustPackage {
  pname = "eilmeldung";
  inherit version src;

  doCheck = false;

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };

   nativeBuildInputs = [
     rustPlatform.bindgenHook
     pkg-config
     cmake
     perl
     mold
   ];

  buildInputs = [
    aws-lc
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
