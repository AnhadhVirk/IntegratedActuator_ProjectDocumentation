# NervTech Integrated Actuator Project

This repository displays the documentation and design of the **NervTech Node project**, a Quasi-Direct-Drive (QDD) integrated actuator that provides versatile, precise, and reliable torque control.

## Quick Start: Where to Begin

**New to this project?** Start here:

1. **Read the Project Overview**: Start with [`NT/N/OVR/NT-N-OVR-000_A.pdf`](NT/N/OVR/NT-N-OVR-000_A.pdf) for a high-level understanding of the project goals, architecture, and current progress.
2. **Explore the Technical Documentation**: Browse [`NT/N/`](NT/N/) for compiled PDF documents organized by component (Motor Housing, Cycloidal Reducer, etc.).
3. **Review Source Documentation**: Detailed LaTeX source files and research can be found in [`Node_v0/`](Node_v0/) organized by topic.
4. **CAD & SolidWorks Files**: All original SolidWorks design files are available in the [GitHub repository releases section](https://github.com/AnhadhVirk/NervTech_ProjectDocumentation/releases).

---

## Overview

NervTech is a student group developing open-source designs in robotics to apply and explore research in Control and Reinforcement Learning. The NervTech Node project will provide the base component for future robotic platforms, such as multi-DOF arms and quadruped platforms.

### Project Goals

The main goals, as outlined in the Project Overview document (NT-N-OVR-000), are:

- High precision in torque and position control
- Versatility in integration to a variety of mechanical structures
- Minimal latency in communications with other nodes and compute systems
- Industrial safety features
- Durable and reliable for long-term use

The project aims to document and produce artifacts for every stage of the design process, from requirements specifications to CAD to simulations and finally to manufacturing.

### Current Progress

The project is currently in the **CAD design stage**. Requirements have been propagated from goals, and the CAD is nearly ready for import to MATLAB for simulation and analysis. Cycloidal reducer design and CAD is still to be finalised.

---

## Key Features & Architecture

The Node project requires a combined software, mechanical, and electrical design process.

### Mechanical Design

The mechanical architecture is based around a **frameless BLDC motor** with:
- Integrated stator and rotor into the housing
- 9:1 speed reducer downstream (Quasi-Direct-Drive configuration)
- **Cycloidal speed reducer** chosen for its ability to withstand large shocks and provide minimal backlash
- Standardized mounting pattern on the output flange for integration into various robotic platforms

### Electrical Architecture (TBD)

The electrical architecture will include:
- Power distribution and FOC (Field-Oriented Control)
- Sensing and communication via CAN or EtherCAT
- Optical encoder laser ring for position feedback
- Dedicated control board with all signal conditioning and power electronics
- FPGA integration to maintain ultra-low latency control loops

### Software Architecture (TBD)

The software architecture will use:
- **FreeRTOS** for resource and thread management on the MCU
- **HDL** for FPGA operations in FOC control
- FPGA operations: inverse Park and Clarke transforms, encoder calculations, ADC filtering
- MCU sends torque commands via Dual-Port RAM interface

---

## Repository Directory Structure

```text
NervTech_Documentation/
├── README.md                           (this file)
│
├── NT/                                 (Compiled PDF artifacts & images)
│   └── N/
│       ├── CR/                         (Cycloidal Reducer - Research)
│       │   └── NT-N-CR-000.pdf
│       ├── MH/                         (Motor Housing - Research, Design & CAD)
│       │   ├── NT-N-MH-000.pdf         (Research)
│       │   ├── NT-N-MH-001.pdf         (Technical Design)
│       │   ├── NT-N-MH-002_NODE_DWG.PDF
│       │   ├── NT-N-MH-003_ROTOR_CUP.pdf
│       │   └── NT-N-MH-004_STATOR_HOUSING.pdf
│       ├── OVR/                        (Project Overview)
│       │   └── NT-N-OVR-000_A.pdf      (START HERE)
│       └── P/                          (Technical Photographs & Images)
│           ├── NT-N-P001.png
│           └── NT-N-P002.png
│
├── Node_v0/                            (LaTeX source files and research)
│   ├── ProjectOverview/                (Project overview source & LaTeX files)
│   │   ├── NT-N-OVR-000.tex
│   │   └── figures/
│   │
│   ├── Research/                       (Preliminary research & architecture exploration)
│   │   ├── CycloidalSpeedReducerResearch/
│   │   │   ├── NT-N-CR-000.tex
│   │   │   └── figures/                (Cycloidal curve analysis, design exploration)
│   │   └── MotorHousingResearch/
│   │       ├── NT-N-MH-000.tex
│   │       └── figures/                (Motor housing research & analysis)
│   │
│   └── TechnicalDesigns/               (Design calculations & CAD documentation)
│       └── MotorHousingDesign/
│           ├── NT-N-MH-001.tex         (Technical design mathematics)
│           ├── NT-N-MH-001.pdf
│           └── figures/                (Design diagrams & analysis)
│
├── Classes/                            (LaTeX custom document classes)
│   ├── nervtech-engdoc.cls             (Engineering documentation class)
│   ├── nervtech-overview.cls           (Project overview class)
│   └── nervtech-research.cls           (Research document class)
│
└── .vscode/                            (VS Code configuration for LaTeX editing)
    ├── latexindent.yaml
    └── settings.json
```

---

## Directory Descriptions

### **NT/** - Compiled Artifacts (📄 Final Deliverables)
Contains the final PDF and image artifacts generated from LaTeX source files. Organized by component and document type. This is the primary directory for reviewing completed documentation.

**Subdirectories:**
- **CR/** - Cycloidal Reducer research documents
- **MH/** - Motor Housing research, design, and CAD drawings
- **OVR/** - Project Overview (high-level introduction)
- **P/** - Technical photographs and reference images

### **Node_v0/** - Source Files (🔧 Development & Research)
Contains LaTeX source files, research documents, and all working materials. Use this directory to understand the design rationale and modify documentation.

**Subdirectories:**
- **ProjectOverview/** - LaTeX source for the project overview document
- **Research/** - Preliminary research and design exploration
  - *CycloidalSpeedReducerResearch/* - Mathematical analysis and research on cycloidal gear design
  - *MotorHousingResearch/* - Motor housing requirements, design constraints, and market analysis
- **TechnicalDesigns/** - Detailed design calculations and engineering analysis
  - *MotorHousingDesign/* - Complete technical design with FEA, stress analysis, and CAD documentation

### **Classes/** - LaTeX Styling
Custom LaTeX document classes used consistently across all documentation. These ensure visual and structural consistency across the project.

- **nervtech-engdoc.cls** - Standard engineering documentation format
- **nervtech-overview.cls** - Project overview and summary format
- **nervtech-research.cls** - Research and exploratory document format

### **SolidWorks CAD Files**
All original SolidWorks design files (.SLDPRT, .SLDASM, .SLDDRW) are available in the [GitHub repository releases section](https://github.com/AnhadhVirk/NervTech_ProjectDocumentation/releases). Download them to access the complete 3D models and assemblies.

---

## Document Naming Convention

Documents follow the naming scheme: `NT-[SUBSYSTEM]-[TYPE]-[NUMBER]`

- **NT** = NervTech project identifier
- **[SUBSYSTEM]** = N (Node)
- **[TYPE]** = CR (Cycloidal Reducer), MH (Motor Housing), OVR (Overview), P (Photographs)
- **[NUMBER]** = Sequential numbering (000, 001, etc.)

**Examples:**
- `NT-N-OVR-000` = NervTech Node Project Overview
- `NT-N-CR-000` = NervTech Node Cycloidal Reducer Research
- `NT-N-MH-001` = NervTech Node Motor Housing Design

---

## How to Use This Repository

1. **For Project Overview**: Read [`NT/N/OVR/NT-N-OVR-000_A.pdf`](NT/N/OVR/NT-N-OVR-000_A.pdf)
2. **For Technical Details**: Review the PDF files in [`NT/N/`](NT/N/) corresponding to your area of interest
3. **For Source Modification**: Edit LaTeX files in [`Node_v0/`](Node_v0/) and regenerate PDFs
4. **For CAD Models**: Download SolidWorks files from the [GitHub releases section](https://github.com/AnhadhVirk/NervTech_ProjectDocumentation/releases)
5. **For Styling**: Refer to LaTeX classes in [`Classes/`](Classes/) when creating new documentation

---

## Contributing

To contribute to the NervTech documentation:

1. Use the provided LaTeX classes in `Classes/` for consistency
2. Follow the naming convention outlined above
3. Place source files in appropriate subdirectories under `Node_v0/`
4. Generate PDFs and place them in the corresponding directory under `NT/N/`
5. Update this README if adding new document types or directories

---

## License & Attribution

This is an open-source student project. All design artifacts and documentation are made available for educational and research purposes.
