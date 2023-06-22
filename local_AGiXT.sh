#!/bin/bash

export TOKENIZERS_PARALLELISM=false 
cd agixt
uvicorn app:app --host 0.0.0.0 --port 7437 --workers 4 &
uvicorn_pid=$!
cd ../streamlit
streamlit run Main.py &
streamlit_pid=$!
read -p "Press any key to exit..."
kill $streamlit_pid $uvicorn_pid
wait $streamlit_pid $uvicorn_pid