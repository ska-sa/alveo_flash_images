# Alveo Board Support Packages

## Purpose

This repository contains the scripts to generate the vivado design that is used to compile the board support firmware. The bitstream generated from this project is loaded on to the cards flash memory.

This design also serves as the infrastructure into which [Matlab/Simulink toolflow](www.github.com/ska-sa/mlib_devel) designs are connected.


## Configuration

Please ensure that you have at Vivado 2021.1 installed and the correct board files for your hardware, otherwise the project generation will fail. You will need to sign up with Xilinx for access to the Alveo Vivado files before being able to download them.

[Alveo board files](https://www.xilinx.com/member/alveo-vivado.html)


## Project Generation

Change directory into the Alveo card folder you would like to target. eg au50_bsp

Source the settings64.sh script in your Vivado install directory (edit the following command):

```bash
source /<xilinx install directory>/Vivado/2021.1/settings64.sh
```

Start vivado:
```bash
vivado
```

In the tcl command-line run:
```bash
"source au50_bsp.tcl"
```

Alternatively you can generate the project from the command-line with the following command:
```bash
vivado -mode batch -source au50_bsp.tcl
```
