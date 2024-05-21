# Use an official Ubuntu as a parent image
FROM ubuntu:18.04

# Update and install software properties common and dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa

# Install Python 3.6
RUN apt-get update && apt-get install -y \
    python3.6 \
    python3.6-venv \
    python3.6-dev \
    python3-pip

# Install nano and git
RUN apt-get update && apt-get install -y \
    nano \
    git

# Set Python 3.6 as the default python
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1

# Verify installations
RUN python3 --version && nano --version && git --version

# Default command
CMD ["bash"]
