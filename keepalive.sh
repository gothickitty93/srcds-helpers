#!/bin/bash

echo -e "Y\n" | docker exec -i --user linuxgsm servername ./servername send null
