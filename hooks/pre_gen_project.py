import sys

source_dir = "{{cookiecutter.source_dir}}"

if source_dir != source_dir.strip():
    print("ERROR: source_dir contains extraneous whitespace.")
    sys.exit(1)

if source_dir.startswith("..") or source_dir.startswith("/"):
    print("ERROR: source_dir must be empty or must end with a slash.")
    sys.exit(1)
