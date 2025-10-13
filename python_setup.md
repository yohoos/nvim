# Python Environment Setup

## Main Setup
- Pyenv
- pyenv-virtualenv

In ~/.zshrc, set up pyenv to initialize the right python version and virtualenv:

```bash
# Initialize pyenv to manage python environments
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

In new virtualenvs, may need to update installation tools for some packages:

```bash
pip install --upgrade pip
pip install --upgrade wheel
pip install --upgrade setuptools
```
