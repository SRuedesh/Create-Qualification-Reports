# Building and evaluation of a PBPK model for Ketoconazole in adults

| Version                                         | v1.0-OSP12.2                                                                                  |
| ----------------------------------------------- | --------------------------------------------------------------------------------------------- |
| based on *Model Snapshot* and *Evaluation Plan* | https://github.com/Open-Systems-Pharmacology/Ketoconazole-Model/releases/tag/v1.0-OSP12.2 |
| OSP Version                                     | 12.2                                                                                          |
| Qualification Framework Version                 | 3.3                                                                                           |

This evaluation report and the corresponding PK-Sim project file are filed at:

https://github.com/Open-Systems-Pharmacology/OSP-PBPK-Model-Library/

# Table of Contents

 * [1 Introduction](#1)
 * [2 Methods](#2)
   * [2.1 Modeling strategy](#21)
   * [2.2 Data used](#22)
   * [2.3 Model parameters and assumptions](#23)
 * [3 Results and Discussion](#3)
   * [3.1 Ketoconazole final input parameters](#31)
   * [3.2 Diagnostic plots](#32)
     * [3.2.1 Ketoconazole goodness-of-fit diagnostics](#321)
     * [3.2.2 N-deacetylketoconazole goodness-of-fit diagnostics](#322)
   * [3.3 Concentration-time profiles](#33)
     * [3.3.1 Model Building](#331)
     * [3.3.2 Model Verification](#332)
 * [4 Conclusion](#4)
 * [5 References](#5)

# 1 Introduction<a id="1"></a>

Ketoconazole is an imidazole antifungal and a strong inhibitor of CYP3A4 and P-glycoprotein (P-gp, ABCB1). Although oral ketoconazole use is restricted because of safety concerns, ketoconazole remains a clinically important reference perpetrator for CYP3A4-mediated and transporter-mediated drug-drug interaction assessments.

The model describes ketoconazole together with the circulating metabolites N-deacetylketoconazole and N-deacetyl-N-hydroxyketoconazole. The parent-metabolite structure was published by [Marok 2023](#5) to describe oral ketoconazole pharmacokinetics and quantify the contribution of parent and metabolites to CYP3A4 and P-gp inhibition. This report evaluates only the ketoconazole and metabolite pharmacokinetic data included in the model publication.

# 2 Methods<a id="2"></a>

## 2.1 Modeling strategy<a id="21"></a>

The general strategy for model development was based on a middle-out PBPK workflow. Drug-dependent parameters were taken from experimental data or estimated using established in silico methods where possible. Parameters that could not be fixed from independent evidence were optimized against clinical concentration-time profiles and then evaluated using independent oral dosing scenarios.

The model was implemented as a parent-metabolite model for ketoconazole, N-deacetylketoconazole and N-deacetyl-N-hydroxyketoconazole. Ketoconazole plasma profiles from oral solution, capsule-as-solution and tablet studies were used to inform absorption, dissolution and disposition parameters, while the Weiss et al. clinical data provided the only plasma concentration-time profiles for N-deacetylketoconazole [Weiss 2022](#5).

Ketoconazole absorption was evaluated across fasted and fed dosing conditions, including solution, capsule-as-solution and tablet formulations. The model includes CYP3A4-mediated metabolism, arylacetamide deacetylase-mediated N-deacetylketoconazole formation, UGT1A4-mediated metabolism, P-gp transport and reversible inhibition of CYP3A4 and P-gp by ketoconazole and metabolites. The resulting model structure supports both concentration-time profile evaluation and DFI or DDI perpetrator simulations [Marok 2023](#5).

## 2.2 Data used<a id="22"></a>

### In vitro and physicochemical data

Table 1 gives the drug-dependent parameters used in the final model. Values were checked against the model snapshot, Table 1, and Supplement Table S1.3 of [Marok 2023](#5). Approved corrections are documented in the table notes. Optimized values are identified as such. Assumed values are traced to the basis stated in the supplement.

| Parameter | Unit | Value | Source | Description |
| --- | --- | ---: | --- | --- |
| **Ketoconazole** |  |  |  |  |
| MW | g/mol | 531.43 | [Chemicalize 2021](#5) | Molecular weight. |
| logP | - | 2.52 | Optimized | Octanol-water partition coefficient of the neutral species. |
| f<sub>u</sub> | % | 1 | [Heel 1982](#5) | Fraction unbound in plasma. |
| pK<sub>a</sub> | - | 2.94<sup>a</sup> | [Chemicalize 2021](#5) | Acid dissociation constant. |
| pK<sub>a</sub> | - | 6.51<sup>a</sup> | [Chemicalize 2021](#5) | Acid dissociation constant. |
| Solubility | mg/L | 2.03 × 10<sup>4</sup> (pH 1.2); 4.3 × 10<sup>4</sup> (pH 3); 7.00 (pH 6.8); 5.40 (pH 7); 6.00 (pH 7.5)<sup>c</sup> | [Ghazal 2015](#5) | Aqueous solubility at the specified pH values. |
| Density | g/cm<sup>3</sup> | 1.40 | [ChemSpider 2021](#5) | Solid-state density. |
| D<sub>aq</sub> | dm<sup>2</sup>/min | 3.75 × 10<sup>−7</sup> | Optimized | Aqueous diffusion coefficient. |
| P<sub>int</sub>, fasted | cm/min | 1.56 × 10<sup>−5</sup> | Optimized | Specific transcellular intestinal permeability in the fasted state. |
| P<sub>int</sub>, fed | cm/min | 9.95 × 10<sup>−6</sup> | Optimized | Specific transcellular intestinal permeability in the fed state. |
| GET, fasted | min | 15 | [OSP Suite Manual 2018](#5) | Gastric emptying time in the fasted state. |
| GET, fed | min | 45 | [Fisher 1987](#5) | Gastric emptying time in the fed state. |
| Cellular permeabilities | - | PK-Sim Standard | [OSP Suite Manual 2018](#5) | Cellular permeabilities calculated with the PK-Sim Standard method. |
| Partition coefficients | - | Berezhkovskiy | [Berezhkovskiy 2004](#5) | Tissue-to-plasma partition coefficients calculated with the Berezhkovskiy method. |
| GFR fraction | - | 1 | Assumed | Fraction used to scale passive glomerular filtration. |
| EHC fraction | - | 1 | Assumed | Fraction released continuously into bile. |
| K<sub>m,AADAC</sub> | µmol/L | 1.88 | [Fukami 2016](#5) | Michaelis constant for AADAC-mediated hydrolysis. |
| k<sub>cat,AADAC</sub> | min<sup>−1</sup> | 0.87 | Optimized | Catalytic rate constant for AADAC-mediated hydrolysis. |
| K<sub>m,CYP3A4</sub> | µmol/L | 0.00846 | [Weiss 2022](#5) | Michaelis constant for CYP3A4 metabolism, assumed equal to K<sub>i,CYP3A4</sub>. |
| k<sub>cat,CYP3A4</sub> | min<sup>−1</sup> | 0.10 | Optimized | Catalytic rate constant for CYP3A4-mediated metabolism. |
| K<sub>m,UGT1A4</sub> | µmol/L | 7 | [Bourcier 2010](#5) | Michaelis constant for UGT1A4-mediated glucuronidation. |
| k<sub>cat,UGT1A4</sub> | min<sup>−1</sup> | 0.31 | Optimized | Catalytic rate constant for UGT1A4-mediated glucuronidation. |
| K<sub>m,P-gp</sub> | µmol/L | 0.035 | [Weiss 2022](#5) | Michaelis constant for P-glycoprotein transport, assumed equal to K<sub>i,P-gp</sub>. |
| k<sub>cat,P-gp</sub> | min<sup>−1</sup> | 0.33 | Optimized | Catalytic rate constant for P-glycoprotein transport. |
| K<sub>i,CYP3A4</sub> | µmol/L | 0.00846 | [Weiss 2022](#5) | Inhibition constant for CYP3A4, derived from IC<sub>50</sub>. |
| K<sub>i,P-gp</sub> | µmol/L | 0.035 | [Weiss 2022](#5) | Inhibition constant for P-gp. |
| Particle radius | µm | 11.749; 111.06; 205.46<sup>d</sup> | [Elder 2007](#5) | Particle radii assigned to the specified dose fractions. |
| **N-deacetylketoconazole** |  |  |  |  |
| MW | g/mol | 489.40 | [Chemicalize 2021b](#5) | Molecular weight. |
| logP | - | 3.75 | Optimized | Octanol-water partition coefficient of the neutral species. |
| f<sub>u</sub> | % | 1 | [Heel 1982](#5) | Fraction unbound in plasma. |
| pK<sub>a</sub> | - | 0.20<sup>a</sup> | [Chemicalize 2021b](#5) | Acid dissociation constant. |
| pK<sub>a</sub> | - | 6.42<sup>a</sup> | [Chemicalize 2021b](#5) | Acid dissociation constant. |
| pK<sub>a</sub> | - | 8.90<sup>a</sup> | [Chemicalize 2021b](#5) | Acid dissociation constant. |
| Solubility | mg/mL | 1.24 | [Chemicalize 2021b](#5) | Aqueous solubility at pH 6.5. |
| Cellular permeabilities | - | Charge-dependent Schmitt | [Kawai 1994](#5) | Cellular permeabilities calculated with the charge-dependent Schmitt method. |
| Partition coefficients | - | Rodgers and Rowland | [Rodgers 2006](#5) | Tissue-to-plasma partition coefficients calculated with the Rodgers and Rowland method. |
| GFR fraction | - | 1 | Assumed | Fraction used to scale passive glomerular filtration. |
| EHC fraction | - | 1 | Assumed | Fraction released continuously into bile. |
| K<sub>m,FMO3</sub> | µmol/L | 1.17 | [Rodriguez 1997](#5) | Michaelis constant for FMO3-mediated N-oxidation. |
| k<sub>cat,FMO3</sub> | min<sup>−1</sup> | 378.65 | Optimized | Catalytic rate constant for FMO3-mediated N-oxidation. |
| K<sub>i,CYP3A4</sub> | µmol/L | 0.022 | [Weiss 2022](#5) | Inhibition constant for CYP3A4, derived from IC<sub>50</sub>. |
| K<sub>i,P-gp</sub> | µmol/L | 0.119 | [Weiss 2022](#5) | Inhibition constant for P-gp. |
| **N-deacetyl-N-hydroxyketoconazole** |  |  |  |  |
| MW | g/mol | 505.40 | [Chemicalize 2022](#5) | Molecular weight. |
| logP | - | 4.20 | [Chemicalize 2022](#5) | Octanol-water partition coefficient of the neutral species. |
| f<sub>u</sub> | % | 1 | [Heel 1982](#5) | Fraction unbound in plasma. |
| pK<sub>a</sub> | - | 3.42<sup>a</sup> | [Chemicalize 2022](#5) | Acid dissociation constant. |
| pK<sub>a</sub> | - | 6.42<sup>a</sup> | [Chemicalize 2022](#5) | Acid dissociation constant. |
| Solubility | mg/L | 4.40 × 10<sup>3</sup><sup>e</sup> | [Marok 2023](#5), Table 1 | Aqueous solubility at pH 6.5. |
| P<sub>organ</sub> | cm/min | 0 | Assumed | Specific organ permeability. |
| Cellular permeabilities | - | Charge-dependent Schmitt | [Kawai 1994](#5) | Cellular permeabilities calculated with the charge-dependent Schmitt method. |
| Partition coefficients | - | Berezhkovskiy | [Berezhkovskiy 2004](#5) | Tissue-to-plasma partition coefficients calculated with the Berezhkovskiy method. |
| GFR fraction | - | 1 | Assumed | Fraction used to scale passive glomerular filtration. |
| EHC fraction | - | 1 | Assumed | Fraction released continuously into bile. |
| CL<sub>FMO3</sub> | L/(µmol·min) | 0.09 | Optimized | FMO3-mediated clearance. |
| K<sub>i,CYP3A4</sub> | µmol/L | 0.022 | [Weiss 2022](#5) | Inhibition constant for CYP3A4, assumed equal to the N-deacetylketoconazole value. |
| K<sub>i,P-gp</sub> | µmol/L | 0.119 | [Weiss 2022](#5) | Inhibition constant for P-gp. |

**Table 1:**<a name="table-1"></a> Drug-dependent parameters used in the final ketoconazole model. AADAC: arylacetamide deacetylase. FMO3: flavin-containing monooxygenase 3. GFR: glomerular filtration rate. P-gp: P-glycoprotein. UGT1A4: uridine diphosphate glucuronosyltransferase 1A4. <sup>c</sup> The solubility units follow Table 1 of [Marok 2023](#5). Supplement Table S1.3 incorrectly labels these values as mg/mL. <sup>d</sup> Supplement Table S1.3 incorrectly labels the particle radii as nm. The snapshot values are equivalent to the listed µm values. <sup>e</sup> The approved value is 4.40 × 10<sup>3</sup> mg/L, equivalent to 4.40 mg/mL, as reported in Table 1 of [Marok 2023](#5). Supplement Table S1.3 is incorrect.

<sup>a</sup> Basic.

### Clinical data

Clinical plasma concentration-time profiles were taken from the published studies compiled for the model publication ([Marok 2023](#5)). The evaluation includes 53 oral profiles across solution, tablet, capsule, fasted, fed, single-dose, and multiple-dose conditions ([Table 2](#table-2)). Seven profiles were used for model building, and 46 profiles were used for model verification. When a source publication also describes an interaction study, this compound report includes only ketoconazole or metabolite pharmacokinetics and does not evaluate victim-drug exposure.

| Source | Dose [mg] / schedule\* | Age [years] | Weight [kg] | Sex | N | Form. | CYP2D6 characterization |
| --- | --- | --- | --- | --- | ---: | --- | --- |
| [Boyce 2012](#5) | 200, multiple dose, profile 1, fasted | 26.6 (18–39) | 73.5 (53.8–98.8) | 41.67% female | 24 | Tablet | EM |
| [Boyce 2012](#5) | 200, multiple dose, profile 2, fasted | 26.6 (18–39) | 73.5 (53.8–98.8) | 41.67% female | 24 | Tablet | EM |
| [Chin 1995](#5) | 200, fasted | 22–41 | NR | 33.34% female | 9 | Tablet | EM |
| [Craven 1983](#5) | 1200, multiple dose, fed | NR | NR | NR | 2 | Tablet | EM |
| [Craven 1983](#5) | 800, multiple dose, fed | NR | NR | NR | 2 | Tablet | EM |
| [Daneshmend 1981](#5) | 200, fed | NR | NR | NR | NR | Tablet | EM |
| [Daneshmend 1981](#5) | 400, fed | NR | NR | NR | NR | Tablet | EM |
| [Daneshmend 1983](#5) | 200, fasted | 25 (21–46) | NR | Male | 8 | Tablet | EM |
| [Daneshmend 1983](#5) | 200, multiple dose, fasted | 25 (21–46) | NR | Male | 8 | Tablet | EM |
| [Daneshmend 1984](#5) | 200, fed | 23 (20–31) | 64 (50–75) | 62.5% female | 8 | Tablet | EM |
| [Daneshmend 1984](#5) | 200, profile 1, fasted | 23 (20–31) | 64 (50–75) | 62.5% female | 8 | Tablet | EM |
| [Daneshmend 1984](#5) | 400, fasted | 23 (20–31) | 64 (50–75) | 62.5% female | 8 | Tablet | EM |
| [Daneshmend 1984](#5) | 400, fed | 23 (20–31) | 64 (50–75) | 62.5% female | 8 | Tablet | EM |
| [Daneshmend 1984](#5) | 600, fasted | 23 (20–31) | 64 (50–75) | 62.5% female | 8 | Tablet | EM |
| [Daneshmend 1984](#5) | 600, fed | 23 (20–31) | 64 (50–75) | 62.5% female | 8 | Tablet | EM |
| [Daneshmend 1984](#5) | 800, fasted | 23 (20–31) | 64 (50–75) | 62.5% female | 8 | Tablet | EM |
| [Daneshmend 1984](#5) | 800, fed | 23 (20–31) | 64 (50–75) | 62.5% female | 8 | Tablet | EM |
| [Greenblatt 1998](#5) | 200 twice daily for 5 days, fed | 18–38 | NR | NR | 8 | Tablet | EM |
| [Heel 1982](#5) | 100, fasted | NR | NR | NR | 12 | Tablet | EM |
| [Heel 1982](#5) | 200, fasted | NR | NR | NR | 12 | Tablet | EM |
| [Heel 1982](#5)<sup>+</sup> | 200, fasted | NR | NR | NR | 12 | Solution | EM |
| [Heel 1982](#5) | 400, fasted | NR | NR | NR | 12 | Tablet | EM |
| [Huang 1986](#5) | 200, fasted | 20 (18–25) | 76.4 (61.2–95.3) | Male | 23 | Tablet | EM |
| [Huang 1986](#5)<sup>+</sup> | 200, profile 1, fasted | 20 (18–25) | 76.4 (61.2–95.3) | Male | 12 | Solution | EM |
| [Huang 1986](#5)<sup>+</sup> | 200, profile 2, fasted | 20 (18–25) | 76.4 (61.2–95.3) | Male | 23 | Solution | EM |
| [Huang 1986](#5)<sup>+</sup> | 400, fasted | 20 (18–25) | 76.4 (61.2–95.3) | Male | 12 | Solution | EM |
| [Huang 1986](#5)<sup>+</sup> | 800, fasted | 20 (18–25) | 76.4 (61.2–95.3) | Male | 12 | Solution | EM |
| [Knupp 1993](#5) | 200, fasted | 30 (24–36) | 78.8 | Male | 12 | Tablet | EM |
| [Männistö 1982](#5) | 200, fed | 24 (22–26) | 62 (55–70) | 50% female | 10 | Tablet | EM |
| [Männistö 1982](#5) | 200, profile 1, fasted | 24 (22–26) | 62 (55–70) | 50% female | 10 | Tablet | EM |
| [Männistö 1982](#5) | 200, profile 2, fasted | 24 (22–26) | 62 (55–70) | 50% female | 10 | Tablet | EM |
| [Männistö 1982](#5) | 200, profile 3, fasted | 24 (22–26) | 62 (55–70) | 50% female | 10 | Tablet | EM |
| [Männistö 1982](#5) | 200, with juice, fasted | 24 (22–26) | 62 (55–70) | 50% female | 10 | Tablet | EM |
| [Patel 2011](#5) | 200, multiple dose, fasted | 36 (22–43) | 74.7 (50.1–95) | 19% female | 15 | Tablet | EM |
| [Piscitelli 1991](#5) | 400, fasted | 18–30 | NR | Male | 6 | Tablet | EM |
| [Polk 1999](#5) | 400, fasted | 23 (19–41) | 77.4 (64.2–99.8) | Male | 12 | Tablet | EM |
| [Sadeghnia 2005](#5) | 400, profile 1, fasted | 23–29 | 59–78 | Male | 12 | Tablet | EM |
| [Sadeghnia 2005](#5) | 400, profile 2, fasted | 23–29 | 59–78 | Male | 12 | Tablet | EM |
| [Sekar 2008](#5) | 200 twice daily for 4 days, fed | NR | NR | NR | NR | Tablet | EM |
| [Solomon 2007](#5) | 400, profile 1, fasted | 23.2 (18–45) | NR | Male | 24 | Tablet | EM |
| [Solomon 2007](#5) | 400, profile 2, fasted | 23.2 (18–45) | NR | Male | 24 | Tablet | EM |
| [Sriwiriyajan 2007](#5)<sup>+</sup> | 400, fasted | 33.7 (22–55) | NR | 75% female | 12 | Tablet | EM |
| [Tiseo 1998](#5)<sup>+</sup> | 200 once daily for 7 days, fasted | NR | NR | NR | 21 | Tablet | EM |
| [U.S. FDA 1998](#5) | 200, profile 1, fasted | NR | NR | NR | 23 | Tablet | EM |
| [U.S. FDA 1998](#5) | 200, profile 1, fed | NR | NR | NR | 39 | Tablet | EM |
| [U.S. FDA 1998](#5) | 200, profile 2, fasted | NR | NR | NR | 39 | Tablet | EM |
| [U.S. FDA 1998](#5) | 200, profile 2, fed | NR | NR | NR | 39 | Tablet | EM |
| [U.S. FDA 1998](#5) | 200, profile 3, fasted | NR | NR | NR | 39 | Tablet | EM |
| [Van der Meer 1980](#5) | 200, control, fasted | 28–42 | NR | NR | 3 | Tablet | EM |
| [Weiss 2022](#5) | 400, fasted | 27.34 (20–48) | 74.44 (57.5–100) | Male | 12 | Tablet | EM |
| [Wire 2007](#5) | 200, multiple dose, fasted | NR | NR | NR | 15 | Tablet | EM |
| [Yuen 1999](#5) | 200, profile 1, fasted | NR | NR | NR | 18 | Tablet | EM |
| [Yuen 1999](#5) | 200, profile 2, fasted | NR | NR | NR | 18 | Tablet | EM |

**Table 2:**<a name="table-2"></a> Clinical ketoconazole concentration-time profiles used for model building and verification. \*: Single oral dose unless otherwise specified; EM: extensive metabolizer; NR: not reported; <sup>+</sup>: data used for model building. EM is the model default when study-specific CYP2D6 information is not available. Food conditions are retained in the dose and schedule field.

## 2.3 Model parameters and assumptions<a id="23"></a>

### Absorption and formulations

The model includes oral solution, capsule-as-solution and tablet applications. Solution and capsule-as-solution scenarios were used to separate systemic disposition from dissolution-limited tablet absorption. Tablet absorption was described with formulation-specific dissolution and particle-size assumptions, with fed-state scenarios used to describe the reduced and delayed absorption observed for weak-base ketoconazole under altered gastrointestinal conditions [Marok 2023](#5), Table 1.

### Distribution

Ketoconazole is a weak base with high plasma protein binding and pH-dependent solubility. Distribution parameters were based on physicochemical properties and PBPK tissue partitioning methods, with optimized lipophilicity where required to reproduce systemic exposure. The metabolites were represented as separate compounds with their own physicochemical properties and protein-binding assumptions [Marok 2023](#5), Table 1.

### Metabolism, transport and inhibition

Ketoconazole metabolism includes formation of N-deacetylketoconazole by arylacetamide deacetylase and further metabolism through CYP3A4 and UGT pathways. Ketoconazole and metabolites were represented as CYP3A4 and P-gp (ABCB1) inhibitors. In the model publication, this structure described DDI perpetrator behavior more accurately than a parent-only inhibition model [Marok 2023](#5), Table 1, and [Weiss 2022](#5).

# 3 Results and Discussion<a id="3"></a>

The parent-metabolite PBPK model for ketoconazole was developed and evaluated with clinical pharmacokinetic data after oral administration. The evaluation covers doses from 100 to 1200 mg, single-dose and multiple-dose regimens, solution and solid oral formulations, fasted and fed conditions, and plasma observations for ketoconazole and N-deacetylketoconazole.

Model-building studies included solution data from [Heel 1982](#5) and [Huang 1986](#5), a multiple-dose tablet study from [Tiseo 1998](#5), and a 400 mg solid oral study from [Sriwiriyajan 2007](#5). Verification used independent solution and tablet studies across the evaluated dose, regimen, and food conditions. N-deacetylketoconazole observations were available from [Weiss 2022](#5).

The model includes formulation-dependent absorption, arylacetamide deacetylase-mediated N-deacetylketoconazole formation, CYP3A4 and UGT metabolism, P-gp transport, and reversible CYP3A4 and P-gp inhibition by ketoconazole and its metabolites. Goodness-of-fit diagnostics are separated for ketoconazole and N-deacetylketoconazole because metabolite observations are limited to one study.

The next sections show:

1. the final model input parameters for the building blocks in [Section 3.1](#31).
2. analyte-specific goodness-of-fit diagnostics in [Section 3.2](#32).
3. simulated vs. observed concentration-time profiles for model building and verification in [Section 3.3](#33).

Interpretation is limited by the absence of intravenous data, estimated formulation and food-effect parameters, incomplete CYP3A4 and P-gp kinetic information, and sparse metabolite observations.

## 3.1 Ketoconazole final input parameters<a id="31"></a>

The following tables are generated from the model and summarize the final compound input parameters for ketoconazole, N-deacetylketoconazole and N-deacetyl-N-hydroxyketoconazole. Interpret optimized parameters together with the sources in [Section 2.2](#22) and the assumptions in [Section 2.3](#23).

The particle-radius unit reported in Table S1.3 of the supplement is erroneous. The intended radii are 11.749, 111.06 and 205.46 µm for tablet dissolution bins 1, 2 and 3, respectively. The corresponding snapshot values of 0.011749, 0.11106 and 0.20546 mm are correct. The solubility value shown below represents a pH-dependent table function rather than a single constant.[^solubility-table]

[^solubility-table]: The snapshot stores the ketoconazole solubility relationship as a table function. The scalar displayed in the generated parameter table is an internal representation of that function and should not be interpreted as the solubility at a specific pH.

### Compound: Ketoconazole

#### Parameters

Name                                             | Value                    | Value Origin                                                | Alternative | Default
------------------------------------------------ | ------------------------ | ----------------------------------------------------------- | ----------- | -------
Solubility table                                 | 12872590000000 mg/l      | Publication-In Vitro-Extrapolated from observed data        | Ghazal 2015 | True   
Lipophilicity                                    | 2.5243939623 Log Units   | Parameter Identification-Parameter Identification-Optimized | fit         | True   
Fraction unbound (plasma, reference value)       | 0.01                     | Publication-Other                                           | Heel 1982   | True   
Specific intestinal permeability (transcellular) | 1.5597039897E-05 cm/min  | Parameter Identification-Parameter Identification-Optimized | Fit fasted  | True   
Specific intestinal permeability (transcellular) | 9.9497068191E-06 cm/min  | Parameter Identification-Parameter Identification-Optimized | Fit fed     | False  
Cl                                               | 2                        | Internet-Other-Chemicalize                                  |             |        
Is small molecule                                | Yes                      |                                                             |             |        
Molecular weight                                 | 531.43 g/mol             | Internet-Other-Chemicalize                                  |             |        
Plasma protein binding partner                   | Albumin                  |                                                             |             |        
Treat precipitated drug as                       | Insoluble                | Unknown                                                     |             |        
Aqueous diffusion coefficient                    | 3.7482784124E-07 dm²/min | Parameter Identification-Parameter Identification-Optimized |             |        
Density (drug)                                   | 1.4 g/cm³                | Internet-Other-ChemSpider                                   |             |        
Enable supersaturation                           | Yes                      | Unknown                                                     |             |        

#### Calculation methods

Name                    | Value          
----------------------- | ---------------
Partition coefficients  | Berezhkovskiy  
Cellular permeabilities | PK-Sim Standard

#### Processes

##### Metabolizing Enzyme: CYP3A4-Assumed

Molecule: CYP3A4

###### Parameters

Name                               | Value                      | Value Origin                                               
---------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 0 pmol/min/mg mic. protein |                                                            
Km                                 | 0.008461538 µmol/l         | Other-Assumption-Assumed from Ki value from Weiss 2022     
kcat                               | 0.1020204084 1/min         | Parameter Identification-Parameter Identification-Optimized

##### Transport Protein: ABCB1-Assumed

Molecule: ABCB1

###### Parameters

Name                      | Value             | Value Origin                                               
------------------------- | ----------------- | -----------------------------------------------------------
Transporter concentration | 1 µmol/l          |                                                            
Vmax                      | 0 µmol/l/min      |                                                            
Km                        | 0.035 µmol/l      | Other-Assumption-Assumed from Ki value from Weiss 2022     
kcat                      | 0.326999715 1/min | Parameter Identification-Parameter Identification-Optimized

##### Systemic Process: Glomerular Filtration-GFR

Species: Human

###### Parameters

Name         | Value | Value Origin
------------ | -----:| ------------:
GFR fraction |     1 |             

##### Metabolizing Enzyme: UGT1A4-Bourcier 2010

Molecule: UGT1A4

###### Parameters

Name                             | Value                       | Value Origin                                               
-------------------------------- | --------------------------- | -----------------------------------------------------------
In vitro Vmax/recombinant enzyme | 0 nmol/min/pmol rec. enzyme |                                                            
Km                               | 7 µmol/l                    | Publication-In Vitro-recombinant enzymes                   
kcat                             | 0.3062809592 1/min          | Parameter Identification-Parameter Identification-Optimized

##### Inhibition: CYP3A4-Weiss 2022

Molecule: CYP3A4

###### Parameters

Name | Value              | Value Origin                                                     
---- | ------------------ | -----------------------------------------------------------------
Ki   | 0.008461538 µmol/l | Publication-In Vitro-Calculated from IC50 and corrected for fumic

##### Metabolizing Enzyme: AADAC-Fukami 2016

Molecule: AADAC

Metabolite: N-deacetylketoconazole

###### Parameters

Name                               | Value                         | Value Origin                                                      
---------------------------------- | ----------------------------- | ------------------------------------------------------------------
In vitro Vmax for liver microsomes | 28.3 pmol/min/mg mic. protein |                                                                   
Km                                 | 1.8797 µmol/l                 | Publication-In Vitro-Corrected with f<sub>u,mic</sub> (17.5*0.107)
kcat                               | 0.8694012741 1/min            | Parameter Identification-Parameter Identification-Optimized       

##### Inhibition: ABCB1-Weiss 2022

Molecule: ABCB1

###### Parameters

Name | Value              | Value Origin                                   
---- | ------------------ | -----------------------------------------------
Ki   | 0.035238095 µmol/l | Publication-In Vitro-Calculated from IC50 value

### Compound: N-deacetylketoconazole

#### Parameters

Name                                       | Value                  | Value Origin                                                | Alternative | Default
------------------------------------------ | ---------------------- | ----------------------------------------------------------- | ----------- | -------
Solubility at reference pH                 | 1.24 mg/ml             | Internet-Other-Chemicalize                                  | Chemicalize | True   
Reference pH                               | 6.5                    | Internet-Other-Chemicalize                                  | Chemicalize | True   
Lipophilicity                              | 3.7501327278 Log Units | Parameter Identification-Parameter Identification-Optimized | Fit         | True   
Fraction unbound (plasma, reference value) | 1 %                    | Other-Assumption-assumed from value for Ketoconazole        | Assumed     | True   
Cl                                         | 2                      | Internet-Other-Chemicalize                                  |             |        
Is small molecule                          | Yes                    |                                                             |             |        
Molecular weight                           | 489.4 g/mol            | Internet-Other-Chemicalize                                  |             |        
Plasma protein binding partner             | Albumin                |                                                             |             |        

#### Calculation methods

Name                    | Value                   
----------------------- | ------------------------
Partition coefficients  | Rodgers and Rowland     
Cellular permeabilities | Charge dependent Schmitt

#### Processes

##### Inhibition: CYP3A4-Weiss 2022

Molecule: CYP3A4

###### Parameters

Name | Value        | Value Origin                                                     
---- | ------------ | -----------------------------------------------------------------
Ki   | 0.022 µmol/l | Publication-In Vitro-Calculated from IC50 and corrected for fumic

##### Systemic Process: Glomerular Filtration-GFR

Species: Human

###### Parameters

Name         | Value | Value Origin
------------ | -----:| ------------:
GFR fraction |     1 |             

##### Metabolizing Enzyme: FMO3-Rodriguez 1997

Molecule: FMO3

###### Parameters

Name                               | Value                      | Value Origin                                                                                    
---------------------------------- | -------------------------- | ------------------------------------------------------------------------------------------------
In vitro Vmax for liver microsomes | 0 pmol/min/mg mic. protein |                                                                                                 
Km                                 | 1.167401215 µmol/l         | Publication-In Vitro-recombinant enzymes; model value is correct, publication value is erroneous
kcat                               | 378.6506200467 1/min       | Parameter Identification-Parameter Identification-Optimized                                     

##### Inhibition: ABCB1-Weiss 2022

Molecule: ABCB1

###### Parameters

Name | Value              | Value Origin                             
---- | ------------------ | -----------------------------------------
Ki   | 0.119047619 µmol/l | Publication-In Vitro-Calculated from IC50

### Compound: N-deacetyl-N-hydroxyketoconazole

#### Parameters

Name                                       | Value         | Value Origin                                               | Alternative | Default
------------------------------------------ | ------------- | ---------------------------------------------------------- | ----------- | -------
Solubility at reference pH                 | 4.4 mg/ml     | Internet-Other-Chemicalize                                 | Chemicalize | True   
Reference pH                               | 6.5           | Internet-Other-Chemicalize                                 | Chemicalize | True   
Lipophilicity                              | 4.2 Log Units | Internet-Other-Chemicalize                                 | Chemicalize | True   
Fraction unbound (plasma, reference value) | 1 %           | Publication-Assumption-assumed from value for Ketoconazole | Assumed     | True   
Permeability                               | 0 cm/min      |                                                            | Assumed     | True   
Cl                                         | 2             | Internet-Other-Chemicalize                                 |             |        
Is small molecule                          | Yes           |                                                            |             |        
Molecular weight                           | 505.4 g/mol   | Internet-Other-Chemicalize                                 |             |        
Plasma protein binding partner             | Albumin       |                                                            |             |        

#### Calculation methods

Name                    | Value                   
----------------------- | ------------------------
Partition coefficients  | Berezhkovskiy           
Cellular permeabilities | Charge dependent Schmitt

#### Processes

##### Inhibition: CYP3A4-Weiss 2022

Molecule: CYP3A4

###### Parameters

Name | Value        | Value Origin                                                  
---- | ------------ | --------------------------------------------------------------
Ki   | 0.022 µmol/l | Other-Assumption-assumed from value for N-deacetylketoconazole

##### Systemic Process: Glomerular Filtration-GFR

Species: Human

###### Parameters

Name         | Value | Value Origin
------------ | -----:| ------------:
GFR fraction |     1 |             

##### Inhibition: ABCB1-Weiss 2022

Molecule: ABCB1

###### Parameters

Name | Value              | Value Origin                                                  
---- | ------------------ | --------------------------------------------------------------
Ki   | 0.119047619 µmol/l | Other-Assumption-assumed from value for N-deacetylketoconazole

##### Metabolizing Enzyme: FMO3-Clearance

Molecule: FMO3

###### Parameters

Name                           | Value                     | Value Origin                                               
------------------------------ | ------------------------- | -----------------------------------------------------------
In vitro CL/recombinant enzyme | 0 µl/min/pmol rec. enzyme |                                                            
CLspec/[Enzyme]                | 0.0893329451 l/µmol/min   | Parameter Identification-Parameter Identification-Optimized

## 3.2 Diagnostic plots<a id="32"></a>

The goodness-of-fit diagnostics are separated by analyte. This prevents the parent and metabolite observations from sharing one legend and keeps the error measures analyte specific.

### 3.2.1 Ketoconazole goodness-of-fit diagnostics<a id="321"></a>

Ketoconazole parent plasma observations are mapped to the ketoconazole plasma output.

<a id="table-3-1"></a>

**Table 3-1: GMFE for Ketoconazole goodness-of-fit diagnostics**

|Group        |GMFE |
|:------------|:----|
|Ketoconazole |1.71 |

<br>
<br>

<a id="figure-3-1"></a>

![](images/006_section_3/008_section_32/009_section_321/2_gof_plot_predictedVsObserved.png)

**Figure 3-1: Ketoconazole goodness-of-fit diagnostics**

<br>
<br>

<a id="figure-3-2"></a>

![](images/006_section_3/008_section_32/009_section_321/3_gof_plot_residualsOverTime.png)

**Figure 3-2: Ketoconazole goodness-of-fit diagnostics**

<br>
<br>

### 3.2.2 N-deacetylketoconazole goodness-of-fit diagnostics<a id="322"></a>

N-deacetylketoconazole plasma observations are mapped to the metabolite plasma output.

<a id="table-3-2"></a>

**Table 3-2: GMFE for N-deacetylketoconazole goodness-of-fit diagnostics**

|Group                  |GMFE |
|:----------------------|:----|
|N-deacetylketoconazole |1.93 |

<br>
<br>

<a id="figure-3-3"></a>

![](images/006_section_3/008_section_32/010_section_322/5_gof_plot_predictedVsObserved.png)

**Figure 3-3: N-deacetylketoconazole goodness-of-fit diagnostics**

<br>
<br>

<a id="figure-3-4"></a>

![](images/006_section_3/008_section_32/010_section_322/6_gof_plot_residualsOverTime.png)

**Figure 3-4: N-deacetylketoconazole goodness-of-fit diagnostics**

<br>
<br>

## 3.3 Concentration-time profiles<a id="33"></a>

Concentration-time profiles are grouped by formulation and dosing context. Solution and capsule-as-solution scenarios are shown separately from tablet studies because they inform different absorption assumptions.

### 3.3.1 Model Building<a id="331"></a>

The model-building profiles cover solution and solid oral applications used to inform absorption, formulation, and disposition parameters.

<a id="figure-3-5"></a>

![](images/006_section_3/011_section_33/012_section_331/25_time_profile_plot_Ketoconazole_Heel__1982___KTZ_200_mg_solution__fasted__114_.png)

**Figure 3-5: Heel 1982: KTZ 200 mg solution, fasted (114)**

<br>
<br>

<a id="figure-3-6"></a>

![](images/006_section_3/011_section_33/012_section_331/28_time_profile_plot_Ketoconazole_Huang__1986___KTZ_200_mg_solution__fasted__3_.png)

**Figure 3-6: Huang 1986: KTZ 200 mg solution, fasted (3)**

<br>
<br>

<a id="figure-3-7"></a>

![](images/006_section_3/011_section_33/012_section_331/29_time_profile_plot_Ketoconazole_Huang__1986___KTZ_200_mg_solution__fasted__4_.png)

**Figure 3-7: Huang 1986: KTZ 200 mg solution, fasted (4)**

<br>
<br>

<a id="figure-3-8"></a>

![](images/006_section_3/011_section_33/012_section_331/31_time_profile_plot_Ketoconazole_Huang__1986___KTZ_400_mg_solution__fasted__5_.png)

**Figure 3-8: Huang 1986: KTZ 400 mg solution, fasted (5)**

<br>
<br>

<a id="figure-3-9"></a>

![](images/006_section_3/011_section_33/012_section_331/32_time_profile_plot_Ketoconazole_Huang__1986___KTZ_800_mg_solution__fasted__6_.png)

**Figure 3-9: Huang 1986: KTZ 800 mg solution, fasted (6)**

<br>
<br>

<a id="figure-3-10"></a>

![](images/006_section_3/011_section_33/012_section_331/47_time_profile_plot_Ketoconazole_Sriwiriyajan__2007___KTZ_400_mg_solution__fasted__74_.png)

**Figure 3-10: Sriwiriyajan 2007: KTZ 400 mg solution, fasted (74)**

<br>
<br>

<a id="figure-3-11"></a>

![](images/006_section_3/011_section_33/012_section_331/48_time_profile_plot_Ketoconazole_Tiseo__1998___KTZ_200_mg_tablet__once_daily_for_7_days__fasted__81_.png)

**Figure 3-11: Tiseo 1998: KTZ 200 mg solution, fasted (81)**

<br>
<br>

### 3.3.2 Model Verification<a id="332"></a>

The model-verification profiles cover independent fasted, fed, single-dose, and multiple-dose oral studies.

<a id="figure-3-12"></a>

![](images/006_section_3/011_section_33/013_section_332/1_time_profile_plot_Ketoconazole_Boyce__2012___KTZ_200_mg_tablet__fasted__10_.png)

**Figure 3-12: Boyce 2012: KTZ 200 mg tablet, fasted (10)**

<br>
<br>

<a id="figure-3-13"></a>

![](images/006_section_3/011_section_33/013_section_332/2_time_profile_plot_Ketoconazole_Boyce__2012___KTZ_200_mg_tablet__fasted__9_.png)

**Figure 3-13: Boyce 2012: KTZ 200 mg tablet, fasted (9)**

<br>
<br>

<a id="figure-3-14"></a>

![](images/006_section_3/011_section_33/013_section_332/3_time_profile_plot_Ketoconazole_Chin__1995___KTZ_200_mg_tablet__fasted__15_.png)

**Figure 3-14: Chin 1995: KTZ 200 mg tablet, fasted (15)**

<br>
<br>

<a id="figure-3-15"></a>

![](images/006_section_3/011_section_33/013_section_332/4_time_profile_plot_Ketoconazole_Craven__1983___KTZ_1200_mg_tablet__fed__128_.png)

**Figure 3-15: Craven 1983: KTZ 1200 mg tablet, fed (128)**

<br>
<br>

<a id="figure-3-16"></a>

![](images/006_section_3/011_section_33/013_section_332/5_time_profile_plot_Ketoconazole_Craven__1983___KTZ_800_mg_tablet__fed__127_.png)

**Figure 3-16: Craven 1983: KTZ 800 mg tablet, fed (127)**

<br>
<br>

<a id="figure-3-17"></a>

![](images/006_section_3/011_section_33/013_section_332/6_time_profile_plot_Ketoconazole_Daneshmend__1981___KTZ_200_mg_tablet__fed__109_.png)

**Figure 3-17: Daneshmend 1981: KTZ 200 mg tablet, fed (109)**

<br>
<br>

<a id="figure-3-18"></a>

![](images/006_section_3/011_section_33/013_section_332/7_time_profile_plot_Ketoconazole_Daneshmend__1981___KTZ_400_mg_tablet__fed__110_.png)

**Figure 3-18: Daneshmend 1981: KTZ 400 mg tablet, fed (110)**

<br>
<br>

<a id="figure-3-19"></a>

![](images/006_section_3/011_section_33/013_section_332/8_time_profile_plot_Ketoconazole_Daneshmend__1983___KTZ_200_mg_tablet__fasted__28_.png)

**Figure 3-19: Daneshmend 1983: KTZ 200 mg tablet, fasted (28)**

<br>
<br>

<a id="figure-3-20"></a>

![](images/006_section_3/011_section_33/013_section_332/9_time_profile_plot_Ketoconazole_Daneshmend__1983___KTZ_200_mg_tablet__fasted__29_.png)

**Figure 3-20: Daneshmend 1983: KTZ 200 mg tablet, fasted (29)**

<br>
<br>

<a id="figure-3-21"></a>

![](images/006_section_3/011_section_33/013_section_332/10_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_200_mg_tablet__fasted__20_.png)

**Figure 3-21: Daneshmend 1984: KTZ 200 mg tablet, fasted (20)**

<br>
<br>

<a id="figure-3-22"></a>

![](images/006_section_3/011_section_33/013_section_332/11_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_200_mg_tablet__fed__24_.png)

**Figure 3-22: Daneshmend 1984: KTZ 200 mg tablet, fed (24)**

<br>
<br>

<a id="figure-3-23"></a>

![](images/006_section_3/011_section_33/013_section_332/12_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_400_mg_tablet__fasted__21_.png)

**Figure 3-23: Daneshmend 1984: KTZ 400 mg tablet, fasted (21)**

<br>
<br>

<a id="figure-3-24"></a>

![](images/006_section_3/011_section_33/013_section_332/13_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_400_mg_tablet__fed__25_.png)

**Figure 3-24: Daneshmend 1984: KTZ 400 mg tablet, fed (25)**

<br>
<br>

<a id="figure-3-25"></a>

![](images/006_section_3/011_section_33/013_section_332/14_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_600_mg_tablet__fasted__22_.png)

**Figure 3-25: Daneshmend 1984: KTZ 600 mg tablet, fasted (22)**

<br>
<br>

<a id="figure-3-26"></a>

![](images/006_section_3/011_section_33/013_section_332/15_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_600_mg_tablet__fed__26_.png)

**Figure 3-26: Daneshmend 1984: KTZ 600 mg tablet, fed (26)**

<br>
<br>

<a id="figure-3-27"></a>

![](images/006_section_3/011_section_33/013_section_332/16_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_800_mg_tablet__fasted__23_.png)

**Figure 3-27: Daneshmend 1984: KTZ 800 mg tablet, fasted (23)**

<br>
<br>

<a id="figure-3-28"></a>

![](images/006_section_3/011_section_33/013_section_332/17_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_800_mg_tablet__fed__27_.png)

**Figure 3-28: Daneshmend 1984: KTZ 800 mg tablet, fed (27)**

<br>
<br>

<a id="figure-3-29"></a>

![](images/006_section_3/011_section_33/013_section_332/18_time_profile_plot_Ketoconazole_FDA__1998___KTZ_200_mg_tablet__fasted__85_.png)

**Figure 3-29: FDA 1998: KTZ 200 mg tablet, fasted (85)**

<br>
<br>

<a id="figure-3-30"></a>

![](images/006_section_3/011_section_33/013_section_332/19_time_profile_plot_Ketoconazole_FDA__1998___KTZ_200_mg_tablet__fasted__86_.png)

**Figure 3-30: FDA 1998: KTZ 200 mg tablet, fasted (86)**

<br>
<br>

<a id="figure-3-31"></a>

![](images/006_section_3/011_section_33/013_section_332/20_time_profile_plot_Ketoconazole_FDA__1998___KTZ_200_mg_tablet__fasted__89_.png)

**Figure 3-31: FDA 1998: KTZ 200 mg tablet, fasted (89)**

<br>
<br>

<a id="figure-3-32"></a>

![](images/006_section_3/011_section_33/013_section_332/21_time_profile_plot_Ketoconazole_FDA__1998___KTZ_200_mg_tablet__fed__87_.png)

**Figure 3-32: FDA 1998: KTZ 200 mg tablet, fed (87)**

<br>
<br>

<a id="figure-3-33"></a>

![](images/006_section_3/011_section_33/013_section_332/22_time_profile_plot_Ketoconazole_FDA__1998___KTZ_200_mg_tablet__fed__88_.png)

**Figure 3-33: FDA 1998: KTZ 200 mg tablet, fed (88)**

<br>
<br>

<a id="figure-3-34"></a>

![](images/006_section_3/011_section_33/013_section_332/23_time_profile_plot_Ketoconazole_Greenblatt__1998___KTZ_200_mg_tablet__twice_daily_for_5_days__fed__165_.png)

**Figure 3-34: Greenblatt 1998: KTZ 200 mg tablet b.i.d. 5d, fed (165)**

<br>
<br>

<a id="figure-3-35"></a>

![](images/006_section_3/011_section_33/013_section_332/24_time_profile_plot_Ketoconazole_Heel__1982___KTZ_100_mg_tablet__fasted__111_.png)

**Figure 3-35: Heel 1982: KTZ 100 mg tablet, fasted (111)**

<br>
<br>

<a id="figure-3-36"></a>

![](images/006_section_3/011_section_33/013_section_332/26_time_profile_plot_Ketoconazole_Heel__1982___KTZ_200_mg_tablet__fasted__112_.png)

**Figure 3-36: Heel 1982: KTZ 200 mg tablet, fasted (112)**

<br>
<br>

<a id="figure-3-37"></a>

![](images/006_section_3/011_section_33/013_section_332/27_time_profile_plot_Ketoconazole_Heel__1982___KTZ_400_mg_tablet__fasted__113_.png)

**Figure 3-37: Heel 1982: KTZ 400 mg tablet, fasted (113)**

<br>
<br>

<a id="figure-3-38"></a>

![](images/006_section_3/011_section_33/013_section_332/30_time_profile_plot_Ketoconazole_Huang__1986___KTZ_200_mg_tablet__fasted__1_.png)

**Figure 3-38: Huang 1986: KTZ 200 mg tablet, fasted (1)**

<br>
<br>

<a id="figure-3-39"></a>

![](images/006_section_3/011_section_33/013_section_332/33_time_profile_plot_Ketoconazole_Knupp__1993___KTZ_200_mg_tablet__fasted__37_.png)

**Figure 3-39: Knupp 1993: KTZ 200 mg tablet, fasted (37)**

<br>
<br>

<a id="figure-3-40"></a>

![](images/006_section_3/011_section_33/013_section_332/34_time_profile_plot_Ketoconazole_Mannisto__1982___KTZ_200_mg_tablet_juice__fasted__44_.png)

**Figure 3-40: Männistö 1982: KTZ 200 mg tablet juice, fasted (44)**

<br>
<br>

<a id="figure-3-41"></a>

![](images/006_section_3/011_section_33/013_section_332/35_time_profile_plot_Ketoconazole_Mannisto__1982___KTZ_200_mg_tablet__fasted__40_.png)

**Figure 3-41: Männistö 1982: KTZ 200 mg tablet, fasted (40)**

<br>
<br>

<a id="figure-3-42"></a>

![](images/006_section_3/011_section_33/013_section_332/36_time_profile_plot_Ketoconazole_Mannisto__1982___KTZ_200_mg_tablet__fasted__41_.png)

**Figure 3-42: Männistö 1982: KTZ 200 mg tablet, fasted (41)**

<br>
<br>

<a id="figure-3-43"></a>

![](images/006_section_3/011_section_33/013_section_332/37_time_profile_plot_Ketoconazole_Mannisto__1982___KTZ_200_mg_tablet__fasted__42_.png)

**Figure 3-43: Männistö 1982: KTZ 200 mg tablet, fasted (42)**

<br>
<br>

<a id="figure-3-44"></a>

![](images/006_section_3/011_section_33/013_section_332/38_time_profile_plot_Ketoconazole_Mannisto__1982___KTZ_200_mg_tablet__fed__43_.png)

**Figure 3-44: Männistö 1982: KTZ 200 mg tablet, fed (43)**

<br>
<br>

<a id="figure-3-45"></a>

![](images/006_section_3/011_section_33/013_section_332/39_time_profile_plot_Ketoconazole_Patel__2011___KTZ_200_mg_tablet__fasted__65_.png)

**Figure 3-45: Patel 2011: KTZ 200 mg tablet, fasted (65)**

<br>
<br>

<a id="figure-3-46"></a>

![](images/006_section_3/011_section_33/013_section_332/40_time_profile_plot_Ketoconazole_Piscitelli__1991___KTZ_400_mg_tablet__fasted__77_.png)

**Figure 3-46: Piscitelli 1991: KTZ 400 mg tablet, fasted (77)**

<br>
<br>

<a id="figure-3-47"></a>

![](images/006_section_3/011_section_33/013_section_332/41_time_profile_plot_Ketoconazole_Polk__1999___KTZ_400_mg_tablet__fasted__69_.png)

**Figure 3-47: Polk 1999: KTZ 400 mg tablet, fasted (69)**

<br>
<br>

<a id="figure-3-48"></a>

![](images/006_section_3/011_section_33/013_section_332/42_time_profile_plot_Ketoconazole_Sadeghnia__2005___KTZ_400_mg_tablet__fasted__70_.png)

**Figure 3-48: Sadeghnia 2005: KTZ 200 mg tablet, fasted (70)**

<br>
<br>

<a id="figure-3-49"></a>

![](images/006_section_3/011_section_33/013_section_332/43_time_profile_plot_Ketoconazole_Sadeghnia__2005___KTZ_400_mg_tablet__fasted__71_.png)

**Figure 3-49: Sadeghnia 2005: KTZ 200 mg tablet, fasted (71)**

<br>
<br>

<a id="figure-3-50"></a>

![](images/006_section_3/011_section_33/013_section_332/44_time_profile_plot_Ketoconazole_Sekar__2008___KTZ_200_mg_tablet__twice_daily_for_4_days__fed__103_.png)

**Figure 3-50: Sekar 2008: KTZ 200 mg tablet, fed (103)**

<br>
<br>

<a id="figure-3-51"></a>

![](images/006_section_3/011_section_33/013_section_332/45_time_profile_plot_Ketoconazole_Solomon__2007___KTZ_400_mg_tablet__fasted__72_.png)

**Figure 3-51: Solomon 2007: KTZ 400 mg tablet, fasted (72)**

<br>
<br>

<a id="figure-3-52"></a>

![](images/006_section_3/011_section_33/013_section_332/46_time_profile_plot_Ketoconazole_Solomon__2007___KTZ_400_mg_tablet__fasted__73_.png)

**Figure 3-52: Solomon 2007: KTZ 400 mg tablet, fasted (73)**

<br>
<br>

<a id="figure-3-53"></a>

![](images/006_section_3/011_section_33/013_section_332/49_time_profile_plot_Ketoconazole_Van_der_Meer__1980___KTZ_200_mg_tablet__fasted_ctrl__90_.png)

**Figure 3-53: Van der Meer 1980: KTZ 200 mg tablet, fasted ctrl (90)**

<br>
<br>

<a id="figure-3-54"></a>

![](images/006_section_3/011_section_33/013_section_332/50_time_profile_plot_Ketoconazole_Weiss__2022___KTZ_400_mg_tablet__fasted__168_.png)

**Figure 3-54: Weiss 2022: KTZ 400 mg tablet, fasted (168)**

<br>
<br>

<a id="figure-3-55"></a>

![](images/006_section_3/011_section_33/013_section_332/51_time_profile_plot_Ketoconazole_Wire__2007___KTZ_200_mg_tablet__fasted__94_.png)

**Figure 3-55: Wire 2007: KTZ 200 mg tablet, fasted (94)**

<br>
<br>

<a id="figure-3-56"></a>

![](images/006_section_3/011_section_33/013_section_332/52_time_profile_plot_Ketoconazole_Yuen__1999___KTZ_200_mg_tablet__fasted__96_.png)

**Figure 3-56: Yuen 1999: KTZ 200 mg tablet, fasted (96)**

<br>
<br>

<a id="figure-3-57"></a>

![](images/006_section_3/011_section_33/013_section_332/53_time_profile_plot_Ketoconazole_Yuen__1999___KTZ_200_mg_tablet__fasted__97_.png)

**Figure 3-57: Yuen 1999: KTZ 200 mg tablet, fasted (97)**

<br>
<br>

# 4 Conclusion<a id="4"></a>

The ketoconazole parent-metabolite PBPK model describes the evaluated oral plasma concentration-time data across doses of 100-1200 mg in adults. The evaluation includes single-dose and multiple-dose regimens, solution and solid oral formulations, fasted and fed conditions, and ketoconazole and N-deacetylketoconazole observations.

The model combines formulation-dependent absorption with arylacetamide deacetylase, CYP3A4, UGT, and P-gp processes. Ketoconazole, N-deacetylketoconazole, and N-deacetyl-N-hydroxyketoconazole also contain CYP3A4 and P-gp inhibition mechanisms.

The concentration-time profiles and goodness-of-fit diagnostics characterize model performance within the evaluated dose, regimen, formulation, food-condition, analyte, and adult population ranges. No formal acceptance criterion was applied. This compound report does not independently qualify DFI or DDI predictions.

The main limitations are the absence of intravenous data, estimated formulation and food-effect parameters, incomplete CYP3A4 and P-gp kinetic information, and limited metabolite data.

# 5 References<a id="5"></a>

[1] F Z Marok, J-G Wojtyniak, L M Fuhr, D Selzer, M Schwab, J Weiss, W E Haefeli, T Lehr. A Physiologically Based Pharmacokinetic Model of Ketoconazole and Its Metabolites as Drug-Drug Interaction Perpetrators. Pharmaceutics, 2023;15:679. doi: [10.3390/pharmaceutics15020679](https://doi.org/10.3390/pharmaceutics15020679).

[2] J Weiss, K I Foerster, M Weber, J Burhenne, G Mikus, T Lehr, W E Haefeli. Does the circulating ketoconazole metabolite N-deacetyl ketoconazole contribute to the drug-drug interaction potential of the parent compound? Eur J Pharm Sci, 2022;169:106076. doi: [10.1016/j.ejps.2021.106076](https://doi.org/10.1016/j.ejps.2021.106076).

[3] T Fukami, A Iida, K Konishi, M Nakajima. Human arylacetamide deacetylase hydrolyzes ketoconazole to trigger hepatocellular toxicity. Biochem Pharmacol, 2016;116:153-161. doi: [10.1016/j.bcp.2016.07.007](https://doi.org/10.1016/j.bcp.2016.07.007).

[4] W Fitch, T Tran, M Young, L Liu, Y Chen. Revisiting the Metabolism of Ketoconazole Using Accurate Mass. Drug Metab Lett, 2009;3:191-198. doi: [10.2174/187231209789352085](https://doi.org/10.2174/187231209789352085).

[5] D Schwab, H Fischer, A Tabatabaei, S Poli, J Huwyler. Comparison of in Vitro P-Glycoprotein Screening Assays: Recommendations for Their Use in Drug Discovery. J Med Chem, 2003;46:1716-1725. doi: [10.1021/jm021012t](https://doi.org/10.1021/jm021012t).

[6] K Bourcier, R Hyland, S Kempshall, R Jones, J Maximilien, N Irvine, B Jones. Investigation into UDP-Glucuronosyltransferase enzyme kinetics of imidazole- and triazole-containing antifungal drugs in human liver microsomes and recombinant UGT enzymes. Drug Metab Dispos, 2010;38:923-929. doi: [10.1124/dmd.109.030676](https://doi.org/10.1124/dmd.109.030676).

[7] R C Heel, R N Brogden, A Carmine, P A Morley, T M Speight, G S Avery. Ketoconazole: A Review of its Therapeutic Efficacy in Superficial and Systemic Fungal Infections. Drugs, 1982;23:1-36. doi: [10.2165/00003495-198223010-00001](https://doi.org/10.2165/00003495-198223010-00001).

[8] T K Daneshmend, D W Warnock, A Turner, C J C Roberts. Pharmacokinetics of ketoconazole in normal subjects. J Antimicrob Chemother, 1981;8:299-304. doi: [10.1093/jac/8.4.299](https://doi.org/10.1093/jac/8.4.299).

[9] T K Daneshmend, D W Warnock. Clinical Pharmacokinetics of Ketoconazole. Clin Pharmacokinet, 1988;14:13-34. doi: [10.2165/00003088-198814010-00002](https://doi.org/10.2165/00003088-198814010-00002).

[10] T K Daneshmend, D W Warnock, E M Johnson, G Parker, M D Richardson, C J C Roberts. Multiple dose pharmacokinetics of ketoconazole and their effects on antipyrine kinetics in man. J Antimicrob Chemother, 1983;12:185-188. doi: [10.1093/jac/12.2.185](https://doi.org/10.1093/jac/12.2.185).

[11] T K Daneshmend, D W Warnock, M D Ene, E M Johnson, M R Potten, M D Richardson, P J Williamson. Influence of food on the pharmacokinetics of ketoconazole. Antimicrob Agents Chemother, 1984;25:1-3. doi: [10.1128/AAC.25.1.1](https://doi.org/10.1128/AAC.25.1.1).

[12] Y-C Huang, J L Colaizzi, R H Bierman, R Woestenborghs, J J P Heykants. Pharmacokinetics and dose proportionality of ketoconazole in normal volunteers. Antimicrob Agents Chemother, 1986;30:206-210. doi: [10.1128/AAC.30.2.206](https://doi.org/10.1128/AAC.30.2.206).

[13] R E Polk, M A Crouch, D S Israel, A Pastor, B M Sadler, G E Chittick, W T Symonds, W Gouldin, Y Lou. Pharmacokinetic interaction between ketoconazole and amprenavir after single doses in healthy men. Pharmacotherapy, 1999;19:1378-1384. doi: [10.1592/phco.19.18.1378.30905](https://doi.org/10.1592/phco.19.18.1378.30905).

[14] M J Boyce, K J Baisley, S J Warrington. Pharmacokinetic interaction between domperidone and ketoconazole leads to QT prolongation in healthy volunteers: A randomized, placebo-controlled, double-blind, crossover study. Br J Clin Pharmacol, 2012;73:411-421. doi: [10.1111/j.1365-2125.2011.04093.x](https://doi.org/10.1111/j.1365-2125.2011.04093.x).

[15] P J Tiseo, C A Perdomo, L T Friedhoff. Concurrent administration of donepezil HCl and ketoconazole: Assessment of pharmacokinetic changes following single and multiple doses. Br J Clin Pharmacol, 1998;46 Suppl 1:30-34. doi: [10.1046/j.1365-2125.1998.0460s1030.x](https://doi.org/10.1046/j.1365-2125.1998.0460s1030.x).

[16] P C Craven, J R Graybill, J H Jorgensen, W E Dismukes, B E Levine. High-dose ketoconazole for treatment of fungal infections of the central nervous system. Ann Intern Med, 1983;98:160-167. doi: [10.7326/0003-4819-98-2-160](https://doi.org/10.7326/0003-4819-98-2-160).

[17] P T Männistö, R Mäntylä, S Nykänen, U Lamminsivu, P Ottoila. Impairing effect of food on ketoconazole absorption. Antimicrob Agents Chemother, 1982;21:730-733. doi: [10.1128/AAC.21.5.730](https://doi.org/10.1128/AAC.21.5.730).

[18] D J Greenblatt, C E Wright, L L von Moltke, J S Harmatz, B L Ehrenberg, L M Harrel, K Corbett, M Counihan, S Tobias, R I Shader. Ketoconazole inhibition of triazolam and alprazolam clearance: Differential kinetic and dynamic consequences. Clin Pharmacol Ther, 1998;64:237-247. doi: [10.1016/S0009-9236(98)90172-2](https://doi.org/10.1016/S0009-9236(98)90172-2).

[19] T W F Chin, M Loeb, I W Fong. Effects of an acidic beverage (Coca-Cola) on absorption of ketoconazole. Antimicrob Agents Chemother, 1995;39:1671-1675. doi: [10.1128/AAC.39.8.1671](https://doi.org/10.1128/AAC.39.8.1671).

[20] U.S. Food and Drug Administration. Bioequivalence, application number 74-971. 1998.

[21] C A Knupp, D C Brater, J Relue, R H Barbhaiya. Pharmacokinetics of didanosine and ketoconazole after coadministration to patients seropositive for the human immunodeficiency virus. J Clin Pharmacol, 1993;33:912-917.

[22] H R Sadeghnia, M Hassanzadeh-Khayyat. Bioequivalency study of two formulations of ketoconazole tablet in healthy volunteers. Iran J Pharm Sci, 2005;1:209-215.

[23] W D S Solomon, P Senthamil Selvan, K Y G Gowda, U K Mandal, T K Pal. Evaluation of bioequivalence of two formulations containing 200 mg of ketoconazole. Asian J Chem, 2007;19:5365-5371.

[24] J W M Van der Meer, J J Keuning, H W Scheijgrond, J Heykants, J Van Cutsem, J Brugmans. The influence of gastric acidity on the bioavailability of ketoconazole. J Antimicrob Chemother, 1980;6:552-554. doi: [10.1093/jac/6.4.552](https://doi.org/10.1093/jac/6.4.552).

[25] K H Yuen, J W Wong, N Billa, W P Choy, T Julianto. Comparative bioavailability study of two ketoconazole tablet preparations. Med J Malaysia, 1999;54:482-486.

[26] S C Piscitelli, T F Goss, J H Wilton, D T D'Andrea, H Goldstein, J J Schentag. Effects of ranitidine and sucralfate on ketoconazole bioavailability. Antimicrob Agents Chemother, 1991;35:1765-1771. doi: [10.1128/AAC.35.9.1765](https://doi.org/10.1128/AAC.35.9.1765).

[27] S Sriwiriyajan, W Mahatthanatrakul, W Ridtitid, S Jaruratanasirikul. Effect of efavirenz on the pharmacokinetics of ketoconazole in HIV-infected patients. Eur J Clin Pharmacol, 2007;63:479-483. doi: [10.1007/s00228-007-0282-8](https://doi.org/10.1007/s00228-007-0282-8).

[28] C G Patel, L Li, S Girgis, D M Kornhauser, E U Frevert, D W Boulton. Two-way pharmacokinetic interaction studies between saxagliptin and cytochrome P450 substrates or inhibitors: simvastatin, diltiazem extended-release, and ketoconazole. Clin Pharmacol Adv Appl, 2011;3:13-25. doi: [10.2147/CPAA.S15227](https://doi.org/10.2147/CPAA.S15227).

[29] M B Wire, C H Ballow, J Borland, M J Shelton, Y Lou, G Yuen, J Lin, E W Lewis. Fosamprenavir plus ritonavir increases plasma ketoconazole and ritonavir exposure, while amprenavir exposure remains unchanged. Antimicrob Agents Chemother, 2007;51:2982-2984. doi: [10.1128/AAC.00008-07](https://doi.org/10.1128/AAC.00008-07).

[30] V J Sekar, E Lefebvre, M De Pauw, T Vangeneugden, R M W Hoetelmans. Pharmacokinetics of darunavir/ritonavir and ketoconazole following co-administration in HIV-negative healthy volunteers. Br J Clin Pharmacol, 2008;66:215-221. doi: [10.1111/j.1365-2125.2008.03191.x](https://doi.org/10.1111/j.1365-2125.2008.03191.x).

[31] Chemicalize. Ketoconazole entry. Accessed 2021-05-01.

[32] H S Ghazal, A M Dyas, J L Ford, G A Hutcheon. The impact of food components on the intrinsic dissolution rate of ketoconazole. Drug Dev Ind Pharm, 2015;41:1647-1654.

[33] ChemSpider. Ketoconazole entry. Accessed 2021-05-01. [https://www.chemspider.com/Chemical-Structure.401695.html](https://www.chemspider.com/Chemical-Structure.401695.html).

[34] Open Systems Pharmacology Suite Community. Open Systems Pharmacology Suite Manual. 2018. [https://docs.open-systems-pharmacology.org/](https://docs.open-systems-pharmacology.org/).

[35] R S Fisher, E Rock, L S Malmud. Effects of meal composition on gallbladder and gastric emptying in man. Dig Dis Sci, 1987;32:1337-1344. doi: [10.1007/BF01296658](https://doi.org/10.1007/BF01296658).

[36] L M Berezhkovskiy. Volume of distribution at steady state for a linear pharmacokinetic system with peripheral elimination. J Pharm Sci, 2004;93:1628-1640. doi: [10.1002/jps.20073](https://doi.org/10.1002/jps.20073).

[37] E J Elder, J C Evans, B D Scherzer, J E Hitt, G B Kupperblatt, S A Saghir, D A Markham. Preparation, characterization, and scale-up of ketoconazole with enhanced dissolution and bioavailability. Drug Dev Ind Pharm, 2007;33:755-765. doi: [10.1080/03639040601031882](https://doi.org/10.1080/03639040601031882).

[38] Chemicalize. N-deacetylketoconazole entry. Accessed 2021-05-01.

[39] R Kawai, M Lemaire, J L Steimer, A Bruelisauer, W Niederberger, M Rowland. Physiologically based pharmacokinetic study on a cyclosporin derivative, SDZ IMM 125. J Pharmacokinet Biopharm, 1994;22:327-365.

[40] T Rodgers, M Rowland. Physiologically based pharmacokinetic modelling 2: predicting the tissue distribution of acids, very weak bases, neutrals and zwitterions. J Pharm Sci, 2006;95:1238-1257. doi: [10.1002/jps.20502](https://doi.org/10.1002/jps.20502).

[41] R J Rodriguez, D Acosta. Metabolism of ketoconazole and deacetylated ketoconazole by rat hepatic microsomes and flavin-containing monooxygenases. Drug Metab Dispos, 1997;25:772-777.

[42] Chemicalize. N-deacetyl-N-hydroxyketoconazole entry. Accessed 2021-05-01.

