# Example Cookiecutter template for using micromamba-devcontainer

| | |
| --- | --- |
| This project | [![GitLab](https://img.shields.io/badge/GitLab-bmares/cookiecutter--micromamba--devcontainer-blue.svg?logo=gitlab)](https://gitlab.com/bmares/cookiecutter-micromamba-devcontainer) [![GitHub](https://img.shields.io/badge/GitHub-maresb/cookiecutter--micromamba--devcontainer-blue.svg?logo=github)](https://github.com/maresb/cookiecutter-micromamba-devcontainer) |
| Usage example | [![GitHub](https://img.shields.io/badge/GitHub-maresb/micromamba--devcontainer--example-blue.svg?logo=github)](https://github.com/maresb/micromamba-devcontainer-example) |
| Base image | [![GitHub](https://img.shields.io/badge/GitHub-mamba--org/micromamba--devcontainer-blue.svg?logo=github)](https://github.com/mamba-org/micromamba-devcontainer) |
| Template engine | [![GitHub](https://img.shields.io/badge/GitHub-cruft/cruft-blue.svg?logo=github)](https://github.com/cruft/cruft)

## Setup

The assumption is that you are developing a Python project and managing the project-level Python dependencies with a modern standards-compliant packaging system like [Hatch](https://github.com/pypa/hatch) or [Flit](https://github.com/pypa/flit). Thus you should have a `pyproject.toml` file in your project directory.

Install Cruft, change to your project root (the directory inside of which you want to create `.devcontainer`) and run

```bash
cruft create https://github.com/maresb/cookiecutter-micromamba-devcontainer
```

(It's possible to replace `cruft create` with `cookiecutter` but then you won't be able to perform updates.)

Then fill in the following variables:

* `package_name`: The name of the main package of your project, as you would `import` it from Python.
* `timezone`: The [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) to configure in the devcontainer.
* `packages_dir`: The directory where `package_name` is located (often `src`), or `.` for the project root.

To update to a newer revision, run

```bash
cd .devcontainer
cruft update
```

In case you get the error "Cruft cannot apply updates on an unclean git project", you can run `git stash` to temporarily stash your tracked files, and then run `git stash pop` to restore them after the update has finished. In case you have only untracked files, you can run `cruft update --allow-untracked-files`.

## More information

Please refer to [Micromamba Devcontainer](https://github.com/maresb/micromamba-devcontainer).
