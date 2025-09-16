# Flood Impact Analysis Project

A comprehensive econometric analysis examining the impact of the 2010 Pakistan floods on educational outcomes using difference-in-differences methodology.

## Project Overview

This repository contains the complete analysis of how the devastating 2010 Pakistan floods affected school enrollment in Punjab province. The study employs a difference-in-differences (DiD) approach to identify causal effects by comparing flood-affected districts with non-affected control districts over time.

**Research Question**: What was the causal impact of the 2010 Pakistan floods on educational enrollment in affected districts?

## Repository Structure

```
├── README.md                    # Project documentation
├── requirements.txt             # Python dependencies
├── .gitignore                   # Git ignore file
├── PythonCode.ipynb            # Data visualization and exploratory analysis
├── DiD_Analysis.do             # Main econometric analysis (Stata)
```

## Methodology

### Difference-in-Differences Design
- **Treatment Group**: Flood-affected districts (Nankana Sahib, Bahawalpur, Rahim Yar Khan)
- **Control Group**: Non-affected districts (Jhang, Attock, Sahiwal)
- **Time Periods**: Pre-flood (2005-2009) vs. Post-flood (2010-2011)
- **Outcome Variable**: Total school enrollment

### Data Sources
- Punjab Development Statistics (Pre-flood enrollment data)
- School Census 2010 & 2011 (Post-flood enrollment data)
- Flood impact data from government reports

## Getting Started

### Prerequisites

- Python 3.7 or higher
- Jupyter Notebook or JupyterLab
- Stata 14+ (for econometric analysis)
- Required Python packages (see requirements.txt)

### Installation

1. Clone this repository:
```bash
git clone https://github.com/AsfandiyarSafi/FloodImpactAnalysisProject.git
cd FloodImpactAnalysisProject
```

2. Create a virtual environment (recommended):
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install required packages:
```bash
pip install -r requirements.txt
```

### Usage

1. **Exploratory Data Analysis**: Open and run the Jupyter notebook:
```bash
jupyter notebook PythonCode.ipynb
```

2. **Main Econometric Analysis**: Open `DiD_Analysis.do` in Stata and execute:
   - Data import and cleaning
   - Panel data construction
   - DiD regression estimation
   - Parallel trends testing (falsification tests)
   - Robustness checks

## Key Findings

The analysis reveals significant insights into the educational impact of natural disasters:

- **Treatment Effect**: Quantified impact of floods on school enrollment
- **Parallel Trends**: Validation of DiD assumptions through pre-treatment period analysis
- **Robustness**: Multiple specification tests confirm result validity
- **Policy Implications**: Evidence-based recommendations for disaster response

## Analysis Components

### Python Analysis (`PythonCode.ipynb`)
- Data visualization and exploratory analysis
- Descriptive statistics and trend analysis
- Interactive plots showing enrollment patterns
- Data quality checks and preprocessing

### Stata Analysis (`DiD_Analysis.do`)
- **Panel Data Construction**: Merging pre-flood and post-flood datasets
- **DiD Estimation**: Main regression with clustered standard errors
- **Falsification Tests**: Parallel trends assumption testing
- **Robustness Checks**: Alternative specifications and sensitivity analysis

## Technical Details

### Districts Studied
**Treatment (Flood-Affected)**:
- Nankana Sahib
- Bahawalpur  
- Rahim Yar Khan

**Control (Non-Affected)**:
- Jhang
- Attock
- Sahiwal

### Statistical Model
```
Enrollment_it = β₀ + β₁Treated_i + β₂Post_t + β₃(Treated_i × Post_t) + ε_it
```

Where β₃ captures the causal effect of floods on enrollment.

## Data Quality & Limitations

- **Sample Period**: 2005-2011 (with 2008 excluded due to data availability)
- **Unit of Analysis**: District-level enrollment aggregates
- **Potential Limitations**: Migration effects, measurement error, external validity

## Contributing

Contributions are welcome! Please feel free to:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -am 'Add improvement'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## Acknowledgments

- Punjab Bureau of Statistics for providing enrollment data
- School Education Department, Punjab for census data
- Pakistan Meteorological Department for flood impact information
- Academic advisors and peer reviewers for valuable feedback

## Citation

If you use this analysis in your research, please cite:
```
Safi, A. (2025). Flood Impact Analysis Project: Examining Educational Outcomes 
Following the 2010 Pakistan Floods. GitHub repository.
```

## 📫 Contact & Portfolio

- **LinkedIn:** [https://www.linkedin.com/in/asfandiyar-safi-a8680b1bb/](https://www.linkedin.com/in/asfandiyar-safi-a8680b1bb/)  
- **Email:** safi.asfnd@gmail.com  
- **Portfolio / GitHub:** [https://github.com/AsfandiyarSafi](https://github.com/AsfandiyarSafi)

