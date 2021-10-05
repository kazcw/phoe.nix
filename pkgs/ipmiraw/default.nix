{ lib, stdenv, linuxHeaders, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "ipmiraw";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "kazcw";
    repo = "ipmiraw";
    rev = "721eb0a84f009cc27da29762a59f13d6a7778144";
    hash = "sha256:0ygfms02xgybh1dha508jk5x94jl48y5nw9mz5mlfrw76prshg0p";
  };

  buildPhase = ''
    CFLAGS="-I${linuxHeaders}/include" make
  '';

  installPhase = ''
    mkdir -p $out/lib
    cp ipmiraw.o $out/lib/libipmiraw.a
  '';

  meta = with lib; {
    description = "API for submitting raw IPMI commands";
    homepage = "http://github.com/kazcw/ipmiraw";
    license = licenses.mit;
    maintainers = with maintainers; [ kazcw ];
  };
}
