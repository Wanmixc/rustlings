{
  description = "Rustlings project with VSCode + rust-analyzer LSP";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Rust toolchain dari nixpkgs langsung
            rustc
            cargo
            clippy
            rustfmt
            rust-analyzer
            # Tools tambahan untuk Rustlings
            pkg-config
            openssl
          ];
          
          # Set environment variables
          RUST_BACKTRACE = "1";
          RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
          
          shellHook = ''
            echo "🦀 Rustlings development environment loaded"
            echo "📦 Rust version: $(rustc --version)"
            echo "🔧 Cargo version: $(cargo --version)"
            echo "🧠 rust-analyzer: $(rust-analyzer --version)"
            echo "📚 RUST_SRC_PATH: $RUST_SRC_PATH"
            
            # Rustlings specific setup
            if [ -f "Cargo.toml" ]; then
              echo "📝 Rustlings project detected"
              # Build project to generate necessary metadata
              echo "🔨 Building project metadata..."
              cargo check --workspace 2>/dev/null || true
            else
              echo "⚠️  No Cargo.toml found. This might not be a Rustlings project."
            fi
            
            # Ensure rust-analyzer can work with all workspace members
            if [ -d "exercises" ]; then
              echo "📚 Rustlings exercises directory found"
            fi
          '';
        };
      });
}
