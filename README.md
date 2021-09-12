# Docker Images GitHub pages

This is the interface to show the containers in the Docker Images repository.
The script should be run via the main branch of this same repository, and if needed,
you can also run commands manually. As an example:


```bash
# For a Dockerfile build where the tag is in subfolders under ubuntu
$ python scripts/update-site.py gen ghcr.io/rse-radiuss/ubuntu --outdir $PWD/_library --root ubuntu/

# For a matrix build where the Dockerfile is in the root provided
$ python scripts/update-site.py gen ghcr.io/rse-radiuss/nvidia-ubuntu --outdir $PWD/_library --dockerfile nvidia-ubuntu
$ python scripts/update-site.py gen ghcr.io/rse-radiuss/clang-ubuntu-20.04 --outdir $PWD/_library --dockerfile ubuntu/clang
$ python scripts/update-site.py gen ghcr.io/rse-radiuss/cuda-ubuntu-20.04 --outdir $PWD/_library --dockerfile ubuntu/cuda
```
