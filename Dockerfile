FROM python:2-onbuild
ADD . /app
WORKDIR /app
ENV FLASK_APP=app.py
ENV PYTHONPATH=/app
EXPOSE 5000
RUN pip install -r requirements.txt
CMD gunicorn --bind 0.0.0.0:$PORT wsgi

# docker run -p 5000:5000 -e PORT=5000 darwinrest