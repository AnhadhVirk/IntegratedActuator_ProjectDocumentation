# NervTech LaTeX Document Classes

This package contains three NervTech-branded LaTeX classes for the Integrated Robotic Actuator project.

## Classes

| Class | Use case | Example file |
|---|---|---|
| `nervtech-engdoc.cls` | Engineering technical design documents, requirements, verification plans, interfaces, BOMs, and safety notes | `nervtech-engdoc-example.tex` |
| `nervtech-research.cls` | Preliminary research documents, evidence maps, assumptions, research questions, hypotheses, and early design direction | `nervtech-research-example.tex` |
| `nervtech-overview.cls` | Non-technical project overviews for stakeholders, collaborators, mentors, and portfolio reviewers | `nervtech-overview-example.tex` |

## Recommended compiler

Use XeLaTeX for the cleanest typography.

```bash
xelatex nervtech-research-example.tex
xelatex nervtech-research-example.tex
```

In Overleaf: `Menu -> Compiler -> XeLaTeX`.

## Basic usage

Put the `.cls` file in the same folder as your `.tex` file.

### Preliminary research document

```latex
\documentclass[internal]{nervtech-research}

\nervsetup{
  company={NervTech},
  project={Integrated Robotic Actuator},
  document={Preliminary Research Note},
  docid={NT-IRA-RES-001},
  revision={A},
  status={Exploratory Draft},
  author={NervTech Research}
}

\begin{document}
\maketitle
\tableofcontents
\newpage

\section{Research Snapshot}
...

\end{document}
```

### Non-technical project overview

```latex
\documentclass[public]{nervtech-overview}

\nervsetup{
  company={NervTech},
  project={Integrated Robotic Actuator},
  document={Non-Technical Project Overview},
  docid={NT-IRA-OVR-001},
  revision={A},
  status={Draft Brief},
  audience={Non-technical stakeholders}
}

\begin{document}
\maketitle
\tableofcontents
\newpage

\section{Project Snapshot}
...

\end{document}
```

## Classification options

Use one of:

```latex
\documentclass[public]{nervtech-overview}
\documentclass[internal]{nervtech-research}
\documentclass[confidential]{nervtech-engdoc}
```

You can also add `draft` or `watermark`:

```latex
\documentclass[internal,draft,watermark]{nervtech-research}
```

## Research class helpers

```latex
\begin{researchquestion}[System Direction]
...
\end{researchquestion}

\begin{hypothesisbox}[Architecture]
...
\end{hypothesisbox}

\begin{evidencetable}
\evidencerow{Claim}{Evidence / Observation}{Source}{Confidence}
\end{evidencetable}

\begin{assumptiontable}
\assumptionrow{Assumption}{Why it matters}{Validation method}{Owner}
\end{assumptiontable}
```

## Overview class helpers

```latex
\begin{overviewbox}[Plain-Language Summary]
...
\end{overviewbox}

\begin{valuebox}[Project Value]
...
\end{valuebox}

\begin{milestonetable}
\milestonerow{Milestone}{Meaning}{Target}{Status}
\end{milestonetable}

\begin{roadmaptable}
\roadmaprow{Phase}{Focus}{Visible Output}
\end{roadmaptable}
```

## Notes

- The classes use a NervTech black, cyan, blue, and violet visual identity.
- The title pages have been rendered and visually checked to avoid clipped title text or overlap with the colour bars.
- Keep each `.cls` file beside the `.tex` file unless you install it into your local TeX tree.
