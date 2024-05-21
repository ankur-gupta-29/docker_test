# Use an official Ubuntu as a parent image
FROM ubuntu:18.04

# Update and install software properties common and dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    git \
    nano \
    python3.6 \
    python3.6-venv \
    python3.6-dev \
    python3-pip

# Set Python 3.6 as the default python
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1

# Upgrade pip and install required Python packages
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install \
    tensorflow==1.15 \
    numpy==1.17 \
    scipy==1.1.0 \
    scikit-learn==0.20

# Clone the twpca repository and install it
RUN git clone https://github.com/ganguli-lab/twpca \
    && cd twpca \
    && python3 -m pip install -e .

# Verify installations
RUN python3 --version \
    && nano --version \
    && git --version \
    && python3 -m pip list | grep -E 'tensorflow|numpy|scipy|scikit-learn|twpca'

# Default command
CMD ["bash"]
