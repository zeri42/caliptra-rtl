#{pkgs?import<nixpkgs>{}}:
#let   
{pkgs?import<nixpkgs> {
	crossSystem = {
		config = "riscv32-none-elf";
		libc = "newlib";
		#gcc.float = "soft";
		gcc.abi = "ilp32";
	};}
}:
pkgs.mkShell {
	nativeBuildInputs = with pkgs; [
		pkgsBuildHost.gnumake
		pkgsBuildHost.verilator
		pkgsBuildHost.which
	];
	buildInputs = [
		pkgs.stdenv.cc
	];
}

