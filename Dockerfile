FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y python3.11 python3.11-venv python3.11-dev python3.11-distutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app
COPY requirements.txt ./requirements.txt

RUN python3.11 -m venv venv && \
    /bin/bash -c "source venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt"

ENTRYPOINT ["./venv/bin/python3.11"]
EXPOSE 5000
CMD ["python", "app.py"]