<div align="center">

# IT_CyberCrimeAnalysis

### Cybercrime Trends in India (2020–2024)

**A descriptive data-visualisation project using R and NCRB statistics**

![Language](https://img.shields.io/badge/Language-R-blue)
![Period](https://img.shields.io/badge/Study%20Period-2020%E2%80%932024-6f42c1)
![Analysis](https://img.shields.io/badge/Analysis-Descriptive%20Visualisation-2ea44f)

</div>

---

## 📌 Overview

**IT_CyberCrimeAnalysis** examines registered cybercrime cases in India over the five-year period from **2020 to 2024**. Using R, the project imports tabular data from Excel workbooks, reshapes the data for analysis, and produces visualisations based on statistics published by the **National Crime Records Bureau (NCRB)**.

The project is intended to make year-wise and category-wise patterns easier to explore. Its accompanying report material discusses national trends, geographical differences, offence classifications, selected cybercrime categories, cases involving women and children, and cases pending investigation.

> **Scope note:** The project material describes a broader set of analyses than the four R scripts currently supplied. This README distinguishes between analyses discussed in the report and visualisations implemented in the available scripts.

## 📑 Contents

- [Project Purpose](#-project-purpose)
- [Analysis Coverage](#-analysis-coverage)
- [Technologies and Dependencies](#-technologies-and-dependencies)
- [Repository Structure](#-repository-structure)
- [Data Requirements](#-data-requirements)
- [Installation and Setup](#-installation-and-setup)
- [Running the Scripts](#-running-the-scripts)
- [Visualisation Outputs](#-visualisation-outputs)
- [Interpretation and Scope](#-interpretation-and-scope)
- [Testing](#-testing)
- [Limitations and Future Improvements](#-limitations-and-future-improvements)
- [Contributing](#-contributing)
- [License](#-license)
- [References and Acknowledgements](#-references-and-acknowledgements)
- [Project Ownership](#-project-ownership)

## 🎯 Project Purpose

The purpose of this project is to present NCRB cybercrime statistics in a visual format that supports comparison across years and categories.

The analysis is **descriptive**. It identifies patterns and differences in the supplied data; it does not establish the causes of those patterns, measure the full extent of unreported cybercrime, or predict future case counts.

## 📊 Analysis Coverage

The accompanying project notes and report discuss the following areas:

| No. | Area of analysis | Description |
|:---:|---|---|
| 1 | National trend | Annual registered cybercrime cases across India from 2020 to 2024. |
| 2 | State/UT comparison | Year-wise cases for the ten States/UTs selected by cumulative registered cases over the period. |
| 3 | Metropolitan-city comparison | Year-wise cases for the ten selected metropolitan cities. |
| 4 | Offence classification | Comparison of offences recorded under the IT Act, IPC/BNS and Special and Local Laws (SLL). |
| 5 | Selected cybercrime heads | A year-by-category heatmap covering seven selected cybercrime heads. |
| 6 | Cases involving women and children | Comparison of reported case counts for the two groups. |
| 7 | Pending investigation | State-wise comparison of cybercrime cases pending investigation. |

### Visualisations implemented in the supplied R scripts

| Script | Visualisation | Input workbook and expected layout |
|---|---|---|
| `Graph_1.R` | Line graph of national annual registered cases | `cyber_crime_data.xlsx`; reads range `A1:B6` containing `Year` and `Cases`. |
| `Graph3.R` | Grouped bar chart by crime head and year | `crime_type_data.xlsx`, worksheet 1; includes `Crime Head` and year columns `2020`–`2024`. |
| `graph3.2.R` | Grouped bar chart by category and year | `crime_type_data.xlsx`, worksheet 2; first column contains the category and remaining columns contain year values. |
| `Graph2.1.R` | Heatmap of cybercrime heads by year | `crime_head_data.xlsx`; includes `Crime Head` and year columns `2020`–`2024`. |
| `Top_10_ State_UTs_ Cyber_Crime_Cases_2020_to_2024.R` | Line graph of the ten States/UTs with the highest five-year totals | `NCRB_Cyber_Crime_State_UT_2020_2024.xlsx`; worksheet `All_State_UT_Data`, with `State/UT`, year columns and `Five_Year_Total_2020_2024`. |
| `Top_10_ Metropolitan_Cities_Cyber_Crime_Cases_2020_to_2024.R` | Line graph of the ten metropolitan cities with the highest five-year totals | `NCRB_Metropolitan_City_Cyber_Crime_2020_2024.xlsx`; worksheet `All_19_Cities`, with `City`, year columns and `Five_Year_Total`. |
| `pending cases.R` | Grouped horizontal bar chart of pending cybercrime cases by state and year | The state/year/case values are entered directly in the R script; no Excel input is read by this script. |

The state-wise, metropolitan-city and pending-investigation analyses now have executable R scripts in the repository. The women/children comparison remains described in the project notes/report material, but a corresponding executable R script was not present in the supplied project files. The notes also discuss possible forecasting; however, no forecasting model or validation workflow is included in the supplied scripts.

## 🧰 Technologies and Dependencies

| Technology / package | Purpose in the project |
|---|---|
| **R** | Data handling and visualisation. |
| `readxl` | Importing Excel workbooks. |
| `tidyverse` | Data transformation and plotting tools used by `Graph3.R`. |
| `dplyr` | Data manipulation in `Graph2.1.R`. |
| `tidyr` | Reshaping wide data into long format using `pivot_longer()`. |
| `ggplot2` | Creating line charts, grouped bar charts and the heatmap. |
| `scales` | Formatting numeric labels, including comma-separated values; also used in the new state/city plots. |

The scripts load packages individually. No `renv` lockfile, package manifest, or explicit R version requirement is included in the supplied files.

## 🗂️ Repository Structure

The following structure reflects the files supplied with the project. File names are retained as provided.

```text
IT_CyberCrimeAnalysis/
│
├── README.md
│
├── Graph_1.R                         # National year-wise line graph
├── Graph3.R                          # Grouped bar chart (Excel worksheet 1)
├── graph3.2.R                        # Grouped bar chart (Excel worksheet 2)
├── Graph2.1.R                        # Cybercrime-head heatmap
├── Top_10_ State_UTs_ Cyber_Crime_Cases_2020_to_2024.R
│                                     # Top 10 States/UTs line graph
├── Top_10_ Metropolitan_Cities_Cyber_Crime_Cases_2020_to_2024.R
│                                     # Top 10 metropolitan cities line graph
├── pending cases.R                   # State-wise pending cases chart
│
├── Pasted text.txt                   # Project graph interpretations and findings
├── Pasted text(1).txt                # Duplicate copy of the project notes
│
├── Cybercrime_Project_Report_R_Programming.docx
│                                     # Project report draft
│
├── gunjan2013.pdf                    # Related-work reference paper
├── tanwar2020.pdf                    # Related-work reference paper
└── datta2020.pdf                     # Related-work reference paper
```

**Data workbooks are not included** in the supplied project files. The scripts refer to three Excel workbooks by name; these must be obtained from the project owner or prepared from the relevant NCRB tables before the scripts can run. The two `Pasted text` files have identical contents in the supplied project folder.

## 📁 Data Requirements

The scripts expect Excel data in a **wide-table format**, with years represented as column names.

| Workbook | Used by | Expected structure |
|---|---|---|
| `cyber_crime_data.xlsx` | `Graph_1.R` | Two columns named `Year` and `Cases`; the script reads `A1:B6` (header plus five annual observations). |
| `crime_type_data.xlsx` | `Graph3.R` | Worksheet 1 contains a `Crime Head` column and year columns `2020`, `2021`, `2022`, `2023`, `2024`. |
| `crime_type_data.xlsx` | `graph3.2.R` | Worksheet 2 has a category column in the first position, followed by year columns. |
| `crime_head_data.xlsx` | `Graph2.1.R` | A column named `Crime Head` and year columns `2020`, `2021`, `2022`, `2023`, `2024`. |
| `NCRB_Cyber_Crime_State_UT_2020_2024.xlsx` | Top 10 States/UTs script | Worksheet `All_State_UT_Data`; columns `State/UT`, `2020`–`2024` and `Five_Year_Total_2020_2024`. |
| `NCRB_Metropolitan_City_Cyber_Crime_2020_2024.xlsx` | Top 10 metropolitan cities script | Worksheet `All_19_Cities`; columns `City`, `2020`–`2024` and `Five_Year_Total`. |

The scripts do not download NCRB data or independently verify the provenance and correctness of the workbooks. The project material identifies the NCRB *Crime in India* reports for 2020–2024 as the principal statistical source. For reproducibility, retain the source table, definitions and data-extraction notes alongside the prepared workbooks.

## ⚙️ Installation and Setup

### 1. Install R

Install R from the [Comprehensive R Archive Network (CRAN)](https://cran.r-project.org/). An IDE such as [RStudio](https://posit.co/download/rstudio-desktop/) may be used, but the scripts do not require a specific IDE.

### 2. Install the required packages

Run the following command in an R console:

```r
install.packages(c(
  "readxl",
  "tidyverse",
  "dplyr",
  "tidyr",
  "ggplot2",
  "scales"
))
```

### 3. Add the Excel workbooks

Place the required workbooks in a known location. The supplied scripts contain machine-specific Windows paths, such as:

```r
"D:/IT Project/crime_type_data.xlsx"
```

Update the relevant path in each script to match your local setup.

For example, if a workbook is stored in a `data/` directory inside the project folder, the import statement could be changed to:

```r
readxl::read_excel("data/cyber_crime_data.xlsx", range = "A1:B6")
```

This is an example of a path adjustment, not the path currently configured in every supplied script.

## ▶️ Running the Scripts

After installing the dependencies and updating the workbook paths, run the scripts from RStudio or an R console.

```r
source("Graph_1.R")
source("Graph3.R")
source("graph3.2.R")
source("Graph2.1.R")
source("Top_10_ State_UTs_ Cyber_Crime_Cases_2020_to_2024.R")
source("Top_10_ Metropolitan_Cities_Cyber_Crime_Cases_2020_to_2024.R")
source("pending cases.R")
```

Each script imports its corresponding workbook and constructs a `ggplot` visualisation. The plots are displayed through the active R graphics device.

### Input column expectations

- **`Graph_1.R`** converts `Year` and `Cases` to numeric values before plotting the annual series.
- **`Graph3.R`** pivots the five year columns into `Year` and `Offences`, using `Crime Head` as the fill grouping.
- **`graph3.2.R`** pivots all columns except the first into `Year` and `Cases`, then renames the first column `Category`.
- **`Graph2.1.R`** renames `Crime Head` to `Crime_Head`, pivots the five year columns into `Year` and `Incidents`, and maps incident counts to the heatmap fill scale.
- **Top 10 States/UTs script** sorts the input by `Five_Year_Total_2020_2024`, selects the ten highest rows, reshapes the annual values and plots one line per State/UT.
- **Top 10 metropolitan cities script** sorts by `Five_Year_Total`, selects the ten highest cities, reshapes the annual values and plots one line per city.
- **`pending cases.R`** constructs a data frame from values embedded in the script and plots state-wise pending-case counts, grouped by year. It does not import an Excel workbook.

Ensure that workbook sheet names, column names and layouts match these expectations. If the source workbook differs, update the import or transformation code accordingly.

## 🖼️ Visualisation Outputs

The supplied scripts create the following plot types:

- **Line chart:** national year-wise registered cybercrime cases, with annual values labelled.
- **Grouped bar charts:** comparisons of crime heads or categories across the years.
- **Heatmap:** intensity of selected cybercrime heads across the five-year period.
- **State/UT line chart:** annual cases for the ten States/UTs ranked by five-year total.
- **Metropolitan-city line chart:** annual cases for the ten cities ranked by five-year total.
- **Pending-cases grouped bar chart:** state-wise counts pending investigation across 2020–2024.

The original four scripts do not consistently save plot files automatically; `Graph2.1.R` contains a commented-out `ggsave()` example. The three newly added scripts call `ggsave()` and save PNG files in the current working directory:
- `Top10_Cyber_Crime_Line_Plot.png`
- `Top10_Metropolitan_City_Cyber_Crime.png`
- `Pending_Cyber_Crime_Graph.png` To save a plot, assign the `ggplot` result to an object and use `ggsave()`.

For example:

```r
ggplot2::ggsave(
  filename = "output_plot.png",
  plot = plot_object,
  width = 10,
  height = 6,
  dpi = 300
)
```

This is a general usage example; the supplied scripts currently build plots directly rather than assigning each plot to a named object.

## 🔎 Interpretation and Scope

The accompanying report material records an increase in national registered cases from **50,035 in 2020** to **101,928 in 2024**. It also discusses differences across selected States/UTs and metropolitan cities, offence classifications, seven selected cybercrime heads, cases involving women and children, and pending investigations.

Interpret the figures in the context of the categories and reporting framework used by the source:

- Registered cases should not be treated as a complete count of all cybercrime incidents or victims.
- The heatmap covers seven selected categories, not every cybercrime head.
- Pending investigation figures represent case workload carried forward and should not be confused with newly registered cases.
- Comparisons involving IPC/BNS classifications require care because the project notes identify a legal-code transition during 2024.

The project is descriptive. Its visualisations show changes and differences in recorded data; they do not establish causes, quantify under-reporting, or demonstrate the effectiveness of law-enforcement responses.

## 🧪 Testing

No automated tests, test fixtures or test framework are included in the supplied files.

A basic manual verification process is:

1. Confirm that each required workbook exists at the path configured in its script.
2. Verify that the expected worksheet and column names are present.
3. Run the script and confirm that the plot renders without import or transformation errors.
4. Compare the plotted labels and values with the corresponding source table.

## 🚧 Limitations and Future Improvements

### Current limitations

- The Excel input workbooks are not included in the supplied project files.
- Several workbook-based scripts use absolute, machine-specific Windows file paths that must be updated on another machine. The pending-cases script instead embeds its data directly in the source code.
- Seven visualisation workflows have corresponding scripts in the supplied set. The women/children comparison discussed in the report still has no corresponding executable script in the supplied set.
- Plot saving is not consistent across all scripts: the three newly added scripts save PNG files, while the earlier scripts generally display plots without saving them automatically.
- No dependency lockfile, automated test suite or documented data-cleaning/validation pipeline is included.
- No forecasting model is implemented in the supplied scripts.

### Possible extensions

- Include the source Excel workbooks or document a reproducible data-preparation process, subject to the source data's redistribution terms.
- Replace machine-specific paths with project-relative paths and centralise file locations.
- Add scripts for the state-wise, city-wise, women/children and pending-investigation analyses described in the report.
- Save plots to a consistent `output/` directory and include generated figures where appropriate.
- Add data validation checks for missing values, numeric fields, year columns and category labels.
- If forecasting is pursued, document the selected time-series method, assumptions, training period and validation results separately from the descriptive visualisations.

## 🤝 Contributing

Contributions that improve reproducibility, clarity or correctness are welcome.

Before submitting changes:

1. Keep data definitions and source references explicit.
2. Do not change category labels or year values without documenting the reason.
3. Check that scripts run against the documented workbook structure.
4. Update the usage notes when adding a script or dependency.
5. Do not commit sensitive or restricted data. Confirm the applicable NCRB/source-data terms before redistributing datasets.

For an academic submission, coordinate substantive changes with the project owner before finalising the report and figures.

## 📄 License

No license file or explicit licensing statement was present in the supplied project files. Until the project owner adds a license, the repository should be treated as **all rights reserved**. Do not assume that the code, report or included papers may be reused or redistributed.

## 📚 References and Acknowledgements

The project material identifies the following sources:

1. **National Crime Records Bureau (NCRB), Ministry of Home Affairs, Government of India.** *Crime in India* reports for 2020, 2021, 2022, 2023 and 2024.
2. **V. K. Gunjan, A. Kumar and S. Avdhanam (2013).** “A Survey of Cyber Crime in India.”
3. **S. Tanwar, T. Paul, K. Singh, M. Joshi and A. Rana (2020).** “Classification and Impact of Cyber Threats in India: A Review.” 8th International Conference on Reliability, Infocom Technologies and Optimization (ICRITO).
4. **P. Datta, S. N. Panda, S. Tanwar and R. K. Kaushal (2020).** “A Technical Review Report on Cyber Crimes in India.” International Conference on Emerging Smart Computing and Informatics (ESCI).
5. **R Core Team.** *R: A Language and Environment for Statistical Computing.* R Foundation for Statistical Computing.

The included PDF papers serve as supporting literature; they are not datasets used by the plotting scripts. Full bibliographic details, including page ranges and persistent identifiers where applicable, should be verified against the published versions before formal citation.


**Cybercrime Trends in India | 2020–2024**

*An R-based descriptive visualisation of NCRB cybercrime statistics.*

</div>
