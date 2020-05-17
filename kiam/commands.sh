#!/bin/bash
kubectl annotate --overwrite namespace kube-system "iam.amazonaws.com/permitted=.*"
