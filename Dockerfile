FROM okteto/okteto:1.10.5

COPY entrypoint.sh /entrypoint.sh

RUN chmod 777 /entrypoint.sh

RUN addgroup -S runner-user --gid 1009 && adduser -S runner-user -G runner-user --uid 1009
USER runner-user

ENTRYPOINT ["/entrypoint.sh"] 
