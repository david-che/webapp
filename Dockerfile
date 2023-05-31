FROM python
MAINTAINER Docker Education Team <education@docker.com>
ADD ./webapp/requirements.txt /tmp/requirements.txt
RUN pip install -qr /tmp/requirements.txt
ADD ./webapp /opt/webapp/
WORKDIR /opt/webapp
EXPOSE 5001
CMD ["python", "app.py"]

