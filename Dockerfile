#ARG BUILD_FROM
#FROM $BUILD_FROM

FROM python:3-alpine

# Install requirements for add-on

RUN apk add --no-cache python3 py3-requests py3-pip py3-paho-mqtt

RUN pip3 install requests urllib3 paho-mqtt

# Copy data for add-on
COPY run.sh /
COPY envoy_to_mqtt_json.py /
COPY data /data/

RUN chmod a+x /run.sh


CMD [ "sh", "/run.sh" ]
