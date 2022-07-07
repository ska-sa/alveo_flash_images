# Alveo Board Support Packages

## Purpose

This repository contains the scripts to generate the vivado design that is used to compile the board support firmware. The bitstream generated from this project is loaded on to the cards flash memory.

This design also serves as the infrastructure into which [Matlab/Simulink toolflow](www.github.com/ska-sa/mlib_devel) designs are connected.


## Vivado Setup

Please ensure that you have at Vivado 2021.1 installed and the correct board files for your hardware, otherwise the project generation will fail. You will need to sign up with Xilinx for access to the Alveo Vivado files before being able to download them.

AU50 - board files v1.3
AU280 - board files v1.1

[Alveo board files](https://www.xilinx.com/member/alveo-vivado.html)


## Project and Bitfile Generation

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

Alternatively you can generate the project and bitfiles from the command-line with the following command:
```bash
vivado -mode batch -source au50_bsp.tcl
```

## Programming

Open the Vivado hardware manager and open the target.


## Misc Notes

The flash on the AU50 consists of a golden image at 0x0 and the flash images from 0x01002000. When the mcs file is uploaded it will need to be at this address. The golden image is write protected and is fallen back to if the flash image fails to load.

The flash image needs to be small enough to load in the time that the PCIe spec requires, so that the host can enumerate the card on the PCIe bus. Images that are too large can cause the card not to enumerate.

The max size of the BAR is dependant on the host machine, this current

PCIe is not designed to be hot swapable, the size of the BAR is determined on host startup. This means that the memory space allocated at startup is the max memory that can be accessed by any subsiquent firmware uploaded. 