{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  name = "fabric-shell";
  
  buildInputs = [
    pkgs.python312

    (pkgs.python312Packages.buildPythonPackage {
      pname = "fabric";
      version = "1.0.0";

      src = pkgs.fetchFromGitHub {
        owner = "Fabric-Development";
        repo = "fabric";
        rev = "5ab94b5e64ba342af2ef2abf829d1f2b0d9a032a";
        hash = "sha256-5yMT4AZpUKHV+Th21zsAWmTQUwNk079zP7IOD2ASWlI=";
      };

      propagatedBuildInputs = with pkgs; [ 
        gtk3
        cairo
        gtk-layer-shell
        libgig
        gobject-introspection
        pkgconf
        python312Packages.cairosvg
        python312Packages.loguru
        python312Packages.pygobject-stubs
        python312Packages.pygobject3
      ];
    })

    (pkgs.rustPlatform.buildRustPackage {
      pname = "gengir";
      version = "1.0.0";
      cargoHash = "sha256-l3bL8hwRJs+JW9bGC31WIwbel9XeWJOoEaw/K/2W9pg=";

      src = pkgs.fetchFromGitHub {
        owner = "santiagocezar";
        repo = "gengir";
        rev = "11e1b6447bf140bfc8c95127856bf6cc204971de";
        hash = "sha256-sKQcl8frMD+tDWd9skUh2iVenmcqPlY1XFybKxZluic=";
      };
    })
  ];
}
