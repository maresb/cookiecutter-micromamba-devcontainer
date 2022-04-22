# Example Cookiecutter template for using micromamba-devcontainer

## Links

* [GitLab](https://gitlab.com/bmares/cookiecutter-micromamba-devcontainer)
* [GitHub](https://github.com/maresb/cookiecutter-micromamba-devcontainer)
* [Micromamba Devcontainer](https://github.com/maresb/micromamba-devcontainer)
* [Cruft](https://github.com/cruft/cruft)

## Setup

The assumption is that you are developing a Python project, and managing the project-level dependencies with Poetry.

Install Cruft, change to your project root (the directory inside of which you want to create `.devcontainer`) and run

```bash
cruft create https://gitlab.com/bmares/cookiecutter-micromamba-devcontainer
```

(It's possible to replace `cruft create` with `cookiecutter` but then you won't be able to perform updates.)

Then fill in the following variables:

* `package_name`: The name of the package in your Python project, as specified as `name` in the `pyproject.toml`.
* `python_version`: The Python version to install
* `timezone`: The timezone to use
* `packages_dir`: Leave this as `.` for project root, or set it to `src/`, `pypackages/`, or whatever is the relative path to the directory that should contain the `package_name` package.)

To update to a new revision, run

```bash
cd .devcontainer
cruft update
```

In case you get the error "Cruft cannot apply updates on an unclean git project", you can run `git stash` to temporarily stash your tracked files, and then run `git stash pop` to restore them after the update has finished. In case you have untracked files, you can run `cruft update --allow-untracked-files`.
