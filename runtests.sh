#!/bin/bash

# Based on the CentOS t_functional tests. Should be +/- compatible!
# See https://github.com/CentOS/sig-core-t_functional/blob/master/runtests.sh

# The only change: generation of fake junit xml so tests can be shown in Jenkins
# expected second argument: the directory where junit xml files should be generated

echo -e "\n[+] `date` -> QA $0 starting."

LIB_FUNCTIONS='./tests/0_lib/functions.sh'

# Human friendly symbols
export readonly PASS=0
export readonly FAIL=1
# set debug level of yum install in t_InstallPackage
export YUMDEBUG=0

export JUNIT_XML_PATH=$2
export JUNIT_XML_DEBUG=1


[ -f $LIB_FUNCTIONS ] && source $LIB_FUNCTIONS || { echo -e "\n[+] `date` -> Unable to source functions library. Cannot continue\n"; exit $FAIL; }

# exit as soon as any script returns a non-zero exit status
set -e

# exit on undefined variables
set -u

if [ $# -gt 0 ]; then
  t_Process <(/usr/bin/find ./tests/0_*/ -type f|sort -t'/' )
  t_Process <(/usr/bin/find ./tests/$1/ -type f|sort -t'/' )
else
  echo "You need to specify the package that has to be tested"
  exit $FAIL;
fi
t_Log "QA t_functional tests finished."
exit 0  