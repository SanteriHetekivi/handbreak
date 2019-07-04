# HandBreak
My [HandBrake](https://handbrake.fr/) [Docker](https://www.docker.com/) configuration.

1. Make directory that has files to encode and preset.json file with encoding options.
1. Build image:
    ```sh
    docker build . -t handbreak
    ```
1. Run image with path to your directory:
    ```sh
    docker run -v PATH_TO_DIRECTORY_WITH_FILES_AND_PRESET:/data handbreak
    ```
