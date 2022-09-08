FROM ghcr.io/mamba-org/micromamba-devcontainer:git-d24ecc1

# Ensure that all users have read-write access to all files created in the subsequent commands.
ARG DOCKERFILE_UMASK=0000

# Install hadolint for Dockerfile linting (unfortunately not yet available on conda-forge)
# <https://github.com/conda-forge/staged-recipes/pull/14581>
ADD https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64 /usr/local/bin/hadolint
# hadolint ignore=DL3004
RUN sudo chmod a+rx /usr/local/bin/hadolint

# Install the Conda packages.
COPY --chown=$MAMBA_USER:$MAMBA_USER conda-lock.yml /tmp/conda-lock.yml
RUN : \
    # Configure Conda to use the conda-forge channel
    && micromamba config append channels conda-forge \
    # Micromamba will install only things from the "main" category, so
    # we convert the "dev" category to "main"
    && sed -i 's|- category: dev|- category: main|' /tmp/conda-lock.yml \
    # Install and clean up
    && micromamba install --yes --name base --file /tmp/conda-lock.yml \
    && micromamba clean --all --yes \
;

# Activate the conda environment for the Dockerfile.
# <https://github.com/mamba-org/micromamba-docker#running-commands-in-dockerfile-within-the-conda-environment>
ARG MAMBA_DOCKERFILE_ACTIVATE=1

# Install Poetry and Hatch in isolated environments with condax.
RUN : \
  && condax install -c conda-forge/label/poetry_dev -c conda-forge/label/cleo_dev -c conda-forge "poetry==1.2.0rc2" \
  && condax install hatch \
;

# Create and set the workspace folder
ARG CONTAINER_WORKSPACE_FOLDER=/workspaces/default-workspace-folder
RUN mkdir -p "${CONTAINER_WORKSPACE_FOLDER}"
WORKDIR "${CONTAINER_WORKSPACE_FOLDER}"

# Copy only the files necessary to install the project.
# (Remember that we will bind-mount the full project folder after build time.)
COPY --chown=$MAMBA_USER:$MAMBA_USER pyproject.toml ./
# Set the version number to zero to avoid cache busting dependency installation
# when the version number changes.
RUN : \
    && mkdir --parents "{{ cookiecutter.packages_dir }}/{{ cookiecutter.package_name }}/" \
    && echo '__version__ = "0.0.0"' > "{{ cookiecutter.packages_dir }}/{{ cookiecutter.package_name }}/__init__.py" \
    ;

# Install the package for the first time to add project-level dependencies
RUN pip install --no-cache-dir --editable .

# Copy the real __init__.py
COPY --chown=$MAMBA_USER:$MAMBA_USER \
    "{{ cookiecutter.packages_dir }}/{{ cookiecutter.package_name }}/__init__.py" \
    "{{ cookiecutter.packages_dir }}/{{ cookiecutter.package_name }}/"

# Reinstall to fix the version number
RUN pip install --no-cache-dir --editable .
