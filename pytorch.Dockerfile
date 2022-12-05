ARG BASE="jupyter/base-notebook"
ARG TAG="python-3.10"
FROM ${BASE}:${TAG}

# Add a "USER root" statement followed by RUN statements to install system packages using apt-get,
# change file permissions, etc.

# If you do switch to root, always be sure to add a "USER $NB_USER" command at the end of the
# file to ensure the image runs as a unprivileged user by default.

# USER root
# RUN apt-get update --yes && \
#    apt-get install --yes --no-install-recommends \
#    build-essential \
#    ffmpeg && \  # for matplotlib anim
#    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir --disable-pip-version-check torch torchvision --extra-index-url https://download.pytorch.org/whl/cpu && \
    pip3 install --no-cache-dir --disable-pip-version-check gradio ipdb && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Switch back to $NB_USER
# USER ${NB_UID}