#!/bin/bash

cd agixt
poetry run uvicorn app:app --host 0.0.0.0 --port 7437 --workers 2 &
uvicorn_pid=$!
cd ../streamlit
poetry run streamlit run Main.py &
streamlit_pid=$!
read -p "Press any key to exit..."
kill $streamlit_pid $uvicorn_pid
wait $streamlit_pid $uvicorn_pid