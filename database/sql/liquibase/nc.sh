#!/bin/bash
# ============LICENSE_START====================================================
#  Copyright (C) 2021. Nordix Foundation. All rights reserved.
# =============================================================================
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
# ============LICENSE_END======================================================

if [ $# -lt 2 ]; then
    echo "nc.sh: hostname port" >&2
    exit 1
fi

host=$1
port=$2


(echo -n > /dev/tcp/$host/$port) >/dev/null 2>&1
result=$?

if [ $result -eq 0 ]; then
    echo "Connection to $host $port port [tcp/postgress] succeeded!"
    exit 0
else
    echo "nc: connect to $host port $port (tcp) failed: Connection refused"
    exit 1
fi
