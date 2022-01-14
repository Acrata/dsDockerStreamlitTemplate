FROM python:3.9.9-slim-buster

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH=”$VIRTUAL_ENV/bin:$PATH”

EXPOSE 8501
WORKDIR /app
COPY requirements.txt ./requirements.txt
RUN --mount=type=cache,target=/root/.cache \
    pip install -r requirements.txt
COPY . .
CMD streamlit run main.py
