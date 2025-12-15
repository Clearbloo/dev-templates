{
  description = "A collection of dev templates";
  inputs = { };

  outputs = _: {
    templates = {
      default = {
        path = ./default;
        description = "Default dev template";
      };
      ruby = {
        path = ./ruby;
        description = "Ruby dev template";
      };
      nim = {
        path = ./nim;
        description = "Nim dev template";
      };
      python = {
        path = ./python;
        description = "Python dev template";
      };
      rust = {
        path = ./rust;
        description = "Rust dev template";
      };
      surreal_rust = {
        path = ./surreal_rust;
        description = "Surreal + Rust dev template";
      };
      gleam = {
        path = ./gleam;
        description = "Gleam dev template";
      };
      go = {
        path = ./go;
        description = "Go dev template";
      };
      zig = {
        path = ./zig;
        description = "Zig dev template";
      };
    };
  };
}
