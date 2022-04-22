import sys

packages_dir = "{{cookiecutter.packages_dir}}"

if packages_dir != packages_dir.strip():
    print("ERROR: packages_dir contains extraneous whitespace.")
    sys.exit(1)

if packages_dir.startswith("..") or packages_dir.startswith("/"):
    print("ERROR: packages_dir must be empty or must end with a slash.")
    sys.exit(1)
