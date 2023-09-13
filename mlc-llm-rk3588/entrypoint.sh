#!/bin/bash
cmd=$@

# python3 -m mlc_chat.gradio --artifact-path ARTIFACT_PATH [--device DEVICE] [--port PORT_NUMBER] [--share]
if [[ $@ == *"mlc_chat.gradio"* ]]; then
  cmd="${cmd} --device mali --artifact-path dist/prebuilt/"
fi

# python3 -m mlc_chat.rest --model MODEL [--lib-path LIB_PATH] [--device DEVICE] [--host HOST] [--port PORT]
if [[ $@ == *"mlc_chat.rest"* ]]; then
  cmd="${cmd} --device mali  --model ${MODEL_LOCAL_ID}"
fi

if [[ $@ == "" ]]; then
  cmd="./build/mlc_chat_cli --device mali --model ${MODEL_LOCAL_ID}"
fi

# echo ${cmd}
exec ${cmd}
