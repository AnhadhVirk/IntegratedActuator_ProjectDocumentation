# NervTech Integrated Actuator Project
This repository displays the documentation and design of the NervTech Node project, a Quasi-Direct-Drive integrated actuator that provides a versatile, precise and reliabile torque control.

## Overview
NervTech is a student group developing open source designs in robotics to apply and explore research in the areas of Control and Reinforcement Learning.
The NervTech Node project will provide the base component for future robotic platforms, such as multi-DOF arms and quadruped platforms. 
The main goals, as outlined by the Project Overview document (NT-N-OVR-000) are as follows:
+ High precision in torque and position control.
+ Versatility in integration to a variety of mechanical structures.
+ Minimal latency in communications with other nodes, and compute.
+ Industrial safety features.
+ Durable and reliable for long term use.

The project will aim to document and produce artefacts for every stage of the design process, from requirements specifications to CAD to simulations and finally to manufacturing.

### Current Progress
The project is currently in the CAD design stage. Requirements have been propogated from goals, and the CAD is almost ready for import to Matlab.

## Key Features
The Node project will require a combined software, mechanical and electrical design process. 

### Mechanical
The Mechanical architecture of the Node project will be based around a frameless BLDC motor.
The stator and rotor are integrated into the housing and feed into a 9:1 speed reducer, in accordance with other QDD architectures.
A cycloidal speed reducer was chosen due to its ability to withstand large shocks and provide minimal backlash.
The mounting pattern on the output flange of the actuator matched the mounting pattern on the base, providing standardisation when mounting to frames.

### Electrical (TBD)
The Electrical architecture will include power distribution, FOC control, sensing and communication (including telemetry) through CAN or EtherCAT.
The PCBs will be divided into the optical encoder laser ring, which will be mounted to be axially alongside the encoder ring, and the control board, which includes all other functionalities.
An FPGA will be used to maintain ultra-low latency control loops onboard the motors.

### Sodtware (TBD)
The Software architecture will use FreeRTOS for resource and thread management onboard the MCU, and HDL for FPGA operations for FOC control. 
The FPGA operations will include inverse Park and Clarke transforms, encoder calculations and ADC filtering, while the MCU will send Torque commands via a Dual-Port RAM interface.

## Repository Directory Structure
