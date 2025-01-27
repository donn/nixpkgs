{ lib
, buildPythonPackage
, fetchFromGitHub
, gpytorch
, linear_operator
, multipledispatch
, pyro-ppl
, setuptools
, setuptools-scm
, wheel
, torch
, scipy
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "botorch";
  version = "0.9.4";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "pytorch";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-MSbGjv+5/znoUeveePuTrTOMTQMQvsc064G7WoHfBMI=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
    wheel
  ];

  propagatedBuildInputs = [
    gpytorch
    linear_operator
    multipledispatch
    pyro-ppl
    scipy
    torch
  ];

  SETUPTOOLS_SCM_PRETEND_VERSION = version;

  checkInputs = [
    pytestCheckHook
  ];
  pythonImportsCheck = [ "botorch" ];

  meta = with lib; {
    description = "Bayesian Optimization in PyTorch";
    homepage = "https://botorch.org";
    license = licenses.mit;
    maintainers = with maintainers; [ veprbl ];
  };
}
