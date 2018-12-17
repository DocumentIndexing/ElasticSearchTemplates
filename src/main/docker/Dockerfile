FROM alpine:3.8
RUN apk add --no-cache curl

COPY /maven/templates/* /app/templates/
COPY /maven/scripts/* /app/scripts/

RUN chmod u+x /app/scripts/*.sh
CMD ["/app/scripts/run.sh"]