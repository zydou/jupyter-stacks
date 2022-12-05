# Jupyter Docker Stacks

This project is developed with the helpful guide of [Jupyter Docker Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/). The base container is **jupyter/base-notebook** and this **Community Stack** is setup [via the guide.](https://jupyter-docker-stacks.readthedocs.io/en/latest/contributing/stacks.html)

## What this stack contains

- `pytorch` (CPU only)
- `torchvision`
- `gradio`

## How to use

```sh
docker run -it --rm -p 10000:8888 -v "${PWD}":/home/jovyan/work zydou/jupyter-notebook:pytorch
```

This command pulls the `zydou/jupyter-notebook` image tagged `pytorch` from Docker Hub if it is not already present on the local host. It then starts a container running a Jupyter Server and exposes the container's internal port `8888` to port `10000` of the host machine.


You can modify the port on which the container's port is exposed by [changing the value of the `-p` option](https://docs.docker.com/engine/reference/run/#expose-incoming-ports) to `-p 8888:8888`.

Visiting `http://<hostname>:10000/?token=<token>` in a browser loads JupyterLab,
where:

- `hostname` is the name of the computer running Docker
- `token` is the secret token printed in the console.

The container remains intact for restart after the Jupyter Server exits.

See more details on [offical docs](https://jupyter-docker-stacks.readthedocs.io/en/latest/)