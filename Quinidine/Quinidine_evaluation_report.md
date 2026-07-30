# Building and evaluation of a PBPK model for Quinidine in adults

| Version                                         | evaluation-OSP12.2                                                   |
| ----------------------------------------------- | ------------------------------------------------------------ |
| based on *Model Snapshot* and *Evaluation Plan* | https://github.com/Open-Systems-Pharmacology/Quinidine-Model/releases/tag/vevaluation |
| OSP Version                                     | 12.2                                                          |
| Qualification Framework Version                 | 3.5                                                          |

This evaluation report and the corresponding PK-Sim project file are filed at:

https://github.com/Open-Systems-Pharmacology/OSP-PBPK-Model-Library/

# Table of Contents

 * [1 Introduction](#1)
 * [2 Methods](#2)
   * [2.1 Modeling strategy](#21)
   * [2.2 Data used](#22)
   * [2.3 Model parameters and assumptions](#23)
 * [3 Results and Discussion](#3)
   * [3.1 Quinidine final input parameters](#31)
   * [3.2 Diagnostic plots](#32)
     * [3.2.1 Quinidine goodness-of-fit diagnostics](#321)
     * [3.2.2 3-Hydroxyquinidine goodness-of-fit diagnostics](#322)
   * [3.3 Concentration-time profiles](#33)
     * [3.3.1 Model Building](#331)
     * [3.3.2 Model Verification](#332)
 * [4 Conclusion](#4)
 * [5 References](#5)

# 1 Introduction<a id="1"></a>

Quinidine is an antiarrhythmic drug. It is metabolized by CYP3A4 to 3-hydroxyquinidine, transported by P-gp (ABCB1), and inhibits CYP2D6.

This quinidine model is intended to describe plasma concentration-time profiles of quinidine and 3-hydroxyquinidine after intravenous and oral administration.

The whole-body PBPK model of quinidine was developed by [Feick 2023](#5) using published clinical data for intravenous dosing, oral dosing, repeated dosing, different oral formulations, metabolite observations, and unbound quinidine observations where available. The model was later reused in the CYP2D6 network by [Rüdesheim 2025](#5).

The presented model includes the following features:

- quinidine and 3-hydroxyquinidine as parent and metabolite compounds,
- CYP3A4-mediated formation of 3-hydroxyquinidine,
- P-gp transport and renal P-gp secretion,
- CYP2D6 inhibition by quinidine and 3-hydroxyquinidine,
- passive renal filtration and enterohepatic circulation,
- intravenous infusion, oral solution, capsule, tablet, and multiple-dose applications.

# 2 Methods<a id="2"></a>

## 2.1 Modeling strategy<a id="21"></a>

The general concept of building a PBPK model has previously been described by Kuepfer et al. ([Kuepfer 2016](#5)). Relevant information on anthropometric and physiological parameters in adults was gathered from the literature and incorporated into PK-Sim as default values for adult simulations ([Willmann 2007](#5)).

The applied activity and variability of plasma proteins and active processes integrated into PK-Sim are described in the publicly available PK-Sim Ontogeny Database or otherwise referenced for the specific process.

The quinidine model was developed as a parent-metabolite PBPK model for quinidine and 3-hydroxyquinidine by [Feick 2023](#5). Model development used intravenous and oral clinical data to inform distribution, oral absorption, P-gp transport, CYP3A4-mediated metabolism, metabolite disposition, and renal elimination.

Clinical studies used for model building were selected to cover key structural information, including intravenous dosing, nonlinear oral exposure, repeated dosing, and metabolite observations. Verification simulations used independent oral and intravenous study arms, different dose levels and formulations, salt-intake conditions, and quinidine-only control arms from coadministration studies. This split preserves the training and test logic used for model evaluation.

The intravenous data support systemic distribution, renal elimination, and parent-metabolite disposition without the need to estimate oral absorption. Oral and repeated-dose studies then support absorption, nonlinear exposure, enterohepatic circulation, and transporter-related assumptions. The use of parent, metabolite, and unbound quinidine observations provides complementary checks on the structural model.

The model contains CYP3A4 metabolism to 3-hydroxyquinidine, P-gp transport, P-gp-mediated renal secretion, passive renal filtration, enterohepatic circulation, and CYP2D6 inhibition. Parent quinidine, 3-hydroxyquinidine, and unbound quinidine observations are evaluated separately where available.

The evaluated applications include intravenous infusion, oral solution, oral capsule, oral tablet, single-dose, and multiple-dose dosing. The major proteins and processes represented explicitly are CYP3A4, P-gp, CYP2D6 inhibition, plasma protein binding, passive renal filtration, renal secretion, and enterohepatic circulation. These processes make the quinidine model broader than a clearance-only substrate model.

The report evaluates total quinidine, unbound quinidine, and 3-hydroxyquinidine profiles where available. Model-building profiles are used to establish the structural assumptions, while verification profiles test independent doses, formulations, and quinidine-only control arms without additional fitting.

Details about input data are provided in Section 2.2. Details about the structural model and assumptions are provided in Section 2.3.

## 2.2 Data used<a id="22"></a>

### In vitro and physicochemical data

Drug-dependent parameters for quinidine and 3-hydroxyquinidine were taken from the published PBPK model and its supplement ([Feick 2023](#5)).

| Parameter | Unit | Value | Source | Description |
| --- | ---: | ---: | --- | --- |
| **Quinidine** |  |  |  |  |
| MW | g/mol | 324.42 | Literature ([DrugBank 2006](#5), [DrugBank Quinidine](#5)) | Molecular weight. |
| pK<sub>a</sub> | - | 4.02<sup>a</sup> | Literature ([Takano 2016](#5)) | Acid dissociation constant. |
| pK<sub>a</sub> | - | 9.05<sup>a</sup> | Literature ([DrugBank 2006](#5)) | Acid dissociation constant. |
| pK<sub>a</sub> | - | 13.89<sup>b</sup> | Literature ([DrugBank Quinidine](#5)) | Acid dissociation constant. |
| Solubility | g/L | 11.11 | Literature ([Grube 2009](#5)) | Aqueous solubility at pH 7.0. |
| logP | - | 2.51 | Literature ([DrugBank 2006](#5), [DrugBank Quinidine](#5)) | Octanol-water partition coefficient of the neutral species. |
| f<sub>u</sub> | % | 21 | Calculated ([Watanabe 2018](#5)) | Fraction unbound in plasma. |
| K<sub>m,P-gp</sub> | µmol/L | 0.23 | Literature ([Tachibana 2010](#5)) | Michaelis constant for quinidine. |
| k<sub>cat,P-gp</sub> | 1/min | 0.77 | Optimized ([Feick 2023](#5), Table S5) | Catalytic rate constant for quinidine. |
| K<sub>i,P-gp</sub> | µmol/L | 0.10 | Literature ([Lumen 2010](#5)) | Inhibition constant for P-gp. |
| K<sub>m,CYP3A4</sub> | µmol/L | 51.8 | Literature ([Nielsen 1999](#5), [Austin 2002](#5)) | Michaelis constant for formation of 3-hydroxyquinidine from quinidine. |
| k<sub>cat,CYP3A4</sub> | 1/min | 2.21 | Optimized ([Feick 2023](#5), Table S5) | Catalytic rate constant for formation of 3-hydroxyquinidine from quinidine. |
| K<sub>m,CYP3A4</sub> | µmol/L | 65.03 | Literature ([Nielsen 1999](#5), [Austin 2002](#5)) | Michaelis constant for formation of other metabolites from quinidine. |
| k<sub>cat,CYP3A4</sub> | 1/min | 3.84 | Optimized ([Feick 2023](#5), Table S5) | Catalytic rate constant for formation of other metabolites from quinidine. |
| K<sub>i,CYP2D6</sub> | µmol/L | 0.017 | Literature ([Moghadamnia 2003](#5)) | Inhibition constant for CYP2D6. |
| GFR fraction | - | 1.00 | Assumed ([Feick 2023](#5), Table S5) | Fraction used to scale passive glomerular filtration. |
| EHC fraction | - | 1.00 | Assumed ([Feick 2023](#5), Table S5) | Fraction released continuously into bile. |
| Partition coefficients | - | Berezhkovskiy | Calculated ([Berezhkovskiy 2004](#5)) | Tissue-to-plasma partition coefficients calculated with the Berezhkovskiy method. |
| Cellular permeabilities | cm/min | 7.99 × 10<sup>−3</sup> | Calculated, PK-Sim Standard ([Feick 2023](#5), Table S5) | Calculated cellular permeability. |
| P<sub>int</sub> | cm/min | 6.47 × 10<sup>−6</sup> | Optimized ([Feick 2023](#5), Table S5) | Specific transcellular intestinal permeability. |
| t<sub>50</sub> | min | 8.76 | Calculated from literature ([Nguyen 2006](#5), [Zhang 2010](#5)) | Time to dissolve 50% of the dose. |
| Weibull shape | - | 0.42 | Calculated from literature ([Nguyen 2006](#5), [Zhang 2010](#5)) | Shape parameter of the Weibull dissolution function. |
| **3-Hydroxyquinidine** |  |  |  |  |
| MW | g/mol | 340.42 | Literature ([DrugBank 3-Hydroxyquinidine](#5)) | Molecular weight. |
| pK<sub>a</sub> | - | 4.03<sup>a</sup> | Literature ([Chemicalize 2020](#5)) | Acid dissociation constant. |
| pK<sub>a</sub> | - | 8.63<sup>a</sup> | Literature ([Chemicalize 2020](#5)) | Acid dissociation constant. |
| pK<sub>a</sub> | - | 13.55<sup>b</sup> | Literature ([Chemicalize 2020](#5)) | Acid dissociation constant. |
| Solubility | g/L | 12.57 | Literature ([Chemicalize 2020](#5)) | Aqueous solubility at pH 7.0. |
| logP | - | 1.66 | Literature ([Chemicalize 2020](#5)) | Octanol-water partition coefficient of the neutral species. |
| f<sub>u</sub> | % | 31 | Calculated ([Watanabe 2018](#5)) | Fraction unbound in plasma. |
| CL<sub>CYP3A4</sub> | 1/min | 0.08 | Optimized ([Feick 2023](#5), Table S5) | CYP3A4-mediated clearance. |
| CL<sub>hep</sub> | 1/min | 0.45 | Optimized ([Feick 2023](#5), Table S5) | Unspecific hepatic clearance. |
| K<sub>i,CYP2D6</sub> | µmol/L | 2.30 | Literature ([Ching 1995](#5)) | Inhibition constant for CYP2D6. |
| GFR fraction | - | 1.00 | Assumed ([Feick 2023](#5), Table S5) | Fraction used to scale passive glomerular filtration. |
| EHC fraction | - | 1.00 | Assumed ([Feick 2023](#5), Table S5) | Fraction released continuously into bile. |
| Partition coefficients | - | Berezhkovskiy | Calculated ([Berezhkovskiy 2004](#5)) | Tissue-to-plasma partition coefficients calculated with the Berezhkovskiy method. |
| Cellular permeabilities | cm/min | 8.45 × 10<sup>−4</sup> | Calculated, PK-Sim Standard ([Feick 2023](#5), Table S5) | Calculated cellular permeability. |
| P<sub>int</sub> | cm/min | 2.94 × 10<sup>−6</sup> | Calculated ([Feick 2023](#5), Table S5) | Specific transcellular intestinal permeability. |

**Table 1:**<a name="table-1"></a> Drug-dependent physicochemical, distribution, absorption, metabolism, transport, elimination, and inhibition parameters from Supplement Table S5 of [Feick 2023](#5). Values are displayed at the precision reported in the supplement. Optimized values are shown without their confidence intervals.

<sup>a</sup> Basic. <sup>b</sup> Acidic.

### Clinical data

The evaluation uses 71 observed-data records and 43 plasma concentration-time profiles for quinidine and 3-hydroxyquinidine in peripheral venous blood plasma ([Table 2](#table-2)). Ten profiles were used for model building and 33 profiles were used for model verification.

| Source | Dose / schedule\* | Age [years] | Weight [kg] | Sex | N | Form. |
| --- | --- | --- | --- | --- | ---: | --- |
| [Andreasen 2007](#5)<sup>+</sup> | 200 mg quinidine sulfate, oral | 21–26 | 62–85 | Male | 10 | Capsule |
| [Bleske 1990](#5) | 400 mg quinidine sulfate, oral | 22–34 | NR | Male | 8 | Tablet |
| [Bolme 1977](#5) | 200 mg quinidine sulfate three times daily, oral | 26–33 | 73.4 (62–90) | Male | 5 | Tablet |
| [Bolme 1977](#5) | 300 mg quinidine sulfate three times daily, oral | 26–33 | 73.4 (62–90) | Male | 5 | Tablet |
| [Bolme 1977](#5) | 400 mg quinidine sulfate three times daily, oral | 26–33 | 68 (62–75) | Male | 3 | Tablet |
| [Ching 1991](#5) | 400 mg quinidine sulfate, oral | 22–29 | 60–94 | Male | 8 | Tablet |
| [Damkier 1999 (fluvoxamine)](#5) | 200 mg quinidine sulfate, oral | NR | NR | Male | 6 | Tablet |
| [Damkier 1999 (rifampicin)](#5) | 200 mg quinidine sulfate, oral | NR | NR | Male | 6 | Tablet |
| [Darbar 1997](#5) | 187.5 mg quinidine base, intravenous infusion over 30 min, high-salt diet | 28.6 (22–37) | 71.5 | Male | 9 | Solution |
| [Darbar 1997](#5) | 187.5 mg quinidine base, intravenous infusion over 30 min, low-salt diet | 28.6 (22–37) | 68.4 | Male | 9 | Solution |
| [Darbar 1997](#5) | 600 mg quinidine sulfate, oral, high-salt diet | 28.6 (22–37) | 71.5 | Male | 9 | Tablet |
| [Darbar 1997](#5) | 600 mg quinidine sulfate, oral, low-salt diet | 28.6 (22–37) | 68.4 | Male | 9 | Tablet |
| [Edwards 1987](#5) | 400 mg quinidine sulfate, oral | 23–34 | NR | Male | 6 | Tablet |
| [Fremstad 1979](#5) | 0.5 mmol quinidine gluconate, intravenous infusion over 60 min | NR | NR | NR | 7 | Solution |
| [Fremstad 1979](#5) | 1 mmol quinidine gluconate, intravenous infusion over 60 min | NR | NR | NR | 6 | Solution |
| [Frigo 1977](#5) | 600 mg quinidine sulfate, oral | 26.4 (23–37) | 67.1 (60–76) | Male | 8 | Tablet |
| [Guentert 1979](#5) | 3.74 mg/kg quinidine base, intravenous infusion over 25 min, subject EF first period | 23 | 70.4 | Male | 1 | Solution |
| [Guentert 1979](#5) | 3.74 mg/kg quinidine base, intravenous infusion over 25 min, subject EF second period | 23 | 72.2 | Male | 1 | Solution |
| [Guentert 1979](#5) | 3.74 mg/kg quinidine base, intravenous infusion over 25 min, subject RL | 32 | 82 | Male | 1 | Solution |
| [Hardy 1983](#5) | 400 mg quinidine sulfate, oral | 25–38 | NR | Male | 6 | Tablet |
| [Kaukonen 1997](#5) | 100 mg quinidine sulfate, oral | 25 (21–32) | 64 (41–80) | 56% female | 9 | Tablet |
| [Kolb 1984](#5) | 400 mg quinidine sulfate, oral | 21–35 | NR | Male | 9 | Tablet |
| [Laganière 1996](#5) | 200 mg quinidine sulfate, oral | 24 (19–37) | 75 (65–101) | Male | 12 | Tablet |
| [Maeda 2011](#5)<sup>+</sup> | 0.1 mg quinidine sulfate, oral | 27 | NR | Male | 7 | Solution |
| [Maeda 2011](#5)<sup>+</sup> | 1 mg quinidine sulfate, oral | 27 | NR | Male | 7 | Solution |
| [Maeda 2011](#5)<sup>+</sup> | 10 mg quinidine sulfate, oral | 27 | NR | Male | 7 | Solution |
| [Maeda 2011](#5)<sup>+</sup> | 100 mg quinidine sulfate, oral | 27 | NR | Male | 7 | Solution |
| [Mason 1976](#5) | 200 mg quinidine sulfate, oral | 22–40 | NR | 11% female | 13 | Solution |
| [Mason 1976](#5) | 200 mg quinidine sulfate, oral | 22–40 | NR | 11% female | 13 | Tablet |
| [Mason 1976](#5) | 200 mg quinidine sulfate, oral | 22–40 | NR | 11% female | 13 | Capsule |
| [Ochs 1978](#5) | 400 mg quinidine sulfate, oral | 28.9 (27–31) | 68.4 (57.7–79.5) | 43% female | 7 | Tablet |
| [Ochs 1978](#5)<sup>+</sup> | 400 mg then 200 mg quinidine sulfate four times daily, oral | 28.9 (27–31) | 68.4 (57.7–79.5) | 43% female | 7 | Tablet |
| [Ochs 1980](#5)<sup>+</sup> | 300 mg quinidine base, intravenous infusion over 15 min | 27 | 60 | Male | 1 | Solution |
| [Ochs 1980](#5)<sup>+</sup> | 300 mg quinidine base, intravenous infusion over 15 min | 23 | 80 | Male | 1 | Solution |
| [Rao 1995](#5) | 250 mg quinidine sulfate, oral | 18–26 | 48–62 | Male | 8 | Capsule |
| [Shin 2007](#5) | 4 mg/kg quinidine base, intravenous infusion over 20 min | 27.7 | 60.7 | Female | 6 | Solution |
| [Shin 2007](#5) | 4 mg/kg quinidine base, intravenous infusion over 20 min | 22.7 | 53.4 | Female | 12 | Solution |
| [Shin 2007](#5) | 4 mg/kg quinidine base, intravenous infusion over 20 min | 26.2 | 69.8 | Male | 7 | Solution |
| [Shin 2007](#5) | 4 mg/kg quinidine base, intravenous infusion over 20 min | 22.1 | 66.5 | Male | 12 | Solution |
| [Strum 1977](#5)<sup>+</sup> | 400 mg quinidine sulfate, oral, treatment A | 20–37 | NR | Male | 11 | Immediate-release tablet |
| [Strum 1977](#5)<sup>+</sup> | 400 mg quinidine sulfate, oral, treatment B | 20–37 | NR | Male | 11 | Immediate-release tablet |
| [Strum 1977](#5) | 400 mg quinidine sulfate, oral, treatment C | 20–37 | NR | Male | 11 | Immediate-release tablet |
| [Strum 1977](#5) | 400 mg quinidine sulfate, oral, treatment D | 20–37 | NR | Male | 11 | Immediate-release tablet |

**Table 2:**<a name="table-2"></a> Clinical quinidine concentration-time profiles used for model building and verification. Data are from Supplement Table S4 of [Feick 2023](#5). \*: Single dose unless otherwise specified. NR: not reported. <sup>+</sup>: data used for model building.

## 2.3 Model parameters and assumptions<a id="23"></a>

### Absorption

The model includes intravenous infusion and oral quinidine applications. Intravenous simulations do not require an absorption process. Oral quinidine absorption is represented with a Weibull formulation and compound-specific intestinal permeability.

The Weibull parameters were calculated from literature dissolution data with DDSolver. `Specific intestinal permeability` was optimized to describe the available oral formulation data. The clinical dataset includes solution, capsule, tablet, and multiple-dose scenarios, so formulation assumptions are central to the oral model evaluation.

The intravenous studies constrain systemic disposition separately from oral absorption. Oral simulations then use the same systemic disposition assumptions and add the Weibull formulation parameters. This is relevant because quinidine exposure can be affected by absorption rate, P-gp transport, metabolism, renal secretion, and enterohepatic circulation.

The same formulation concept is used across oral studies, with study-specific applications defining the administered dose and dosing schedule. The model does not use separate fitted absorption parameters for each clinical study arm.

### Distribution

Quinidine plasma protein binding was represented by a fraction unbound of 21%, and 3-hydroxyquinidine was represented with a fraction unbound of 31%, as summarized in [Section 2.2](#22).

Partition coefficients were calculated with the Berezhkovskiy method. Unbound quinidine profiles are included where available, which helps evaluate whether total and unbound concentrations are described consistently.

Separate compound properties are used for quinidine and 3-hydroxyquinidine. This is necessary because metabolite concentrations cannot be interpreted only as scaled parent concentrations. The availability of unbound quinidine data provides an additional check on whether the protein-binding assumption is compatible with the total-concentration profiles.

Distribution was not fitted separately by formulation, dose, or interaction scenario. The same adult physiological assumptions and compound-specific binding inputs are used across the evaluated simulations.

### Metabolism and elimination

Metabolism, transport, renal elimination, and inhibition processes are represented in the model.

* CYP3A4

Quinidine is metabolized by CYP3A4 to 3-hydroxyquinidine. CYP3A4 K<sub>m</sub> was taken from *in vitro* data corrected for microsomal binding, while CYP3A4 k<sub>cat</sub> was optimized.

CYP3A4 controls parent depletion and metabolite formation. The same enzymatic pathway therefore affects quinidine and 3-hydroxyquinidine profiles in opposite directions. Metabolite data are important for evaluating whether CYP3A4 formation is plausible and not only whether parent exposure is reproduced.

* P-gp (ABCB1)

P-gp transport is implemented for quinidine. The model includes P-gp-mediated transport relevant for intestinal handling and renal secretion.

P-gp was included because quinidine is a known transporter substrate and transporter-mediated renal secretion is part of the model structure. This process can influence both oral absorption and renal elimination, so it is evaluated together with formulation and renal profiles rather than as an isolated parameter.

* CYP2D6 inhibition

Quinidine and 3-hydroxyquinidine are represented as CYP2D6 inhibitors. Their CYP2D6 K<sub>i</sub> values are summarized in [Section 2.2](#22).

* Renal and residual elimination

The model includes passive renal filtration, renal secretion through P-gp, enterohepatic circulation, and 3-hydroxyquinidine unspecific hepatic clearance.

Renal elimination combines passive filtration with active secretion. Enterohepatic circulation is included to describe observed concentration-time behavior that cannot be explained by absorption and systemic clearance alone. The metabolite unspecific hepatic clearance accounts for downstream 3-hydroxyquinidine elimination.

# 3 Results and Discussion<a id="3"></a>

The PBPK model for quinidine was developed and evaluated with clinical pharmacokinetic data after intravenous and oral administration. The evaluation covers intravenous infusion, oral solution, capsule, and tablet applications, single-dose and multiple-dose regimens, quinidine and 3-hydroxyquinidine concentration-time profiles, and total and unbound quinidine observations where available.

The model-building data supported systemic disposition, absorption, formulation behavior, CYP3A4-mediated 3-hydroxyquinidine formation, renal elimination, P-gp transport, and enterohepatic circulation. Building studies included intravenous and oral quinidine data from [Ochs 1980](#5), [Maeda 2011](#5), [Andreasen 2007](#5), [Ochs 1978](#5), and [Strum 1977](#5). Verification used independent oral and intravenous studies, multiple formulations, metabolite observations, and quinidine-only control arms as summarized in [Section 2.2](#22).

The model includes CYP3A4-mediated formation of 3-hydroxyquinidine and other metabolites, P-gp transport, passive renal filtration, active renal secretion, enterohepatic circulation, and CYP2D6 inhibition. The 3-hydroxyquinidine observations inform metabolite formation and elimination.

The next sections show:

1. the final model input parameters for the building blocks in [Section 3.1](#31).
2. the overall goodness of fit in [Section 3.2](#32).
3. simulated vs. observed concentration-time profiles for the clinical studies used for model building and model verification in [Section 3.3](#33).

## 3.1 Quinidine final input parameters<a id="31"></a>

The compound parameter values of the final PBPK model are illustrated below.

### Compound: Quinidine

#### Parameters

Name                                             | Value                  | Value Origin                                                | Alternative                               | Default
------------------------------------------------ | ---------------------- | ----------------------------------------------------------- | ----------------------------------------- | -------
Solubility at reference pH                       | 11.11 mg/ml            | Publication-In Vitro-Grube 2009                             | quinidine sulfate solubility (Grube 2009) | True   
Reference pH                                     | 7                      | Publication-In Vitro-Grube 2009                             | quinidine sulfate solubility (Grube 2009) | True   
Lipophilicity                                    | 2.51 Log Units         | Internet-Unknown-drugbank                                   | Measurement                               | True   
Fraction unbound (plasma, reference value)       | 0.2108366055           | Publication-Other-Predicted, Watanabe et al. 2018           | Measurement                               | True   
Specific intestinal permeability (transcellular) | 6.472015277E-06 cm/min | Parameter Identification-Parameter Identification-Optimized | FIT                                       | True   
Is small molecule                                | Yes                    |                                                             |                                           |        
Molecular weight                                 | 324.42 g/mol           |                                                             |                                           |        
Plasma protein binding partner                   | Albumin                |                                                             |                                           |        

#### Calculation methods

Name                    | Value          
----------------------- | ---------------
Partition coefficients  | Berezhkovskiy  
Cellular permeabilities | PK-Sim Standard

#### Processes

##### Systemic Process: Glomerular Filtration-Assumption

Species: Human

###### Parameters

Name         | Value | Value Origin    
------------ | -----:| ----------------
GFR fraction |     1 | Other-Assumption

##### Inhibition: CYP2D6-Moghadamnia 2003

Molecule: CYP2D6

###### Parameters

Name | Value        | Value Origin                      
---- | ------------ | ----------------------------------
Ki   | 0.017 µmol/l | Publication-Other-Moghadamnia 2003

##### Inhibition: ABCB1-Lumen 2010

Molecule: ABCB1

###### Parameters

Name | Value      | Value Origin          
---- | ---------- | ----------------------
Ki   | 0.1 µmol/l | Publication-Lumen 2010

##### Metabolizing Enzyme: CYP3A4-Nielsen 1999 (3-Hydroxyquinidine), adjusted for fu,inc (70%)

Molecule: CYP3A4

Metabolite: 3-Hydroxyquinidine

###### Parameters

Name                               | Value                          | Value Origin                                                 
---------------------------------- | ------------------------------ | -------------------------------------------------------------
In vitro Vmax for liver microsomes | 1.097 nmol/min/mg mic. protein | Publication-In Vitro-Nielsen 1999                            
Km                                 | 51.8 µmol/l                    | Publication-In Vitro-Nielsen 1999, corrected for fu,inc (70%)
kcat                               | 2.2098117205 1/min             | Parameter Identification-Parameter Identification-Optimized  

##### Metabolizing Enzyme: CYP3A4-Nielsen 1999 (sink), adjusted for fu,inc (70%)

Molecule: CYP3A4

###### Parameters

Name                               | Value                         | Value Origin                                                 
---------------------------------- | ----------------------------- | -------------------------------------------------------------
In vitro Vmax for liver microsomes | 0.27 nmol/min/mg mic. protein | Publication-In Vitro-Nielsen 1999                            
Km                                 | 65.03 µmol/l                  | Publication-In Vitro-Nielsen 1999, corrected for fu,inc (70%)
kcat                               | 3.8413006533 1/min            | Parameter Identification-Parameter Identification-Optimized  

##### Transport Protein: ABCB1-Tachibana 2010

Molecule: ABCB1

###### Parameters

Name                      | Value              | Value Origin                                               
------------------------- | ------------------ | -----------------------------------------------------------
Transporter concentration | 1 µmol/l           |                                                            
Vmax                      | 0 µmol/l/min       |                                                            
Km                        | 0.23 µmol/l        | Publication-In Vitro-Tachibana 2010                        
kcat                      | 0.7653583636 1/min | Parameter Identification-Parameter Identification-Optimized

### Compound: 3-Hydroxyquinidine

#### Parameters

Name                                       | Value          | Value Origin                                      | Alternative | Default
------------------------------------------ | -------------- | ------------------------------------------------- | ----------- | -------
Solubility at reference pH                 | 12.57 mg/ml    | Unknown-Chemicalize                               | Measurement | True   
Reference pH                               | 7.4            | Unknown-Chemicalize                               | Measurement | True   
Lipophilicity                              | 1.66 Log Units | Internet-Unknown-Chemicalize                      | Predicted   | True   
Fraction unbound (plasma, reference value) | 0.3097         | Publication-Other-Predicted, Watanabe et al. 2018 | Measurement | True   
Is small molecule                          | Yes            |                                                   |             |        
Molecular weight                           | 340.4162 g/mol |                                                   |             |        
Plasma protein binding partner             | Albumin        |                                                   |             |        

#### Calculation methods

Name                    | Value          
----------------------- | ---------------
Partition coefficients  | Berezhkovskiy  
Cellular permeabilities | PK-Sim Standard

#### Processes

##### Inhibition: CYP2D6-Ching 1995

Molecule: CYP2D6

###### Parameters

Name | Value      | Value Origin          
---- | ---------- | ----------------------
Ki   | 2.3 µmol/l | Publication-Ching 1995

##### Systemic Process: Glomerular Filtration-Assumption

Species: Human

###### Parameters

Name         | Value | Value Origin            
------------ | -----:| ------------------------
GFR fraction |     1 | Other-Assumption-Assumed

##### Systemic Process: Total Hepatic Clearance-Assumption

Species: Human

###### Parameters

Name                          | Value              | Value Origin                                               
----------------------------- | ------------------ | -----------------------------------------------------------
Fraction unbound (experiment) | 0.15               |                                                            
Lipophilicity (experiment)    | 2.41 Log Units     |                                                            
Plasma clearance              | 0 ml/min/kg        |                                                            
Specific clearance            | 0.4523113726 1/min | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP3A4-Assumed

Species: Human

Molecule: CYP3A4

###### Parameters

Name                | Value              | Value Origin                                               
------------------- | ------------------ | -----------------------------------------------------------
Intrinsic clearance | 0 l/min            |                                                            
Specific clearance  | 0.0784146784 1/min | Parameter Identification-Parameter Identification-Optimized

## 3.2 Diagnostic plots<a id="32"></a>

The goodness-of-fit diagnostics are presented separately for quinidine and 3-hydroxyquinidine. This separation prevents parent and metabolite prediction errors from being hidden in a combined statistic or an ambiguous legend.

### 3.2.1 Quinidine goodness-of-fit diagnostics<a id="321"></a>

Below you find the goodness-of-fit visual diagnostic plots for quinidine plasma concentration data used in the model evaluation. Total and unbound quinidine are shown as separate groups.

The first plot shows observed versus simulated plasma concentration, the second weighted residuals versus time.

<a id="table-3-1"></a>

**Table 3-1: GMFE for Quinidine goodness-of-fit diagnostics**

|Group             |GMFE |
|:-----------------|:----|
|Quinidine         |1.36 |
|Quinidine unbound |1.24 |
|All               |1.36 |

<br>
<br>

<a id="figure-3-1"></a>

![](images/006_section_3/008_section_32/009_section_321/2_gof_plot_predictedVsObserved.png)

**Figure 3-1: Quinidine goodness-of-fit diagnostics**

<br>
<br>

<a id="figure-3-2"></a>

![](images/006_section_3/008_section_32/009_section_321/3_gof_plot_residualsOverTime.png)

**Figure 3-2: Quinidine goodness-of-fit diagnostics**

<br>
<br>

### 3.2.2 3-Hydroxyquinidine goodness-of-fit diagnostics<a id="322"></a>

Below you find the goodness-of-fit visual diagnostic plots for 3-hydroxyquinidine plasma concentration data used in the model evaluation.

The first plot shows observed versus simulated plasma concentration, the second weighted residuals versus time.

<a id="table-3-2"></a>

**Table 3-2: GMFE for 3-Hydroxyquinidine goodness-of-fit diagnostics**

|Group              |GMFE |
|:------------------|:----|
|3-Hydroxyquinidine |1.45 |

<br>
<br>

<a id="figure-3-3"></a>

![](images/006_section_3/008_section_32/010_section_322/5_gof_plot_predictedVsObserved.png)

**Figure 3-3: 3-Hydroxyquinidine goodness-of-fit diagnostics**

<br>
<br>

<a id="figure-3-4"></a>

![](images/006_section_3/008_section_32/010_section_322/6_gof_plot_residualsOverTime.png)

**Figure 3-4: 3-Hydroxyquinidine goodness-of-fit diagnostics**

<br>
<br>

## 3.3 Concentration-time profiles<a id="33"></a>

The concentration-time profiles show simulated and observed data for the model-building and model-verification datasets listed in [Section 2.2](#22). The profiles include intravenous and oral quinidine administration, total and unbound quinidine, and 3-hydroxyquinidine where available.

### 3.3.1 Model Building<a id="331"></a>

The following model-building profiles show the quinidine and 3-hydroxyquinidine data used to establish systemic disposition, oral input, and metabolite formation. They should be interpreted by route, formulation, and analyte.

<a id="figure-3-5"></a>

![](images/006_section_3/011_section_33/012_section_331/1_time_profile_plot_Quinidine_Andreasen__2007____quinidine_sulfate__po__200_mg__n_10.png)

**Figure 3-5: Andreasen 2007: quinidine sulfate, po, 200 mg, n=10**

<br>
<br>

<a id="figure-3-6"></a>

![](images/006_section_3/011_section_33/012_section_331/24_time_profile_plot_Quinidine_Maeda__2011____quinidine_sulfate__po__0_1_mg__n_7.png)

**Figure 3-6: Maeda 2011: quinidine sulfate, po, 0.1 mg, n=7**

<br>
<br>

<a id="figure-3-7"></a>

![](images/006_section_3/011_section_33/012_section_331/25_time_profile_plot_Quinidine_Maeda__2011____quinidine_sulfate__po__1_mg__n_7.png)

**Figure 3-7: Maeda 2011: quinidine sulfate, po, 1 mg, n=7**

<br>
<br>

<a id="figure-3-8"></a>

![](images/006_section_3/011_section_33/012_section_331/26_time_profile_plot_Quinidine_Maeda__2011____quinidine_sulfate__po__10_mg__n_7.png)

**Figure 3-8: Maeda 2011: quinidine sulfate, po, 10 mg, n=7**

<br>
<br>

<a id="figure-3-9"></a>

![](images/006_section_3/011_section_33/012_section_331/27_time_profile_plot_Quinidine_Maeda__2011____quinidine_sulfate__po__100_mg__n_7.png)

**Figure 3-9: Maeda 2011: quinidine sulfate, po, 100 mg, n=7**

<br>
<br>

<a id="figure-3-10"></a>

![](images/006_section_3/011_section_33/012_section_331/32_time_profile_plot_Quinidine_Ochs__1978____quinidine_sulfate__po__400_200_mg__multiple_dose__n_7.png)

**Figure 3-10: Ochs 1978: quinidine sulfate, po, 400/200 mg multiple dose, n=7**

<br>
<br>

<a id="figure-3-11"></a>

![](images/006_section_3/011_section_33/012_section_331/33_time_profile_plot_Quinidine_Ochs__1980____quinidine_gluconate__iv__300_mg_base__n_1___A.png)

**Figure 3-11: Ochs 1980: quinidine gluconate, iv, 300 mg base, n=1 - A**

<br>
<br>

<a id="figure-3-12"></a>

![](images/006_section_3/011_section_33/012_section_331/34_time_profile_plot_Quinidine_Ochs__1980____quinidine_gluconate__iv__300_mg_base__n_1___B.png)

**Figure 3-12: Ochs 1980: quinidine gluconate, iv, 300 mg base, n=1 - B**

<br>
<br>

<a id="figure-3-13"></a>

![](images/006_section_3/011_section_33/012_section_331/40_time_profile_plot_Quinidine_Strum__1977____quinidine_sulfate__400_mg__po__n_11___A.png)

**Figure 3-13: Strum 1977: quinidine sulfate, 400 mg, po, n=11 - A**

<br>
<br>

<a id="figure-3-14"></a>

![](images/006_section_3/011_section_33/012_section_331/41_time_profile_plot_Quinidine_Strum__1977____quinidine_sulfate__400_mg__po__n_11___B.png)

**Figure 3-14: Strum 1977: quinidine sulfate, 400 mg, po, n=11 - B**

<br>
<br>

### 3.3.2 Model Verification<a id="332"></a>

The following verification profiles compare the final model with independent quinidine datasets, including oral and intravenous applications and study-specific interaction conditions. Parent, metabolite, and unbound observations are interpreted as distinct endpoints.

<a id="figure-3-15"></a>

![](images/006_section_3/011_section_33/013_section_332/2_time_profile_plot_Quinidine_Bleske__1990____quinidine_sulfate__po__400_mg__n_8.png)

**Figure 3-15: Bleske 1990: quinidine sulfate, po, 400 mg, n=8**

<br>
<br>

<a id="figure-3-16"></a>

![](images/006_section_3/011_section_33/013_section_332/3_time_profile_plot_Quinidine_Bolme__1977____quinidine_sulfate__200_mg_three_times_daily__po__n_5.png)

**Figure 3-16: Bolme 1977: quinidine sulfate, 200 mg tid, po, n=5**

<br>
<br>

<a id="figure-3-17"></a>

![](images/006_section_3/011_section_33/013_section_332/4_time_profile_plot_Quinidine_Bolme__1977____quinidine_sulfate__300_mg_three_times_daily__po__n_5.png)

**Figure 3-17: Bolme 1977: quinidine sulfate, 300 mg tid, po, n=5**

<br>
<br>

<a id="figure-3-18"></a>

![](images/006_section_3/011_section_33/013_section_332/5_time_profile_plot_Quinidine_Bolme__1977____quinidine_sulfate__400_mg_three_times_daily__po__n_3.png)

**Figure 3-18: Bolme 1977: quinidine sulfate, 400 mg tid, po, n=3**

<br>
<br>

<a id="figure-3-19"></a>

![](images/006_section_3/011_section_33/013_section_332/6_time_profile_plot_Quinidine_Ching__1991____quinidine_sulfate__po__400_mg__n_8.png)

**Figure 3-19: Ching 1991: quinidine sulfate, po, 400 mg, n=8**

<br>
<br>

<a id="figure-3-20"></a>

![](images/006_section_3/011_section_33/013_section_332/7_time_profile_plot_Quinidine_Damkier__1999__fluvoxamine____quinidine_sulfate__200_mg__po__n_6.png)

**Figure 3-20: Damkier 1999 (fluvoxamine): quinidine sulfate, 200 mg, po, n=6**

<br>
<br>

<a id="figure-3-21"></a>

![](images/006_section_3/011_section_33/013_section_332/8_time_profile_plot_Quinidine_Damkier__1999__rifampicin____quinidine_sulfate__200_mg__po__n_6.png)

**Figure 3-21: Damkier 1999 (rifampicin): quinidine sulfate, 200 mg, po, n=6**

<br>
<br>

<a id="figure-3-22"></a>

![](images/006_section_3/011_section_33/013_section_332/9_time_profile_plot_Quinidine_Darbar__1997____quinidine_gluconate__iv__187_5_mg_base__high_salt__n_9.png)

**Figure 3-22: Darbar 1997: quinidine gluconate, iv, 187.5 mg base, high salt, n=9**

<br>
<br>

<a id="figure-3-23"></a>

![](images/006_section_3/011_section_33/013_section_332/10_time_profile_plot_Quinidine_Darbar__1997____quinidine_gluconate__iv__187_5_mg_base__low_salt__n_9.png)

**Figure 3-23: Darbar 1997: quinidine gluconate, iv, 187.5 mg base, low salt, n=9**

<br>
<br>

<a id="figure-3-24"></a>

![](images/006_section_3/011_section_33/013_section_332/11_time_profile_plot_Quinidine_Darbar__1997____quinidine_sulfate__po__600_mg__high_salt__n_9.png)

**Figure 3-24: Darbar 1997: quinidine sulfate, po, 600 mg, high salt, n=9**

<br>
<br>

<a id="figure-3-25"></a>

![](images/006_section_3/011_section_33/013_section_332/12_time_profile_plot_Quinidine_Darbar__1997____quinidine_sulfate__po__600_mg__low_salt__n_9.png)

**Figure 3-25: Darbar 1997: quinidine sulfate, po, 600 mg, low salt, n=9**

<br>
<br>

<a id="figure-3-26"></a>

![](images/006_section_3/011_section_33/013_section_332/13_time_profile_plot_Quinidine_Edwards__1987____quinidine_sulfate__400_mg__po__n_6.png)

**Figure 3-26: Edwards 1987: quinidine sulfate, 400 mg, po, n=6**

<br>
<br>

<a id="figure-3-27"></a>

![](images/006_section_3/011_section_33/013_section_332/14_time_profile_plot_Quinidine_Fremstad__1979____quinidine_gluconate__iv_infusion__0_5_mmol__n_7.png)

**Figure 3-27: Fremstad 1979: quinidine gluconate, iv infusion, 0.5 mmol, n=7**

<br>
<br>

<a id="figure-3-28"></a>

![](images/006_section_3/011_section_33/013_section_332/15_time_profile_plot_Quinidine_Fremstad__1979____quinidine_gluconate__iv_infusion__1_mmol__n_6.png)

**Figure 3-28: Fremstad 1979: quinidine gluconate, iv infusion, 1 mmol, n=6**

<br>
<br>

<a id="figure-3-29"></a>

![](images/006_section_3/011_section_33/013_section_332/16_time_profile_plot_Quinidine_Frigo__1977____quinidine_sulfate__600_mg__po__n_8.png)

**Figure 3-29: Frigo 1977: quinidine sulfate, 600 mg, po, n=8**

<br>
<br>

<a id="figure-3-30"></a>

![](images/006_section_3/011_section_33/013_section_332/17_time_profile_plot_Quinidine_Guentert__1979____QN_gluc__iv__3_74_mg_kg_base__n_1__EF_first_iv.png)

**Figure 3-30: Guentert 1979: quinidine gluconate, iv, 3.74 mg/kg base, n=1, EF first iv**

<br>
<br>

<a id="figure-3-31"></a>

![](images/006_section_3/011_section_33/013_section_332/18_time_profile_plot_Quinidine_Guentert__1979____QN_gluc__iv__3_74_mg_kg_base__n_1__EF_second_iv.png)

**Figure 3-31: Guentert 1979: quinidine gluconate, iv, 3.74 mg/kg base, n=1, EF second iv**

<br>
<br>

<a id="figure-3-32"></a>

![](images/006_section_3/011_section_33/013_section_332/19_time_profile_plot_Quinidine_Guentert__1979____QN_gluc__iv__3_74_mg_kg_base__n_1__RL.png)

**Figure 3-32: Guentert 1979: quinidine gluconate, iv, 3.74 mg/kg base, n=1, RL**

<br>
<br>

<a id="figure-3-33"></a>

![](images/006_section_3/011_section_33/013_section_332/20_time_profile_plot_Quinidine_Hardy__1983____quinidine_sulfate__400_mg__po__n_6.png)

**Figure 3-33: Hardy 1983: quinidine sulfate, 400 mg, po, n=6**

<br>
<br>

<a id="figure-3-34"></a>

![](images/006_section_3/011_section_33/013_section_332/21_time_profile_plot_Quinidine_Kaukonen__1997____quinidine_sulfate__100_mg__po__n_9.png)

**Figure 3-34: Kaukonen 1997: quinidine sulfate, 100 mg, po, n=9**

<br>
<br>

<a id="figure-3-35"></a>

![](images/006_section_3/011_section_33/013_section_332/22_time_profile_plot_Quinidine_Kolb__1984____quinidine_sulfate__400_mg__po__n_9.png)

**Figure 3-35: Kolb 1984: quinidine sulfate, 400 mg, po, n=9**

<br>
<br>

<a id="figure-3-36"></a>

![](images/006_section_3/011_section_33/013_section_332/23_time_profile_plot_Quinidine_Laganiere__1996____quinidine_sulfate__po__200_mg__n_12.png)

**Figure 3-36: Laganière 1996: quinidine sulfate, po, 200 mg, n=12**

<br>
<br>

<a id="figure-3-37"></a>

![](images/006_section_3/011_section_33/013_section_332/28_time_profile_plot_Quinidine_Mason__1976____quinidine_sulfate__po__200_mg__n_13___caps.png)

**Figure 3-37: Mason 1976: quinidine sulfate, po, 200 mg, n=13 - caps**

<br>
<br>

<a id="figure-3-38"></a>

![](images/006_section_3/011_section_33/013_section_332/29_time_profile_plot_Quinidine_Mason__1976____quinidine_sulfate__po__200_mg__n_13___sol.png)

**Figure 3-38: Mason 1976: quinidine sulfate, po, 200 mg, n=13 - sol**

<br>
<br>

<a id="figure-3-39"></a>

![](images/006_section_3/011_section_33/013_section_332/30_time_profile_plot_Quinidine_Mason__1976____quinidine_sulfate__po__200_mg__n_13___tab.png)

**Figure 3-39: Mason 1976: quinidine sulfate, po, 200 mg, n=13 - tab**

<br>
<br>

<a id="figure-3-40"></a>

![](images/006_section_3/011_section_33/013_section_332/31_time_profile_plot_Quinidine_Ochs__1978____quinidine_sulfate__po__400_mg__n_7.png)

**Figure 3-40: Ochs 1978: quinidine sulfate, po, 400 mg, n=7**

<br>
<br>

<a id="figure-3-41"></a>

![](images/006_section_3/011_section_33/013_section_332/35_time_profile_plot_Quinidine_Rao__1995____quinidine_sulfate__po__250_mg__n_8.png)

**Figure 3-41: Rao 1995: quinidine sulfate, po, 250 mg, n=8**

<br>
<br>

<a id="figure-3-42"></a>

![](images/006_section_3/011_section_33/013_section_332/36_time_profile_plot_Quinidine_Shin__2007____quinidine_base_4_mg_kg__iv__n_12___Korean_female.png)

**Figure 3-42: Shin 2007: quinidine base 4 mg/kg, iv, n=12 - Korean female**

<br>
<br>

<a id="figure-3-43"></a>

![](images/006_section_3/011_section_33/013_section_332/37_time_profile_plot_Quinidine_Shin__2007____quinidine_base_4_mg_kg__iv__n_12___Korean_male.png)

**Figure 3-43: Shin 2007: quinidine base 4 mg/kg, iv, n=12 - Korean male**

<br>
<br>

<a id="figure-3-44"></a>

![](images/006_section_3/011_section_33/013_section_332/38_time_profile_plot_Quinidine_Shin__2007____quinidine_base_4_mg_kg__iv__n_6___Caucasian_female.png)

**Figure 3-44: Shin 2007: quinidine base 4 mg/kg, iv, n=6 - Caucasian female**

<br>
<br>

<a id="figure-3-45"></a>

![](images/006_section_3/011_section_33/013_section_332/39_time_profile_plot_Quinidine_Shin__2007____quinidine_base_4_mg_kg__iv__n_7___Caucasian_male.png)

**Figure 3-45: Shin 2007: quinidine base 4 mg/kg, iv, n=7 - Caucasian male**

<br>
<br>

<a id="figure-3-46"></a>

![](images/006_section_3/011_section_33/013_section_332/42_time_profile_plot_Quinidine_Strum__1977____quinidine_sulfate__400_mg__po__n_11___C.png)

**Figure 3-46: Strum 1977: quinidine sulfate, 400 mg, po, n=11 - C**

<br>
<br>

<a id="figure-3-47"></a>

![](images/006_section_3/011_section_33/013_section_332/43_time_profile_plot_Quinidine_Strum__1977____quinidine_sulfate__400_mg__po__n_11___D.png)

**Figure 3-47: Strum 1977: quinidine sulfate, 400 mg, po, n=11 - D**

<br>
<br>

# 4 Conclusion<a id="4"></a>

The quinidine parent-metabolite PBPK model describes the evaluated plasma concentration-time data for quinidine and 3-hydroxyquinidine after intravenous and oral administration in adults. The evaluation includes single-dose and multiple-dose regimens, solution, capsule, and tablet formulations, total and unbound quinidine observations, and quinidine-only control arms from interaction studies.

The model combines CYP3A4-mediated 3-hydroxyquinidine formation with P-gp transport, passive renal filtration, active renal secretion, residual elimination, enterohepatic circulation, and CYP2D6 inhibition.

The concentration-time profiles and goodness-of-fit diagnostics characterize model performance within the evaluated dose, route, regimen, formulation, analyte, and adult population ranges. No formal acceptance criterion was applied.

The main limitations are sparse 3-hydroxyquinidine and unbound quinidine data, single-subject intravenous profiles, and heterogeneous oral formulations and regimens.

# 5 References<a id="5"></a>

[1] Feick D, Rüdesheim S, Marok FZ, Selzer D, Loer HLH, Teutonico D, et al. Physiologically-Based Pharmacokinetic Modeling of Quinidine to Establish a CYP3A4, P-gp and CYP2D6 Drug-Drug-Gene Interaction Network. CPT Pharmacometrics Syst Pharmacol. 2023;12:1143-1156. doi: [10.1002/psp4.12981](https://doi.org/10.1002/psp4.12981).

[2] Rüdesheim S, Loer HLH, Feick D, Marok FZ, Fuhr LM, Selzer D, et al. A Comprehensive CYP2D6 Drug-Drug-Gene Interaction Network for Application in Precision Dosing and Drug Development. Clin Pharmacol Ther. 2025;117:1719-1731. doi: [10.1002/cpt.3604](https://doi.org/10.1002/cpt.3604).

[3] Ochs HR, Grube E, Greenblatt DJ, Woo E, Bodem G. Intravenous quinidine: pharmacokinetic properties and effects on left ventricular performance in humans. Am Heart J. 1980;99:468-475. doi: [10.1016/0002-8703(80)90381-6](https://doi.org/10.1016/0002-8703(80)90381-6).

[4] Maeda K, Takano J, Ikeda Y, Fujita T, Oyama Y, Nozawa K, Kumagai Y, Sugiyama Y. Nonlinear pharmacokinetics of oral quinidine and verapamil in healthy subjects: a clinical microdosing study. Clin Pharmacol Ther. 2011;90:263-270. doi: [10.1038/clpt.2011.108](https://doi.org/10.1038/clpt.2011.108).

[5] Andreasen AH, Brøsen K, Damkier P. A comparative pharmacokinetic study in healthy volunteers of the effect of carbamazepine and oxcarbazepine on CYP3A4. Epilepsia. 2007;48:490-496. doi: [10.1111/j.1528-1167.2007.00924.x](https://doi.org/10.1111/j.1528-1167.2007.00924.x).

[6] Ochs HR, Greenblatt DJ, Woo E, Franke K, Pfeifer HJ, Smith TW. Single and multiple dose pharmacokinetics of oral quinidine sulfate and gluconate. Am J Cardiol. 1978;41:770-777. doi: [10.1016/0002-9149(78)90830-5](https://doi.org/10.1016/0002-9149(78)90830-5).

[7] Strum JD, Colaizzi JL, Jaffe JM, Martineau PC, Poust RI. Comparative bioavailability of four commercial quinidine sulfate tablets. J Pharm Sci. 1977;66:539-542. doi: [10.1002/jps.2600660420](https://doi.org/10.1002/jps.2600660420).

[8] Ching MS, Elliott SL, Stead CK, Murdoch RT, Devenish-Meares S, Morgan DJ, Smallwood RA. Quinidine pharmacokinetics and pharmacodynamics are unaltered by omeprazole. Aliment Pharmacol Ther. 1991;5:523-531. doi: [10.1111/j.1365-2036.1991.tb00521.x](https://doi.org/10.1111/j.1365-2036.1991.tb00521.x).

[9] Laganière S, Davies RF, Carignan G, et al. Pharmacokinetic and pharmacodynamic interactions between diltiazem and quinidine. Clin Pharmacol Ther. 1996;60:255-264. doi: [10.1016/S0009-9236(96)90052-1](https://doi.org/10.1016/S0009-9236(96)90052-1).

[10] Bleske BE, Carver PL, Annesley TM, Bleske JRM, Morady F. Effect of ciprofloxacin on quinidine pharmacokinetic and ECG parameters. J Clin Pharmacol. 1990;30:911-915. doi: [10.1002/j.1552-4604.1990.tb03570.x](https://doi.org/10.1002/j.1552-4604.1990.tb03570.x).

[11] Damkier P, Hansen LL, Brøsen K. Rifampicin treatment greatly increases apparent oral clearance of quinidine. Pharmacol Toxicol. 1999;85:257-262. doi: [10.1111/j.1600-0773.1999.tb02019.x](https://doi.org/10.1111/j.1600-0773.1999.tb02019.x).

[12] Edwards DJ, Lavoie R, Beckman H, Blevins R, Rubenfire M. Effect of verapamil on quinidine pharmacokinetics and metabolism. Clin Pharmacol Ther. 1987;41:68-73. doi: [10.1038/clpt.1987.11](https://doi.org/10.1038/clpt.1987.11).

[13] Hardy BG, Schentag JJ. Lack of effect of cimetidine on the metabolism of quinidine: effect on renal clearance. Int J Clin Pharmacol Ther Toxicol. 1983;26:388-391.

[14] Kolb KW, Garnett WR, Small RE, Vetrovec GW, Kline BJ, Fox T. Effect of cimetidine on quinidine clearance. Ther Drug Monit. 1984;6:306-312. doi: [10.1097/00007691-198409000-00009](https://doi.org/10.1097/00007691-198409000-00009).

[15] Darbar D, Dell'Orto S, Mörike K, Wilkinson GR, Roden DM. Dietary salt increases first-pass elimination of oral quinidine. Clin Pharmacol Ther. 1997;61:292-300. doi: [10.1016/S0009-9236(97)90161-2](https://doi.org/10.1016/S0009-9236(97)90161-2).

[16] Fremstad D, Nilsen OG, Storstein L, Amlie J, Jacobsen S. Pharmacokinetics of quinidine related to plasma protein binding in man. Eur J Clin Pharmacol. 1979;15:187-192. doi: [10.1007/BF00563104](https://doi.org/10.1007/BF00563104).

[17] Guentert TW, Holford NH, Coates PE, Upton RA, Riegelman S. Quinidine pharmacokinetics in man: choice of a disposition model and absolute bioavailability studies. J Pharmacokinet Biopharm. 1979;7:315-330. doi: [10.1007/BF01062532](https://doi.org/10.1007/BF01062532).

[18] Mason WD, Covinsky JO, Valentine JL, Kelly KL, Weddle OH, Martz BL. Comparative plasma concentrations of quinidine formulations. J Pharm Sci. 1976;65:1325-1329. doi: [10.1002/jps.2600650916](https://doi.org/10.1002/jps.2600650916).

[19] Bolme P, Otto U. Dose-dependence of the pharmacokinetics of quinidine. Eur J Clin Pharmacol. 1977;12:73-76. doi: [10.1007/BF00561409](https://doi.org/10.1007/BF00561409).

[20] Frigo GM, Perucca E, Teggia-Droghi M, Gatti G, Mussini A, Salerno J. Comparison of quinidine plasma concentration curves after oral formulations. Br J Clin Pharmacol. 1977;4:449-454. doi: [10.1111/j.1365-2125.1977.tb00760.x](https://doi.org/10.1111/j.1365-2125.1977.tb00760.x).

[21] Wishart DS, Knox C, Guo AC, et al. DrugBank: a comprehensive resource for in silico drug discovery and exploration. Nucleic Acids Res. 2006;34:D668-D672. doi: [10.1093/nar/gkj067](https://doi.org/10.1093/nar/gkj067).

[22] DrugBank. Quinidine. 2022. [DB00908](https://go.drugbank.com/drugs/DB00908).

[23] Takano J, Maeda K, Bolger MB, Sugiyama Y. The prediction of the relative importance of CYP3A/P-glycoprotein to the nonlinear intestinal absorption of drugs by advanced compartmental absorption and transit model. Drug Metab Dispos. 2016;44:1808-1818. doi: [10.1124/dmd.116.070011](https://doi.org/10.1124/dmd.116.070011).

[24] Tachibana T, Kitamura S, Kato M, et al. Model analysis of concentration-dependent permeability of P-gp substrates. Pharm Res. 2010;27:442-446. doi: [10.1007/s11095-009-0026-9](https://doi.org/10.1007/s11095-009-0026-9).

[25] Nielsen TL, Rasmussen BB, Flinois JP, Beaune P, Brøsen K. In vitro metabolism of quinidine: the (3S)-3-hydroxylation of quinidine is a specific marker reaction for cytochrome P-4503A4 activity in human liver microsomes. J Pharmacol Exp Ther. 1999;289:31-37.

[26] Moghadamnia AA, Rostami-Hodjegan A, Abdul-Manap R, Wright CE, Morice AH, Tucker GT. PBPK modelling of dextromethorphan inhibition by quinidine. Br J Clin Pharmacol. 2003;56:57-67. doi: [10.1046/j.1365-2125.2003.01853.x](https://doi.org/10.1046/j.1365-2125.2003.01853.x).

[27] Austin RP, Barton P, Cockroft SL, Wenlock MC, Riley RJ. The influence of nonspecific microsomal binding on apparent intrinsic clearance, and its prediction from physicochemical properties. Drug Metab Dispos. 2002;30:1497-1503. doi: [10.1124/dmd.30.12.1497](https://doi.org/10.1124/dmd.30.12.1497).

[28] Watanabe R, Esaki T, Kawashima H, et al. Predicting Fraction Unbound in Human Plasma from Chemical Structure: Improved Accuracy in the Low Value Ranges. Mol Pharm. 2018;15:5302-5311. doi: [10.1021/acs.molpharmaceut.8b00785](https://doi.org/10.1021/acs.molpharmaceut.8b00785).

[29] Rao BR, Rambhau D. Absence of a pharmacokinetic interaction between quinidine and diazepam. Drug Metabol Drug Interact. 1995;12:45-51. doi: [10.1515/dmdi.1995.12.1.45](https://doi.org/10.1515/dmdi.1995.12.1.45).

[30] Kaukonen KM, Olkkola KT, Neuvonen PJ. Itraconazole increases plasma concentrations of quinidine. Clin Pharmacol Ther. 1997;62:510-517. doi: [10.1016/S0009-9236(97)90046-1](https://doi.org/10.1016/S0009-9236(97)90046-1).

[31] Shin JG, Kang WK, Shon JH, Arefayene M, Yoon YR, Kim KA, Kim DI, Kim DS, Cho KH, Woosley RL, Flockhart DA. Possible interethnic differences in quinidine-induced QT prolongation between healthy Caucasian and Korean subjects. Br J Clin Pharmacol. 2007;63:206-215. doi: [10.1111/j.1365-2125.2006.02793.x](https://doi.org/10.1111/j.1365-2125.2006.02793.x).

[32] Kuepfer L, Niederalt C, Wendl T, Schlender JF, Willmann S, Lippert J, Block M, Eissing T, Teutonico D. Applied Concepts in PBPK Modeling: How to Build a PBPK/PD Model. CPT Pharmacometrics Syst Pharmacol. 2016;5:516-531. doi: [10.1002/psp4.12134](https://doi.org/10.1002/psp4.12134).

[33] Willmann S, Höhn K, Edginton A, Sevestre M, Solodenko J, Weiss W, Lippert J, Schmitt W. Development of a physiology-based whole-body population model for assessing the influence of individual variability on the pharmacokinetics of drugs. J Pharmacokinet Pharmacodyn. 2007;34:401-431. doi: [10.1007/s10928-007-9059-5](https://doi.org/10.1007/s10928-007-9059-5).

[34] Damkier P, Hansen LL, Brøsen K. Effect of fluvoxamine on the pharmacokinetics of quinidine. Eur J Clin Pharmacol. 1999;55:451-456. doi: [10.1007/s002280050655](https://doi.org/10.1007/s002280050655).

[35] Lumen AA, Acharya P, Polli JW, Ayrton A, Ellens H, Bentz J. If the K<sub>I</sub> is defined by the free energy of inhibitor binding to P-glycoprotein, which kinetic parameters define the IC<sub>50</sub> for the Madin-Darby canine kidney II cell line overexpressing human multidrug resistance 1 confluent cell monolayer? Drug Metab Dispos. 2010;38:260-269. doi: [10.1124/dmd.109.029843](https://doi.org/10.1124/dmd.109.029843).

[36] Ching MS, Blake CL, Ghabrial H, Ellis SW, Lennard MS, Tucker GT, Smallwood RA. Potent inhibition of yeast-expressed CYP2D6 by dihydroquinidine, quinidine, and its metabolites. Biochem Pharmacol. 1995;50:833-837. doi: [10.1016/0006-2952(95)00207-g](https://doi.org/10.1016/0006-2952(95)00207-g).

[37] Grube S, Langguth P, Junginger HE, Kopp S, Midha KK, Shah VP, Stavchansky S, Dressman JB, Barends DM. Biowaiver monographs for immediate release solid oral dosage forms: quinidine sulfate. J Pharm Sci. 2009;98:2238-2251. doi: [10.1002/jps.21606](https://doi.org/10.1002/jps.21606).

[38] DrugBank. 3-Hydroxyquinidine. [DBMET00382](https://go.drugbank.com/metabolites/DBMET00382).

[39] ChemAxon. Chemicalize. 2020.

[40] Berezhkovskiy LM. Volume of distribution at steady state for a linear pharmacokinetic system with peripheral elimination. J Pharm Sci. 2004;93:1628-1640. doi: [10.1002/jps.20073](https://doi.org/10.1002/jps.20073).

[41] Nguyen CA, Konan-Kouakou YN, Allémann E, Doelker E, Quintanar-Guerrero D, Fessi H, Gurny R. Preparation of surfactant-free nanoparticles of methacrylic acid copolymers used for film coating. AAPS PharmSciTech. 2006;7:1-7. doi: [10.1208/pt070363](https://doi.org/10.1208/pt070363).

[42] Zhang Y, Huo M, Zhou J, Zou A, Li W, Yao C, Xie S. DDSolver: an add-in program for modeling and comparison of drug dissolution profiles. AAPS J. 2010;12:263-271. doi: [10.1208/s12248-010-9185-1](https://doi.org/10.1208/s12248-010-9185-1).

