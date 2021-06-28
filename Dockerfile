FROM alpine
RUN apk --no-cache add	\
	bash				\
	curl				\
	jq

WORKDIR /app
COPY fetch_and_push.sh /app

ENTRYPOINT ["./fetch_and_push.sh"]
