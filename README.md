# Ansible config for deep learning server

This is an ansible config for deep learning server.

## Features
- No root privilege is required.
    - All files are installed under `$HOME/.local/`.
- Use official source codes only.
    - Do not rely on third-party tools or unofficial builds.

## Installed packages
- CMake 3.8.2
- git 2.14.1
    - curl 7.55.0
- Python 3.6.2
    - numpy 1.13.1
        - OpenBLAS 0.2.20
- OpenCV 3.3.0
    - Intel TBB 2017
- CUDA 7.5 or 8.0 (depends on the version of NVIDIA driver)
    - CUDNN 6.0

## Requirements
### Local
- Ansible 2.2+

### Remote
- Python

## Usage

1. Edit `hosts`
1. Download CUDA files under `roles/cuda/files/`.
1. Run
    ```
    $ ansible-playbook -i hosts site.yml
    ```
