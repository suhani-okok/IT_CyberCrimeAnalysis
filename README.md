# IT_CyberCrimeAnalysis
Cybercrime Trends in India (2020–2024)
A descriptive data-visualisation project that examines registered cybercrime cases in India over the five-year period from 2020 to 2024. The project uses R to import tabular data from Excel workbooks, reshape it for analysis, and create line charts, grouped bar charts, and a heatmap based on National Crime Records Bureau (NCRB) statistics.

The accompanying project material discusses national trends, geographical differences, offence classifications, selected cybercrime categories, cases involving women and children, and cases pending investigation. The R scripts currently included in this repository implement a subset of those visualisations; see Analysis coverage for the distinction.
Contents
- Purpose
- Analysis coverage
- Technologies and dependencies
- Repository structure
- Data requirements
- Installation and setup
- Running the scripts
- Outputs
- Interpretation and scope
- Testing
- Limitations and possible extensions
- Contributing
- License
- References and acknowledgements
- Project ownership
Purpose
The purpose of the project is to make NCRB cybercrime statistics easier to examine by presenting annual counts and category-wise comparisons in graphical form. The analysis is descriptive: it highlights patterns in the supplied data and does not, by itself, establish why those patterns occurred or predict future values.
Analysis coverage
The project notes and report describe the following areas of analysis:
1. National trend: annual registered cybercrime cases across India from 2020 to 2024.
2. State/UT comparison: year-wise cases for the ten States/UTs selected by cumulative registered cases over the period.
3. Metropolitan-city comparison: year-wise cases for the ten selected metropolitan cities.
4. Offence classification: comparison of offences recorded under the IT Act, IPC/BNS and Special and Local Laws (SLL).
5. Selected cybercrime heads: a year-by-category heatmap covering seven selected cybercrime heads.
6. Cases involving women and children: comparison of the reported case counts for the two groups.
7. Pending investigation: state-wise comparison of cybercrime cases pending investigation.
What the supplied R scripts implement
Script	Implemented visualisation	Input expected by the script
Graph_1.R	Line graph of national annual registered cases	cyber_crime_data.xlsx, range A1:B6
Graph3.R	Grouped bar chart by crime head and year	crime_type_data.xlsx, worksheet 1; columns for 2020–`2024` and Crime Head
graph3.2.R	Grouped bar chart by category and year	crime_type_data.xlsx, worksheet 2; first column is the category and remaining columns are year values
Graph2.1.R	Heatmap of cybercrime heads by year	crime_head_data.xlsx; a Crime Head column and columns for 2020–`2024`


The state-wise, city-wise, women/children and pending-investigation analyses are described in the project notes/report material, but separate executable R scripts for those plots are not present in the supplied project files. The notes also contain a discussion of possible forecasting; no forecasting model or validation workflow is included in the supplied scripts.
Technologies and dependencies
- R — programming language used for data handling and plotting.
- readxl — reads Excel workbooks.
- tidyverse — used by Graph3.R for data transformation and plotting tools.
- dplyr — data manipulation in Graph2.1.R.
- tidyr — reshapes wide data into long format using pivot_longer().
- ggplot2 — creates the line, grouped-bar and heatmap visualisations.
- scales — formatting of numeric labels in the heatmap and national trend chart (scales::comma()).
The scripts load packages individually. No renv lockfile, package manifest, or explicit R version requirement is included.
Repository structure
The following describes the files supplied with the project. File names are retained as provided.
.
├── README.md
├── Graph_1.R                         # National year-wise line graph
├── Graph3.R                          # Grouped bar chart (Excel worksheet 1)
├── graph3.2.R                        # Grouped bar chart (Excel worksheet 2)
├── Graph2.1.R                        # Cybercrime-head heatmap
├── Pasted text.txt                   # Project graph interpretations and findings
├── Pasted text(1).txt                # Duplicate copy of the project notes
├── Cybercrime_Project_Report_R_Programming.docx  # Project report draft
├── gunjan2013.pdf                    # Related-work reference paper
├── tanwar2020.pdf                    # Related-work reference paper
└── datta2020.pdf                     # Related-work reference paper
Data workbooks are not included in the supplied files. The scripts refer to three Excel workbooks by name; these must be obtained from the project owner or prepared from the cited NCRB tables before the scripts can run. The two Pasted text files have identical contents in the supplied project folder.
Data requirements
The scripts expect Excel data in a wide-table layout, with years represented as column names.
Workbook	Used by	Expected layout
cyber_crime_data.xlsx	Graph_1.R	Two columns containing Year and Cases; the script reads cells A1:B6 (five annual observations plus a header row).
crime_type_data.xlsx	Graph3.R, graph3.2.R	Worksheet 1 must include a Crime Head column and year columns 2020–`2024`. Worksheet 2 must have a category column first, followed by year columns.
crime_head_data.xlsx	Graph2.1.R	A column named Crime Head and year columns 2020–`2024`.


The scripts do not download NCRB data or verify the provenance and correctness of the workbooks. The project material identifies NCRB Crime in India reports for 2020–2024 as the principal statistical source. Retain the source table, definitions and extraction notes with the data when preparing a reproducible submission.
Installation and setup
1. Install R
Install R from the Comprehensive R Archive Network (CRAN). An IDE such as RStudio may be used, but the scripts do not require a specific IDE.
2. Install the required packages
Run the following in an R console. Installing tidyverse also installs the core packages used by that script.
install.packages(c("readxl", "tidyverse", "dplyr", "tidyr", "ggplot2", "scales"))
3. Add the Excel workbooks
Place the required workbooks in a known location. The current scripts contain machine-specific Windows paths such as D:/IT Project/crime_type_data.xlsx. Update the relevant path in each script to match your local setup, or change the scripts to use project-relative paths.

For example, if the workbook is in a data/ folder under the project directory, the import can be written as:
readxl::read_excel("data/cyber_crime_data.xlsx", range = "A1:B6")
This is an example of a path adjustment, not the current path configured in the supplied scripts.
Running the scripts
Run each script from RStudio or from an R console after installing the dependencies and updating the workbook paths. For example:
source("Graph_1.R")
source("Graph3.R")
source("graph3.2.R")
source("Graph2.1.R")
Each script reads its input workbook and constructs a ggplot object. The plots are displayed through the active R graphics device. The heatmap script includes a commented-out ggsave() example; the other scripts do not currently save plot files automatically.
Input column expectations
- Graph_1.R converts Year and Cases to numeric values and plots the annual series.
- Graph3.R pivots the five year columns into Year and Offences, and uses Crime Head as the fill grouping.
- graph3.2.R pivots all columns except the first into Year and Cases, then renames the first column Category.
- Graph2.1.R renames Crime Head to Crime_Head, pivots the five year columns into Year and Incidents, and maps the incident count to the heatmap fill scale.
Column names and worksheet layouts should match these expectations. If the source workbook differs, adjust the import or transformation code accordingly.
Outputs
The supplied scripts produce four plot types:
- a national year-wise line graph with labelled annual case counts;
- grouped bar charts comparing categories across years;
- a heatmap showing the intensity of selected cybercrime heads across years.
The plots are not written to image files by default. To save a plot, assign it to an object and use ggsave(), or adapt the commented example in Graph2.1.R. For example:
# Example pattern after assigning a ggplot to `plot_object`:
ggplot2::ggsave("output_plot.png", plot = plot_object,
                width = 10, height = 6, dpi = 300)
This is a general example; the supplied scripts currently build plots directly rather than assigning each plot to a named object.
Interpretation and scope
The accompanying report material records an increase in national registered cases from 50,035 in 2020 to 101,928 in 2024. It also describes differences across selected states and metropolitan cities, offence classifications, seven selected cybercrime heads, cases involving women and children, and pending investigations.

These figures should be interpreted as registered cases in the categories and reporting framework used by the source, not as a complete count of all cybercrime incidents or victims. The heatmap covers seven selected categories rather than every cybercrime head. Pending investigation counts represent case workload carried forward and should not be confused with newly registered cases. Comparisons involving IPC/BNS classifications also require care because the project notes identify a legal-code transition during 2024.

The project is descriptive. The visualisations can show changes and differences in the recorded data, but they do not establish causes, measure under-reporting, or demonstrate the effectiveness of law-enforcement responses.
Testing
No automated tests, test data fixtures, or test framework are included in the supplied files. A basic manual check is to:
1. confirm that each required workbook exists at the path configured in its script;
2. verify that the expected worksheet and column names are present;
3. run the script and confirm that the plot renders without import or transformation errors;
4. compare plotted labels and values with the corresponding source table.
Limitations and possible extensions
Current limitations
- The Excel input workbooks are not included in the supplied project files.
- The scripts use absolute Windows file paths that must be changed on another machine.
- The scripts cover only four visualisation workflows; several analyses described in the report do not have corresponding scripts in the supplied set.
- The plots are displayed but are not consistently saved to files by the scripts.
- There is no dependency lockfile, automated test suite, or documented data-cleaning/validation pipeline.
- No forecasting model is implemented in the supplied scripts.
Possible extensions
- Add the source Excel workbooks or provide a documented, reproducible data-preparation process, subject to the source data's redistribution terms.
- Replace machine-specific paths with project-relative paths and centralise file locations in a small configuration section.
- Add scripts for the state-wise, city-wise, women/children and pending-investigation analyses described in the report.
- Save plots to a consistent output/ directory and include generated figures in the repository where appropriate.
- Add data validation checks for missing values, numeric fields, year columns and category labels.
- If forecasting is pursued, document the chosen time-series method, assumptions, training period and validation results separately from descriptive visualisation.
Contributing
Contributions that improve reproducibility, clarity or correctness are welcome. Before submitting changes:
1. Keep data definitions and source references explicit.
2. Avoid changing category labels or year values without documenting the reason.
3. Check that scripts run against the documented workbook structure.
4. Include or update usage notes when adding a script or dependency.
5. Do not commit sensitive or restricted data. Confirm the applicable NCRB/source-data terms before redistributing datasets.
If this repository is being used for an academic submission, coordinate substantive changes with the project owner before finalising the report and figures.
License
No license file or explicit licensing statement was present in the supplied project files. Unless the project owner adds a license, the repository should be treated as all rights reserved; do not assume that the code, report or included papers may be reused or redistributed.
References and acknowledgements
The project material identifies the following sources and related-work papers:
- National Crime Records Bureau (NCRB), Ministry of Home Affairs, Government of India, Crime in India reports for 2020, 2021, 2022, 2023 and 2024.
- V. K. Gunjan, A. Kumar and S. Avdhanam, “A Survey of Cyber Crime in India” (2013).
- S. Tanwar, T. Paul, K. Singh, M. Joshi and A. Rana, “Classification and Impact of Cyber Threats in India: A Review” (2020), 8th International Conference on Reliability, Infocom Technologies and Optimization (ICRITO).
- P. Datta, S. N. Panda, S. Tanwar and R. K. Kaushal, “A Technical Review Report on Cyber Crimes in India” (2020), International Conference on Emerging Smart Computing and Informatics (ESCI).
- R Core Team, R: A Language and Environment for Statistical Computing, R Foundation for Statistical Computing.
The included PDF papers are supporting literature, not datasets used by the plotting scripts. Full bibliographic details, including page ranges and persistent identifiers where applicable, should be checked against the published versions before formal citation.
