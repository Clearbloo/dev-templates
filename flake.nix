{
  description = "A collection of dev templates";
  inputs = { };

  outputs = { self }: {
    templates.default = {
      path = ./default;
      description = "Default dev template";
    };
    templates.nim = {
      path = ./nim;
      description = "Nim dev template";
    };
    templates.python = {
      path = ./python;
      description = "Python dev template";
    };
    templates.rust = {
      path = ./rust;
      description = "Rust dev template";
    };
    templates.surreal_rust = {
      path = ./surreal_rust;
      description = "Surreal + Rust dev template";
    };
    templates.gleam = {
      path = ./gleam;
      description = "Gleam dev template";
    };
    templates.go = {
      path = ./go;
      description = "Go dev template";
    };
    templates.zig = {
      path = ./zig;
      description = "Zig dev template";
    };
  };
}
