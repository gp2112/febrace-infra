final: prev: {
  # example = prev.example.overrideAttrs (oldAttrs: rec {
  # ...
  # });
# This line adds our custom packages into the overlay.
} // import ../pkgs { pkgs = final; }
