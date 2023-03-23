<div align="center">

  <h1>Password Cracking Demo</h1>

  <p>
    Demo for Hydra and Hashcat
  </p>

<!-- Badges -->
<p>
  <a href="https://github.com/DuckyMomo20012/pw-crack-demo/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/DuckyMomo20012/pw-crack-demo" alt="contributors" />
  </a>
  <a href="">
    <img src="https://img.shields.io/github/last-commit/DuckyMomo20012/pw-crack-demo" alt="last update" />
  </a>
  <a href="https://github.com/DuckyMomo20012/pw-crack-demo/network/members">
    <img src="https://img.shields.io/github/forks/DuckyMomo20012/pw-crack-demo" alt="forks" />
  </a>
  <a href="https://github.com/DuckyMomo20012/pw-crack-demo/stargazers">
    <img src="https://img.shields.io/github/stars/DuckyMomo20012/pw-crack-demo" alt="stars" />
  </a>
  <a href="https://github.com/DuckyMomo20012/pw-crack-demo/issues/">
    <img src="https://img.shields.io/github/issues/DuckyMomo20012/pw-crack-demo" alt="open issues" />
  </a>
  <a href="https://github.com/DuckyMomo20012/pw-crack-demo/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/DuckyMomo20012/pw-crack-demo.svg" alt="license" />
  </a>
</p>

<h4>
    <a href="https://github.com/DuckyMomo20012/pw-crack-demo/">View Demo</a>
  <span> · </span>
    <a href="https://github.com/DuckyMomo20012/pw-crack-demo">Documentation</a>
  <span> · </span>
    <a href="https://github.com/DuckyMomo20012/pw-crack-demo/issues/">Report Bug</a>
  <span> · </span>
    <a href="https://github.com/DuckyMomo20012/pw-crack-demo/issues/">Request Feature</a>
  </h4>
</div>

<br />

<!-- Table of Contents -->

# :notebook_with_decorative_cover: Table of Contents

- [About the Project](#star2-about-the-project)
  - [Features](#dart-features)
  - [Environment Variables](#key-environment-variables)
- [Getting Started](#toolbox-getting-started)
  - [Prerequisites](#bangbang-prerequisites)
  - [Run Locally](#running-run-locally)
- [Usage](#eyes-usage)
- [Roadmap](#compass-roadmap)
- [Contributing](#wave-contributing)
  - [Code of Conduct](#scroll-code-of-conduct)
- [FAQ](#grey_question-faq)
- [License](#warning-license)
- [Contact](#handshake-contact)
- [Acknowledgements](#gem-acknowledgements)

<!-- About the Project -->

## :star2: About the Project

<!-- Features -->

### :dart: Features

- Setup `postgres` and `ssh` service for Hydra.

<!-- Env Variables -->

### :key: Environment Variables

To run this project, you will need to add the following environment variables to
your `.env` file:

- **DB configs:**

  `POSTGRES_USER`: Postgres user.
  `POSTGRES_PASSWORD`: Postgres password.

E.g:

```
# .env
POSTGRES_USER=postgres
POSTGRES_PASSWORD=***
```

You can also check out the file `.env.example` to see all required environment
variables.

<!-- Getting Started -->

## :toolbox: Getting Started

<!-- Prerequisites -->

### :bangbang: Prerequisites

- [Docker](https://www.docker.com/) installed locally:

  ```bash
  #!/usr/bin/env bash

  # Uninstall old versions
  sudo apt-get remove docker docker-engine docker.io containerd runc

  # Set up the repository

  # Update the apt package index and install packages to allow apt to use a
  # repository over HTTPS
  sudo apt-get update

  sudo apt-get install \
      ca-certificates \
      curl \
      gnupg \
      lsb-release

  # Add Docker’s official GPG key
  sudo mkdir -m 0755 -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  # Use the following command to set up the repository
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  # Install Docker Engine

  # Update the apt package index
  sudo apt-get update

  # Install Docker Engine, containerd, and Docker Compose.
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  # Post installation steps

  # Add your user to the docker group
  sudo usermod -aG docker $USER
  ```

- `nvidia` drivers: Required for the `hashcat` container.

  ```bash
  sudo ubuntu-drivers autoinstall
  ```

- `cuda toolkit` driver: Required for the `hashcat` container.

  ```bash
  wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
  sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
  wget https://developer.download.nvidia.com/compute/cuda/12.1.0/local_installers/cuda-repo-ubuntu2204-12-1-local_12.1.0-530.30.02-1_amd64.deb
  sudo dpkg -i cuda-repo-ubuntu2204-12-1-local_12.1.0-530.30.02-1_amd64.deb
  sudo cp /var/cuda-repo-ubuntu2204-12-1-local/cuda-*-keyring.gpg /usr/share/keyrings/
  sudo apt-get update
  sudo apt-get -y install cuda
  ```

  You should see the output when running `nvidia-smi`:

  ```bash
  Thu Mar 23 00:08:35 2023
  +-----------------------------------------------------------------------------+
  | NVIDIA-SMI 525.89.02    Driver Version: 525.89.02    CUDA Version: 12.0     |
  |-------------------------------+----------------------+----------------------+
  | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
  | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
  |                               |                      |               MIG M. |
  |===============================+======================+======================|
  |   0  NVIDIA GeForce ...  Off  | 00000000:01:00.0  On |                  N/A |
  | 39%   37C    P8     2W /  46W |    395MiB /  4096MiB |      0%      Default |
  |                               |                      |                  N/A |
  +-------------------------------+----------------------+----------------------+

  +-----------------------------------------------------------------------------+
  | Processes:                                                                  |
  |  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
  |        ID   ID                                                   Usage      |
  |=============================================================================|
  |    0   N/A  N/A      1104      G   /usr/lib/xorg/Xorg                133MiB |
  |    0   N/A  N/A      1423      G   /usr/bin/gnome-shell               83MiB |
  |    0   N/A  N/A      3237      G   ...755303089409397513,131072       83MiB |
  |    0   N/A  N/A      3811      G   /usr/bin/wezterm-gui                2MiB |
  |    0   N/A  N/A      4245      G   ...RendererForSitePerProcess       83MiB |
  +-----------------------------------------------------------------------------+
  ```

- `nvidia-container-toolkit`: Required for the `hashcat` container to access the
  GPU hardware. If you install the `hashcat` tool to your host machine, you can
  skip this step.

  Ref: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#setting-up-nvidia-container-toolkit

  ```bash
  distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

  sudo apt-get update
  sudo apt-get install -y nvidia-container-toolkit
  ```

  > **Note**: For Ubuntu 22.10, just replace `$(. /etc/os-release;echo
$ID$VERSION_ID)` with `ubuntu22.04`, which is the latest [supported
  > version](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#linux-distributions).

  Restart the docker daemon:

  ```bash
  sudo systemctl restart docker
  ```

  At this point, a working setup can be tested by running a base CUDA container:

  ```bash
  sudo docker run --rm --runtime=nvidia --gpus all nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi
  ```

  This should result in a console output shown below:

  ```bash
  +-----------------------------------------------------------------------------+
  | NVIDIA-SMI 450.51.06    Driver Version: 450.51.06    CUDA Version: 11.0     |
  |-------------------------------+----------------------+----------------------+
  | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
  | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
  |                               |                      |               MIG M. |
  |===============================+======================+======================|
  |   0  Tesla T4            On   | 00000000:00:1E.0 Off |                    0 |
  | N/A   34C    P8     9W /  70W |      0MiB / 15109MiB |      0%      Default |
  |                               |                      |                  N/A |
  +-------------------------------+----------------------+----------------------+

  +-----------------------------------------------------------------------------+
  | Processes:                                                                  |
  |  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
  |        ID   ID                                                   Usage      |
  |=============================================================================|
  |  No running processes found                                                 |
  +-----------------------------------------------------------------------------+
  ```

<!-- Run Locally -->

### :running: Run Locally

Clone the project:

```bash
git clone https://github.com/DuckyMomo20012/pw-crack-demo.git
```

Go to the project directory:

```bash
cd pw-crack-dem
```

Run the project using `docker-compose`:

```bash
docker compose up -d
```

Finally, you can stop the project by running:

```bash
docker compose down -v
```

<!-- Usage -->

## :eyes: Usage

### Hydra

The config files for `hydra` container is mounted from `configs/hydra/` to
`/var/configs/` directory:

- `pg`: The config files to crack sample PostgreSQL database.

  - `pwlist.txt`: The `login:password` list to crack the database. The default
    postgres password is defined in `.env` file, using `POSTGRES_PASSWORD`
    variable.
  - `servers.txt`: The server list to crack the database. The default server is
    with the host `postgres` (which is the container name) and port `5432`.

    > **Note**: Since the `hydra` and `postgres` containers are in the same
    > network, so they can communicate with each other using the container name
    > for simplicity, instead of using the IP address.

  - `run.sh`: The script to run `hydra` to crack the database.

The container is also configured to use the `ssh` service, so you can test to
crack the password of your local machine.

### Hashcat

We haven't setup any config files for `hashcat` container yet. You can use
examples provided by `hashcat` to test the container, which in the `hashcat`
directory.

<!-- Roadmap -->

## :compass: Roadmap

- [x] Setup `hashcat` container to crack WPA/WPA2 password.

<!-- Contributing -->

## :wave: Contributing

<a href="https://github.com/DuckyMomo20012/pw-crack-demo/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=DuckyMomo20012/pw-crack-demo" />
</a>

Contributions are always welcome!

<!-- Code of Conduct -->

### :scroll: Code of Conduct

Please read the [Code of Conduct](https://github.com/DuckyMomo20012/pw-crack-demo/blob/main/CODE_OF_CONDUCT.md).

<!-- FAQ -->

## :grey_question: FAQ

- How can I setup more services for `hydra` to crack?

  - You can install the required library for the service you want to crack in
    the `docker/hydra/Dockerfile` file and rebuild the image.

<!-- License -->

## :warning: License

Distributed under MIT license. See
[LICENSE](https://github.com/DuckyMomo20012/pw-crack-demo/blob/main/LICENSE)
for more information.

<!-- Contact -->

## :handshake: Contact

Duong Vinh - [@duckymomo20012](https://twitter.com/duckymomo20012) -
tienvinh.duong4@gmail.com

Project Link: [https://github.com/DuckyMomo20012/pw-crack-demo](https://github.com/DuckyMomo20012/pw-crack-demo).

<!-- Acknowledgments -->

## :gem: Acknowledgements

Here are useful resources and libraries that we have used in our projects:

- [Awesome Readme Template](https://github.com/Louis3797/awesome-readme-template):
  A detailed template to bootstrap your README file quickly.
