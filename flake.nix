{
  description = "A very basic flake";
  inputs = { };

  outputs = { self }: {
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
  };
}
