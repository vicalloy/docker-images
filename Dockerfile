# syntax=docker/dockerfile:experimental
FROM python:3.10

ARG xx=hello
ARG bb

RUN echo ${xx}
RUN echo ${bb}
