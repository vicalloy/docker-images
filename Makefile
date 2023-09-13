build-mlc-llm:MODEL=Llama-2-7b-chat-hf-q4f16_1
build-mlc-llm:MODEL_LOCAL_ID=FlagAlpha-Llama2-Chinese-7b-Chat-q4f16_1
build-mlc-llm-FlagAlpha-Llama2-Chinese-7b-Chat-q4f16_1: build-mlc-llm

build-mlc-llm:
	DOCKER_BUILDKIT=1 \
	docker build \
		-f mlc-llm-rk3588/Dockerfile \
		--build-arg MODEL_LOCAL_ID=${MODEL_LOCAL_ID} \
		--build-arg MODEL=${MODEL} \
		--platform linux/arm64 \
		-t vicalloy/mlc-llm-rk3588:${MODEL_LOCAL_ID} \
		.
