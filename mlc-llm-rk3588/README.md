# mlc-llm-rk3588

Dockerfiles for [mlc-llm](https://github.com/mlc-ai/mlc-llm) on `RK3588` .

Thanks for: <https://github.com/milas/rock5-toolchain/blob/main/extra/mlc-llm/Dockerfile>

## How to use

You can find all models in <https://hub.docker.com/r/vicalloy/mlc-llm-rk3588/tag> .

```bash
# run mlc_chat_cli
docker run --rm -it --privileged \
    vicalloy/mlc-llm-rk3588:FlagAlpha-Llama2-Chinese-7b-Chat-q4f16_1

# run mlc_chat.rest
docker run --rm -it --privileged \
    vicalloy/mlc-llm-rk3588:FlagAlpha-Llama2-Chinese-7b-Chat-q4f16_1 \
    python3 -m mlc_chat.rest \
    [--host HOST] [--port PORT]

# run mlc_chat.gradio
docker run --rm -it --privileged \
    vicalloy/mlc-llm-rk3588:FlagAlpha-Llama2-Chinese-7b-Chat-q4f16_1 \
    python3 -m mlc_chat.gradio \
    [--port PORT_NUMBER] [--share]
```
