{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.fanservice;
  execCommand = "${pkgs.fanservice}/bin/fanservice";
in
{
  options = {
    services.fanservice = {
      enable = mkEnableOption "fanservice IPMI fan thermostat";
    };
  };
  config = mkIf cfg.enable {
    systemd.services.fanservice = {
      description = "fanservice IPMI fan thermostat";
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
       ExecStart = execCommand;
       Restart = "always";
       RestartSec = "10s";
       User = "root";
       Group = "root";
      };
    };
  };
}
