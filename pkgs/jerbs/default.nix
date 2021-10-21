{ lib, stdenv, rustPlatform, fetchCrate, sqlite }:

rustPlatform.buildRustPackage rec {
  pname = "jerbs";
  version = "0.1.0";

  src = fetchCrate {
    inherit version pname;
    sha256 = "0pq533glr4ly84m0h05xyr1ss6l4fxsfcjf5jbvmb39wgc66hrf4";
  };
  cargoSha256 = "088mq2b0ykhnixsfkc4mzy5sqd4hpgfrwzjx16y0fmm6r2cinmw3";

  meta = with lib; {
    description = "Command-line work-stealing scheduler.";
    homepage = "http://github.com/kazcw/jerbs";
    license = licenses.gpl3;
    maintainers = with maintainers; [ kazcw ];
  };

  buildInputs = [ sqlite ];
  strictDeps = true;
}
