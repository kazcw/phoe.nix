{ lib, stdenv, rustPlatform, fetchFromGitHub, lm_sensors, ipmiraw }:

rustPlatform.buildRustPackage rec {
  pname = "fanservice";
  version = "0.3";

  src = fetchFromGitHub {
    owner = "kazcw";
    repo = "fanservice";
    rev = "77d26d7ef9721ea11be4babc549c250c354be09a";
    hash = "sha256:1444410g2w5xc5lzrm4g9zjlv0qn8gar0llfr7fc6cd68g1hxlxm";
  };
  cargoSha256 = "04an7y68v6hk8z5dd61pq2977v8s3n3l9d396n0019zyzy31dspz";

  features = ["systemd"];

  meta = with lib; {
    description = "Fan speed daemon for PowerEdge servers";
    homepage = "http://github.com/kazcw/fanservice";
    license = licenses.mit;
    maintainers = with maintainers; [ kazcw ];
  };

  buildInputs = [ lm_sensors ipmiraw ];
}
