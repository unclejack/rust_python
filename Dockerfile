FROM brson/rustup-demo
USER root
RUN apt-get update && \
    apt-get install -y wget build-essential automake autoconf g++ pkg-config python python-dev
ENV PATH=/usr/local/musl/bin:/home/rust/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
COPY . /home/rust
RUN chown -R rust:rust /home/rust
USER rust
RUN rustup update
RUN cd /home/rust/python_test && \
    cargo build --release --verbose 
