FROM python:3.8

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY . /app
WORKDIR /app
RUN pip install -r requirement.txt
RUN chmod +x entrypoint.sh
ENTRYPOINT ["sh","entrypoint.sh"]
