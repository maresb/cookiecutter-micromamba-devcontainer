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

* `project_name`: The name of the package in your Python project
* `python_version`: The Python version to install
* `timezone`: The timezone to use
* `source_dir`: Leave this blank, or set it to `src/`, `pypackages/`, or whatever relative path you have to your project's source code. (Should be a directory with the same name as `project_name`.)

To update to a new revision, run

```bash
cd .devcontainer
cruft update
```

In case you get the error "Cruft cannot apply updates on an unclean git project", you can run `git stash` to temporarily stash your tracked files, and then run `git stash pop` to restore them after the update has finished. In case you have untracked files, you can run `cruft update --allow-untracked-files`.
