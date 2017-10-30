#!/bin/sh

if [ -e "dist.zip" ]; then
  echo "> Deploying app... (1/4)"
  unzip -P ${PRODUCT_KEY:?"PRODUCT_KEY is required"} dist.zip  > /dev/null
  echo "> Deploying app... (2/4)"
  tar zxvf dist.tgz > /dev/null
  rm -f dist.zip dist.tgz
  if [ -e "bin/standalone" ]; then
    echo "> Deploying app... (3/4)"
    chmod +x bin/standalone
    mkdir -p logs
  fi
  if [ -n ${TZ} ]; then
    echo "> Deploying app... (4/4)"
    rm -f /etc/localtime
    ln -s /usr/share/zoneinfo/${TZ} /etc/localtime
    echo ${TZ} > /etc/timezone
  else
    echo "> Deploying app...skipped (4/4)"
  fi
  date
fi

if [ -e "bin/standalone" ]; then
  exec bin/standalone
else
  echo "> File bin/standalone not found. Failed to start app...exit"
  exit 1
fi

