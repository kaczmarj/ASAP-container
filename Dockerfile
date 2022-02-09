FROM ubuntu:20.04
ARG DEBIAN_FRONTEND="noninteractive"
ARG ASAP_URL="https://github.com/computationalpathologygroup/ASAP/releases/download/ASAP-2.0-(Nightly)/ASAP-2.0-py38-Ubuntu2004.deb"
RUN apt-get update \
    && apt-get install -yq \
        wget \
    && wget -q -O asap.deb "$ASAP_URL" \
    && apt-get install -yq ./asap.deb \
    && rm asap.deb \
    && rm -rf /var/lib/apt/lists/*
ENV PATH=/opt/ASAP/bin:$PATH
CMD ["/opt/ASAP/bin/ASAP"]
