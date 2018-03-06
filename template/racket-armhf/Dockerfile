FROM dvdmuckle/racket:armhf as builder

WORKDIR /root/

COPY index.rkt           .

RUN mkdir -p function

COPY function           function
RUN raco exe index.rkt && raco distribute function index

FROM alpine
WORKDIR /root/
COPY --from=builder /root/function function
# Alternatively use ADD https:// (which will not be cached by Docker builder)
RUN apk --no-cache add curl libffi \ 
    && echo "Pulling watchdog binary from Github." \
    && curl -sSL https://github.com/openfaas/faas/releases/download/0.7.1/fwatchdog-armhf > /usr/bin/fwatchdog \
    && chmod +x /usr/bin/fwatchdog \
    && apk del curl --no-cache


ENV fprocess="function/bin/index"

HEALTHCHECK --interval=1s CMD [ -e /tmp/.lock ] || exit 1

CMD ["fwatchdog"]
