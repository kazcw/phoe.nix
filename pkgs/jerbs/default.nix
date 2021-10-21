{ lib, stdenv, rustPlatform, fetchFromGitHub, sqlite }:

rustPlatform.buildRustPackage rec {
  pname = "jerbs";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "kazcw";
    repo = "jerbs";
    rev = "153540ad147b54877f84d09ab1acdefb1c0fbed2";
    hash = "sha256:1qv3wfd2rnjj02sng4sqlvg8z1r1y092m964rnf91020j7fhj3ya";
  };
  cargoSha256 = "1y1fc9sd91hzb3fs8x2bm4y907kqlbvzx7ddg9hy02dzh050bfnq";

  meta = with lib; {
    description = "Command-line work-stealing scheduler.";
    homepage = "http://github.com/kazcw/jerbs";
    license = licenses.gpl3;
    maintainers = with maintainers; [ kazcw ];
  };

  buildInputs = [ sqlite ];
  strictDeps = true;
}
