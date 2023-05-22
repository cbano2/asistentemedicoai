FROM python

WORKDIR .

COPY . .
RUN pip3 install -r requirements.txt


CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0","--port=7000"]
