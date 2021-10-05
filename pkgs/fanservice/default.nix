{ lib, stdenv, rustPlatform, fetchFromGitHub, lm_sensors, ipmiraw }:

rustPlatform.buildRustPackage rec {
  pname = "fanservice";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "kazcw";
    repo = "fanservice";
    rev = "10f6115049f051882953f4668241dec18522dd46";
    hash = "sha256:04wanrznqaqfibmxgbyh0hcxvlmypdlhbinmkccikvjp4d04hz1i";
  };
  cargoSha256 = "0wifv3kypiqc6mw1sh2vdin3kv34n6d4fxx5xa0j926mswp81i8j";

  meta = with lib; {
    description = "Fan speed daemon for PowerEdge servers";
    homepage = "http://github.com/kazcw/fanservice";
    license = licenses.mit;
    maintainers = with maintainers; [ kazcw ];
  };

  buildInputs = [ lm_sensors ipmiraw ];
}
