FROM bitnami/minideb:latest

# Build arguments passed into the docker command for image metadata
ARG BUILD_DATE
ARG COMMIT
ARG BRANCH

# Install Base Packages
RUN \
 install_packages \
	bash \
	curl \
    git

COPY requirements.txt /requirements.txt

COPY . /static-server/

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/jsfillman/static-server.git" \
      org.label-schema.vcs-ref=$COMMIT \
      org.label-schema.schema-version="1.0.0-rc1" \
      us.kbase.vcs-branch=$BRANCH  \
      maintainer="JS Fillman jsfillman@lbl.gov"


ENV COMMIT_SHA=${COMMIT}

WORKDIR /static-server
ENTRYPOINT ["sleep", "14d"]
