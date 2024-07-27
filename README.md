<p align="center"><a href="#" target="_blank"><img src="https://raw.githubusercontent.com/trakli/trakli/main/logo.svg" width="400" alt="Trakli Logo"></a></p>

| [Mobile](https://appdistribution.firebase.dev/i/ef5a870535504428) | [Frontend](https://trakli-ui.pages.dev/) | Web Service |
|-|-|-|
| [![Check, Test and Build](https://github.com/trakli/trakli-mobile/actions/workflows/build.yml/badge.svg)](https://github.com/trakli/trakli-mobile/actions/workflows/build.yml) | [![Lint](https://github.com/trakli/trakli-ui/actions/workflows/checks.yml/badge.svg)](https://github.com/trakli/trakli-ui/actions/workflows/checks.yml) | [![Checks](https://github.com/trakli/trakli-webservice/actions/workflows/checks.yml/badge.svg)](https://github.com/trakli/trakli-webservice/actions/workflows/checks.yml) |

# Trakli

## Overview

Trakli is a personal income tracking application. The application allows users to manage and categorize their income and expenses under various groups.


#### Introduction

This guide will help you set up Trakli. The project contains several Bash scripts for managing the environment, located in the `tools` directory.

#### Prerequisites

Before you start, ensure you have the following installed:
- Bash (Unix shell)
- Docker and Docker compose (for containerization)
- Git (for version control)

#### Setup

**Clone the Repository (If not already done)**:
   - If you haven't already cloned the repository, you can do so using the following command:
     ```bash
     git clone git@github.com:trakli/trakli.git
     ```
   - Navigate to the project directory:
     ```bash
     cd trakli
     ```

**Configuration**:
   Copy the example configuration file and rename it to `local.bash`:
     ```bash
     cp config/local.bash.example config/local.bash
     ```

#### Setup the Environment

To set up the environment, use the provided `sync.bash` script:

**Run the environment**:
   ```bash
   ./tools/sync.bash
   ```
This script will clone the necessary repositories required to run Trakli.

#### Running the Environment

To start the environment, use the provided `run.bash` script:

**Run the environment**:
   ```bash
   ./tools/run.bash
   ```
   This script will set up and start the necessary services of Trakli.

#### Stopping the Environment

To stop the environment, use the provided `stop.bash` script:

**Stop the environment**:
   ```bash
   ./tools/stop.bash
   ```
   This script will stop all the running services related to Trakli.

#### Troubleshooting

- Ensure all scripts have the necessary execution permissions. If not, you can add execute permissions using:
  ```bash
  chmod +x <script_name>.bash
  ```
- Make sure your configuration in `local.bash` is correctly set up.
