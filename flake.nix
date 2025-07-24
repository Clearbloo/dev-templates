{
  description = "A collection of dev templates";
  inputs = { };

  outputs = { self }: {
    templates.default = {
      path = ./default;
      description = "Default dev template";
    };
    templates.python = {
      path = ./python;
      description = "Python dev template";
    };
  };
}
