<div align="center">

  <img src="public/img/react.svg" alt="logo" width="200" height="auto" />
  <h1>Password Cracking Demo</h1>

  <p>
    Proof of concept for Hydra and Hashcat
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

- Feature 1.
- Feature 2.
- Feature 3.

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

Use this space to tell a little more about your project and how it can be used.
Show additional screenshots, code samples, demos, or links to other resources.

```jsx
// foo.jsx
import Component from "react-template";

function App() {
  return <Component />;
}
```

<!-- Roadmap -->

## :compass: Roadmap

- [x] Todo 1.
- [ ] Todo 2.

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

- Question 1

  - Answer 1.

- Question 2

  - Answer 2.

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
