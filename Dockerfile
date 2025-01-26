FROM ubuntu:24.04

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    git \
    libgl1 \
    libgl1-mesa-dri \
    libsdl2-dev \
    libasound2t64 \
    pulseaudio \
    alsa-utils \
    mesa-utils \
    && add-apt-repository ppa:bartbes/love-stable \
    && apt-get update && apt-get install -y \
    love

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . /app

# Set environment variables for ALSA and PulseAudio
ENV SDL_AUDIODRIVER=alsa
ENV AUDIODEV=hw:0,0

# Command to run the application
CMD ["love", "."]