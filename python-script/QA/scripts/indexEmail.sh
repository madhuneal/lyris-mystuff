#!/usr/bin/env bash

CORE=$(ls /opt/lyris/core/core-1*.jar)
HADOOP=hadoop
MAIN=com.lyris.service.process.EmailByHourIndexingRunner


echo ${HADOOP} jar ${CORE} ${MAIN} $*
${HADOOP} jar ${CORE} ${MAIN} $*

