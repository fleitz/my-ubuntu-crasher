#!/bin/bash
if [ "$DEBUG" != "" ]; then
   echo 0 > /proc/sys/kernel/yama/ptrace_scope
   if [ $? -eq 1 ]; then
      echo "Run Docker with --privileged"
      exit 1
   fi
   strace -f ${OUT_DIR}/${MODULE_NAME}
   echo "Waiting for crash to upload..."
   sleep 5;
   exit 1
fi
${OUT_DIR}/${MODULE_NAME}