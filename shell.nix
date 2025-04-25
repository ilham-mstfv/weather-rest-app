let
  pkgs = import <nixpkgs> {};

  pythonEnv = pkgs.python3.withPackages (ps: with ps; [
    fastapi
    uvicorn
    httpx
    httpie
    python-dotenv
    aiohttp
    black
    pip
  ]);

in pkgs.mkShell {
  nativeBuildInputs = [ pkgs.python3Packages.virtualenv ];

  buildInputs = [ pythonEnv ];

  shellHook = ''
    echo "Enabling python env..."
  '';
}
