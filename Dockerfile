FROM rust:1.43.0 AS build

ENV GLEAM_VERSION="v0.8.0"

# RUN wget -c https://github.com/gleam-lang/gleam/releases/download/v0.8.0-rc1/gleam-v0.8.0-rc1-linux-amd64.tar.gz -O - | tar -xz -C /bin
RUN set -xe \
        && curl -fSL -o gleam-src.tar.gz "https://github.com/gleam-lang/gleam/archive/${GLEAM_VERSION}.tar.gz" \
        && mkdir -p /usr/src/gleam-src \
        && tar -xzf gleam-src.tar.gz -C /usr/src/gleam-src --strip-components=1 \
        && rm gleam-src.tar.gz \
        && cd /usr/src/gleam-src \
        && make install \
        && rm -rf /usr/src/gleam-src

FROM erlang:22.3.2

COPY --from=build /usr/local/cargo/bin/gleam /bin
RUN gleam --version

CMD ["gleam"]
