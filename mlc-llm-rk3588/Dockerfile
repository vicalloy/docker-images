ARG MODEL
ARG MODEL_LOCAL_ID
# WARNING: Llama-2 requires 16GB board
#ARG MODEL=RedPajama-INCITE-Chat-3B-v1-q4f16_1
#ARG MODEL=Llama-2-7b-chat-hf-q4f16_1
#ARG MODEL=Llama-2-13b-chat-hf-q4f16_1

# --------------------------------------------------------------------------- #

FROM alpine AS fetch
RUN apk add --no-cache \
    git \
    git-lfs \
    ;

FROM scratch AS git-binary-mlc-llm-libs
ADD https://github.com/mlc-ai/binary-mlc-llm-libs.git /

# --------------------------------------------------------------------------- #

FROM scratch AS binary-mlc-llm-lib
ARG MODEL
COPY --from=git-binary-mlc-llm-libs /${MODEL}-mali.so /

# --------------------------------------------------------------------------- #

FROM fetch AS fetch-model
ARG MODEL_LOCAL_ID
ARG GIT_URL="https://huggingface.co/mlc-ai/mlc-chat-${MODEL_LOCAL_ID}.git"
RUN mkdir -p /cache/ && git clone \
      --single-branch --depth 1 \
      --separate-git-dir=/cache/${MODEL_LOCAL_ID}/git \
      ${GIT_URL} \
      /out/${MODEL_LOCAL_ID} \
    ;

# --------------------------------------------------------------------------- #

FROM scratch AS model
COPY --from=fetch-model /out/ /

# --------------------------------------------------------------------------- #

FROM vicalloy/mlc-llm-rk3588:base

COPY --link --from=binary-mlc-llm-lib / /mlc-llm/dist/prebuilt/lib/
COPY --from=model / /mlc-llm/dist/prebuilt/

ENV LD_LIBRARY_PATH=/mlc-llm/build/
WORKDIR /mlc-llm

# HACK: can't interpolate ARGs in CMD, so assign it to an ENV and wrap with
# shell to resolve on start
ARG MODEL_LOCAL_ID
ENV MODEL_LOCAL_ID=${MODEL_LOCAL_ID}
CMD ["sh", "-c", "./build/mlc_chat_cli --local-id ${MODEL_LOCAL_ID} --device mali"]
