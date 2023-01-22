# **Instant-NGP-Tool**

Based on [torch-ngp](https://github.com/ashawkey/torch-ngp) by *Ashawkey*

[Oryginal instant-ngp paper](https://nvlabs.github.io/instant-ngp/assets/mueller2022instant.pdf)

### **Overview**

This repository contains dockerized tool for NeRF's and SDF's generation.

### **Instalation**

System requirements:
- docker
- cuda >= 11.7

Build base docker image before first run:
```
cd ~/instant-ngp-tool/
sudo ./setup.sh
```

### **Run demo**

Example script. Downloads sample data and runs training both for NERF and SDF.
```
sudo ./demo.sh
```
Demo should generate the following output:


### **Run**

You can convert any suitable file you want into NeRF or SDF
```
sudo ./run.sh <'nerf' or 'sdf'> <path to file you want to convert>
```