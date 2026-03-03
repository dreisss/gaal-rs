{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    crystal
    shards

    crystalline
    ameba

    openssl
    zlib
    pkg-config
    libxml2
    libyaml
    libevent
  ];

  shellHook = ''
    fish
  '';
}
