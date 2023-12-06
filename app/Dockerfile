FROM python:3.9.18-alpine

RUN pip install --upgrade pip
COPY . /app
WORKDIR /app
RUN pip install -r requirement.txt
RUN chmod +x entrypoint.sh
ENTRYPOINT ["sh","entrypoint.sh"]
