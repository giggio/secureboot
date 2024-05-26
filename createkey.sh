#!/bin/bash

# see https://ubuntu.com/blog/how-to-sign-things-for-secure-boot
openssl req -config ./openssl.cnf -new -x509 -newkey rsa:2048 -nodes -days 36500 -outform DER -keyout "MOK.priv" -out "MOK.der"