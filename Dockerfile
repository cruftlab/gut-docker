ARG GODOT_VERSION=3.1.2

FROM ioribranford/godot-docker:$GODOT_VERSION

LABEL maintaner="loket@cruftlab.io"

# Create executable for 'gut'
RUN printf '#!/bin/bash\ngodot --debug-collisions --path /game -d -s addons/gut/gut_cmdln.gd "$@"' > /usr/bin/gut && \
  chmod +x /usr/bin/gut

# Create volume for game
VOLUME /game

ENTRYPOINT ["/usr/bin/gut"]
