self: super: {
  fanservice = super.callPackage ./pkgs/fanservice {};
  ipmiraw = super.callPackage ./pkgs/ipmiraw {};
  dovecot = super.callPackage ./pkgs/dovecot {};
  jerbs = super.callPackage ./pkgs/jerbs {};
}
