self: super: {
  fanservice = super.callPackage ./pkgs/fanservice {};
  ipmiraw = super.callPackage ./pkgs/ipmiraw {};
}
