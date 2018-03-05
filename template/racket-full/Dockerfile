FROM slogsdon/racket

# Alternatively use ADD https:// (which will not be cached by Docker builder)
RUN apt-get update && apt-get install -y curl \ 
    && echo "Pulling watchdog binary from Github." \
    && curl -sSL https://github.com/openfaas/faas/releases/download/0.7.1/fwatchdog > /usr/bin/fwatchdog \
    && chmod +x /usr/bin/fwatchdog \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/

COPY index.rkt           .

RUN mkdir -p function
WORKDIR /root/function/

WORKDIR /root/
COPY function           function
RUN raco make index.rkt

ENV fprocess="racket index.rkt"

HEALTHCHECK --interval=1s CMD [ -e /tmp/.lock ] || exit 1

CMD ["fwatchdog"]
