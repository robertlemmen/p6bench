FROM debian:buster

RUN apt-get update && apt-get install --yes build-essential git \
libatomic-ops-dev libffi-dev libtommath-dev libuv1-dev curl

run mkdir /p6bench

COPY runbench /
COPY 01-logmunge 02-gauss-elimination 03-mandelbrot 04-backend /p6bench/

ENTRYPOINT ["/runbench"]
