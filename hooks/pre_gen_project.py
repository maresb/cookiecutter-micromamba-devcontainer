import sys

source_dir = "{{cookiecutter.source_dir}}"

if source_dir != "" and not source_dir.endswith("/"):
    print("ERROR: source_dir must be empty or must end with a slash.")
    sys.exit(1)
