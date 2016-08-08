FROM python:2-onbuild
ADD . /app
WORKDIR /app
ENV FLASK_APP=app.py
ENV PYTHONPATH=/app
ENV PORT=5000
EXPOSE 5000
RUN pip install -r requirements.txt
CMD gunicorn --bind 0.0.0.0:$PORT wsgi 

# docker run -it --rm -p 5000:5000 darwinrest flask run --host=0.0.0.0