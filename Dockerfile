FROM alpine:3.12

COPY fetch_and_push /etc/periodic/hourly

RUN apk --no-cache add	\
	bash		\
	curl		\
	jq &&		\
    chmod +x /etc/periodic/hourly/fetch_and_push

ENTRYPOINT ["crond", "-f"]
