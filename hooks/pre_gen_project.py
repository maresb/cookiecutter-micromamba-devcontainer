import sys

packages_dir = "{{cookiecutter.packages_dir}}"

if packages_dir == "":
    print("ERROR: packages_dir is not set.")

if packages_dir != packages_dir.strip():
    print("ERROR: packages_dir contains extraneous whitespace.")
    sys.exit(1)

if packages_dir.startswith("..") or packages_dir.startswith("/"):
    print("ERROR: packages_dir must be empty or must end with a slash.")
    sys.exit(1)

if packages_dir.endswith("/"):
    print("ERROR: packages_dir should not have a trailing slash.")
    sys.exit(1)
