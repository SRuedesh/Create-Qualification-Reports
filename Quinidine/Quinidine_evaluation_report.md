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

Quinidine is an antiarrhythmic drug and a clinically relevant inhibitor and substrate in drug-drug interaction research. It is metabolized by CYP3A4 to 3-hydroxyquinidine, transported by P-gp, and is commonly used as a strong CYP2D6 inhibitor in interaction studies.

This quinidine model is intended to describe plasma concentration-time profiles of quinidine and 3-hydroxyquinidine after intravenous and oral administration. It supports CYP3A4, P-gp, and CYP2D6 drug-drug and drug-drug-gene interaction simulations.

The whole-body PBPK model of quinidine was developed by [Feick 2023](References.md) using published clinical data for intravenous dosing, oral dosing, repeated dosing, different oral formulations, metabolite observations, and unbound quinidine observations where available. The model was later reused in the CYP2D6 network by [Rüdesheim 2025](References.md).

The presented model includes the following features:

- quinidine and 3-hydroxyquinidine as parent and metabolite compounds,
- CYP3A4-mediated formation of 3-hydroxyquinidine,
- P-gp transport and renal P-gp secretion,
- CYP2D6 inhibition by quinidine and 3-hydroxyquinidine,
- passive renal filtration and enterohepatic circulation,
- intravenous infusion, oral solution, capsule, tablet, and multiple-dose applications.

# 2 Methods<a id="2"></a>

## 2.1 Modeling strategy<a id="21"></a>

The general concept of building a PBPK model has previously been described by Kuepfer et al. ([Kuepfer 2016](References.md)). Relevant information on anthropometric and physiological parameters in adults was gathered from the literature and incorporated into PK-Sim as default values for adult simulations ([Willmann 2007](References.md)).

The applied activity and variability of plasma proteins and active processes integrated into PK-Sim are described in the publicly available PK-Sim Ontogeny Database or otherwise referenced for the specific process.

The quinidine model was developed as a parent-metabolite PBPK model for quinidine and 3-hydroxyquinidine by [Feick 2023](References.md). Model development used intravenous and oral clinical data to inform distribution, oral absorption, P-gp transport, CYP3A4-mediated metabolism, metabolite disposition, and renal elimination.

Clinical studies used for model building were selected to cover key structural information, including intravenous dosing, nonlinear oral exposure, repeated dosing, and metabolite observations. Verification simulations used independent oral and intravenous study arms, different dose levels and formulations, salt-intake conditions, and inhibitor or inducer scenarios. This split preserves the training and test logic used for model evaluation.

The intravenous data support systemic distribution, renal elimination, and parent-metabolite disposition without the need to estimate oral absorption. Oral and repeated-dose studies then support absorption, nonlinear exposure, enterohepatic circulation, and transporter-related assumptions. The use of parent, metabolite, and unbound quinidine observations provides complementary checks on the structural model.

The model contains CYP3A4 metabolism to 3-hydroxyquinidine, P-gp transport, P-gp-mediated renal secretion, passive renal filtration, enterohepatic circulation, and CYP2D6 inhibition. Because quinidine is both a victim and a perpetrator compound, parent quinidine, 3-hydroxyquinidine, and unbound quinidine observations need to be interpreted separately where available.

The evaluated applications include intravenous infusion, oral solution, oral capsule, oral tablet, single-dose, and multiple-dose dosing. The major proteins and processes represented explicitly are CYP3A4, P-gp, CYP2D6 inhibition, plasma protein binding, passive renal filtration, renal secretion, and enterohepatic circulation. These processes make the quinidine model broader than a clearance-only substrate model.

The report therefore evaluates total quinidine, unbound quinidine, and 3-hydroxyquinidine profiles where available. Model-building profiles are used to establish the structural assumptions, while verification profiles test whether the model can reproduce independent dose, formulation, and interaction scenarios without additional fitting.

Details about input data are provided in Section 2.2. Details about the structural model and assumptions are provided in Section 2.3.

## 2.2 Data used<a id="22"></a>

### 2.2.1 In vitro and physicochemical data

The table below summarizes the drug-dependent inputs documented for the quinidine model.

| Parameter | Unit | Value | Source | Description |
| --- | ---: | ---: | --- | --- |
| Quinidine MW | g/mol | 324.42 | [DrugBank 2006](References.md); [DrugBank Quinidine](References.md) | Parent compound size used in concentration conversions. |
| Quinidine pK<sub>a</sub> | - | 4.02, 9.05, 13.89 | [Takano 2016](References.md); [DrugBank 2006](References.md); [DrugBank Quinidine](References.md) | Ionization constants. |
| Quinidine logP | - | 2.51 | [DrugBank 2006](References.md); [DrugBank Quinidine](References.md) | Distribution input. |
| Quinidine f<sub>u</sub> | % | 21 | [Watanabe 2018](References.md) | Plasma binding input. |
| Quinidine P-gp K<sub>m</sub> | µmol/L | 0.23 | [Tachibana 2010](References.md) | P-gp affinity parameter. |
| Quinidine P-gp k<sub>cat</sub> | 1/min | 0.77 | Optimized | P-gp transport capacity. |
| Quinidine CYP3A4 K<sub>m</sub> to 3-hydroxyquinidine | µmol/L | 51.8 | [Nielsen 1999](References.md); [Austin 2002](References.md) | CYP3A4 affinity parameter corrected for microsomal binding. |
| Quinidine CYP3A4 k<sub>cat</sub> to 3-hydroxyquinidine | 1/min | 2.21 | Optimized | CYP3A4 metabolite formation capacity. |
| Quinidine CYP2D6 K<sub>i</sub> | µmol/L | 0.017 | [Moghadamnia 2003](References.md) | CYP2D6 inhibition. |
| 3-Hydroxyquinidine f<sub>u</sub> | % | 31 | [Watanabe 2018](References.md) | Metabolite plasma binding input. |
| 3-Hydroxyquinidine unspecific CL<sub>hep</sub> | 1/min | 0.45 | Optimized | Metabolite elimination. |

### 2.2.2 Clinical data

The evaluation uses 71 observed-data records for quinidine and 3-hydroxyquinidine in peripheral venous blood plasma. The evaluation plan assigns 10 simulations to model building and 33 simulations to model verification.

Model-building clinical data:

| Publication | Arm / Treatment / Information used for model building |
| --- | --- |
| [Ochs 1980](References.md) | Plasma PK profiles in adults after intravenous infusion of 300 mg quinidine as base. |
| [Maeda 2011](References.md) | Plasma PK profiles in adults after oral solution administration of 0.1, 1, 10, and 100 mg quinidine with quinidine and 3-hydroxyquinidine measurements. |
| [Andreasen 2007](References.md) | Plasma PK profiles in adults after oral capsule administration of 200 mg quinidine sulfate. |
| [Ochs 1978](References.md) | Plasma PK profiles in adults after oral multiple-dose administration of quinidine sulfate. |
| [Strum 1977](References.md) | Plasma PK profiles in adults after oral tablet administration of 400 mg quinidine sulfate for model-building formulations. |

Model-verification clinical data:

| Publication | Arm / Treatment / Information used for model verification |
| --- | --- |
| [Ching 1991](References.md), [Laganière 1996](References.md), and [Bleske 1990](References.md) | Plasma PK profiles in adults after oral administration of 200 to 400 mg quinidine sulfate. |
| [Damkier 1999](References.md), [Edwards 1987](References.md), [Hardy 1988](References.md), and [Kolb 1984](References.md) | Plasma PK profiles in adults after oral administration of 200 to 400 mg quinidine sulfate in interaction settings. |
| [Rao 1995](References.md) and [Kaukonen 1997](References.md) | Plasma PK profiles in adults after oral administration of 100 to 250 mg quinidine sulfate. |
| [Bolme 1977](References.md), [Frigo 1977](References.md), [Mason 1976](References.md), and [Strum 1977](References.md) | Plasma PK profiles in adults after oral quinidine formulations and doses of 200 to 600 mg. |
| [Shin 2007](References.md), [Darbar 1997](References.md), [Fremstad 1979](References.md), and [Guentert 1979](References.md) | Plasma PK profiles in adults after intravenous or oral quinidine administration, including unbound quinidine or salt-intake conditions where available. |

## 2.3 Model parameters and assumptions<a id="23"></a>

### 2.3.1 Absorption

The model includes intravenous infusion and oral quinidine applications. Intravenous simulations do not require an absorption process. Oral quinidine absorption is represented with a Weibull formulation and compound-specific intestinal permeability.

`Weibull time`, `Weibull shape`, and `Specific intestinal permeability` were optimized to describe the available oral formulation data. The clinical dataset includes solution, capsule, tablet, and multiple-dose scenarios, so formulation assumptions are central to the oral model evaluation.

The intravenous studies constrain systemic disposition separately from oral absorption. Oral simulations then use the same systemic disposition assumptions and add the Weibull formulation parameters. This is relevant because quinidine exposure can be affected by absorption rate, P-gp transport, metabolism, renal secretion, and enterohepatic circulation.

The same formulation concept is used across oral studies, with study-specific applications defining the administered dose and dosing schedule. The model does not use separate fitted absorption parameters for each clinical study arm.

### 2.3.2 Distribution

Quinidine plasma protein binding was represented by a fraction unbound of 21%, and 3-hydroxyquinidine was represented with a fraction unbound of 31%, as summarized in Section 2.2.1.

Partition coefficients were calculated with the Rodgers and Rowland method. Unbound quinidine profiles are included where available, which helps evaluate whether total and unbound concentrations are described consistently.

Separate compound properties are used for quinidine and 3-hydroxyquinidine. This is necessary because metabolite concentrations cannot be interpreted only as scaled parent concentrations. The availability of unbound quinidine data provides an additional check on whether the protein-binding assumption is compatible with the total-concentration profiles.

Distribution was not fitted separately by formulation, dose, or interaction scenario. The same adult physiological assumptions and compound-specific binding inputs are used across the evaluated simulations.

### 2.3.3 Metabolism and Elimination

Metabolism, transport, renal elimination, and inhibition processes are represented in the model.

* CYP3A4

Quinidine is metabolized by CYP3A4 to 3-hydroxyquinidine. CYP3A4 K<sub>m</sub> was taken from *in vitro* data corrected for microsomal binding, while CYP3A4 k<sub>cat</sub> was optimized.

CYP3A4 controls parent depletion and metabolite formation. The same enzymatic pathway therefore affects quinidine and 3-hydroxyquinidine profiles in opposite directions. Metabolite data are important for evaluating whether CYP3A4 formation is plausible and not only whether parent exposure is reproduced.

* P-gp

P-gp transport is implemented for quinidine. The model includes P-gp-mediated transport relevant for intestinal handling and renal secretion.

P-gp was included because quinidine is a known transporter substrate and transporter-mediated renal secretion is part of the model structure. This process can influence both oral absorption and renal elimination, so it is evaluated together with formulation and renal profiles rather than as an isolated parameter.

* CYP2D6 inhibition

Quinidine and 3-hydroxyquinidine are represented as CYP2D6 inhibitors. The quinidine CYP2D6 K<sub>i</sub> is summarized in Section 2.2.1.

The inhibition component supports perpetrator simulations in drug-drug interaction scenarios. It is separated from the victim model components because inhibition potency should be sourced independently from parameters that describe quinidine disposition.

* Renal and residual elimination

The model includes passive renal filtration, renal secretion through P-gp, enterohepatic circulation, and 3-hydroxyquinidine unspecific hepatic clearance.

Renal elimination combines passive filtration with active secretion. Enterohepatic circulation is included to describe observed concentration-time behavior that cannot be explained by absorption and systemic clearance alone. The metabolite unspecific hepatic clearance accounts for downstream 3-hydroxyquinidine elimination.

### 2.3.4 Automated Parameter Identification

The following parameters were optimized by fitting the model to the data:

| Model Parameter |
| --- |
| `Specific intestinal permeability` |
| `Weibull time` |
| `Weibull shape` |
| P-gp k<sub>cat</sub> |
| CYP3A4 k<sub>cat</sub> |
| 3-hydroxyquinidine unspecific CL<sub>hep</sub> |

The optimized parameters were selected to cover oral absorption, transporter transport capacity, CYP3A4 formation, and metabolite elimination. Physicochemical, plasma-binding, and CYP2D6 inhibition values were kept as sourced inputs where possible. This preserves the distinction between disposition parameters fitted to quinidine clinical data and inhibition parameters used for perpetrator predictions.

# 3 Results and Discussion<a id="3"></a>

The PBPK model for quinidine was developed and evaluated with clinical pharmacokinetic data after intravenous and oral administration. The evaluation covers intravenous infusion, oral solution, capsule, and tablet applications, single-dose and multiple-dose regimens, quinidine and 3-hydroxyquinidine concentration-time profiles, total and unbound quinidine observations where available, and scenarios relevant to CYP3A4, P-gp, renal transport, and CYP2D6 inhibition.

The model-building data supported systemic disposition, absorption, formulation behavior, CYP3A4-mediated 3-hydroxyquinidine formation, renal elimination, P-gp transport, and enterohepatic circulation. Building studies included intravenous and oral quinidine data from [Ochs 1980](References.md), [Maeda 2011](References.md), [Andreasen 2007](References.md), [Ochs 1978](References.md), and [Strum 1977](References.md). Verification used a broad set of independent studies with oral and intravenous dosing, multiple formulations, metabolite observations, and interaction-relevant settings as summarized in Section 2.2.2.

The model quantifies CYP3A4-mediated formation of 3-hydroxyquinidine and other metabolites, P-gp transport, passive renal filtration, active renal secretion, enterohepatic circulation, and CYP2D6 inhibition. These mechanisms are all relevant to quinidine interpretation because the compound is used both as a victim drug and as a perpetrator in DDI and DDGI networks. The metabolite model is important because 3-hydroxyquinidine contributes information on CYP3A4-mediated formation and downstream clearance.

The next sections show:

1. the final model input parameters for the building blocks: [Section 3.1](Input_table.md).
2. the overall goodness of fit: [Section 3.2](GOF_diagnostics.md).
3. simulated vs. observed concentration-time profiles for the clinical studies used for model building and for model verification: [Section 3.3](Concentration_time_profiles.md).

[Feick 2023](References.md) reported two-fold agreement for quinidine concentration, AUClast, and Cmax predictions of 94%, 100%, and 100% in the training dataset and 90%, 97%, and 91% in the test dataset. For 3-hydroxyquinidine, the corresponding training values were 79%, 100%, and 80%, and the test values were 89%, 100%, and 100%. These metrics indicate that the model described most parent and metabolite concentration-time profiles and exposure metrics within conventional two-fold criteria.

In this evaluation, the merged GOF diagnostic over the included concentration observations gives GMFE values of 1.43 for quinidine, 1.45 for 3-hydroxyquinidine, and 1.43 for all observations. The similarity between parent and metabolite GMFE values supports the parent-metabolite structure, while the size and heterogeneity of the dataset require interpretation by dosing route, formulation, and analyte.

The concentration-time profiles should be reviewed separately for intravenous, immediate-release oral, sustained-release oral, and interaction-relevant studies. Intravenous studies test distribution and systemic clearance. Oral studies additionally test P-gp-mediated intestinal handling, dissolution assumptions, and enterohepatic circulation. Studies with metabolite observations test CYP3A4 formation and 3-hydroxyquinidine elimination. Unbound quinidine data provide a useful check on the protein-binding-dependent interpretation of total concentrations.

[Rüdesheim 2025](References.md) used quinidine in a larger CYP2D6 DDGI network. In that network, quinidine acts as a CYP2D6 and P-gp perpetrator and as a CYP3A4/P-gp victim. The current compound-level evaluation therefore supports, but does not by itself prove, DDGI network performance because network predictions also depend on victim-drug models and perpetrator interaction parameters.

The model is adequate for adult quinidine and 3-hydroxyquinidine simulations within the represented intravenous and oral dose range, formulations, and analytes. Remaining interpretation should be cautious for unrepresented dose regimens, populations, and DDGI network scenarios that depend on additional victim or perpetrator models.

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
Ki   | 0.017 µmol/l | Publication-Other-Mohagdamnia 2003

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

##### Inhibition: CYP2D6-Ching 1991

Molecule: CYP2D6

###### Parameters

Name | Value      | Value Origin          
---- | ---------- | ----------------------
Ki   | 2.3 µmol/l | Publication-Ching 1991

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

Below you find the goodness-of-fit visual diagnostic plots for the PBPK model performance of all data used presented in [Section 2.2.2](Section2.2_Data.md#222-clinical-data).

The first plot shows observed versus simulated plasma concentration, the second weighted residuals versus time.

### 3.2.1 Quinidine goodness-of-fit diagnostics<a id="321"></a>

Below you find the goodness-of-fit visual diagnostic plots for quinidine plasma concentration data used in the model evaluation.

The first plot shows observed versus simulated plasma concentration, the second weighted residuals versus time.

<a id="table-3-1"></a>

**Table 3-1: GMFE for Quinidine observed versus simulated plasma concentration-time data**

|Group     |GMFE |
|:---------|:----|
|Quinidine |1.36 |

<br>
<br>

<a id="figure-3-1"></a>

![](images/006_section_3/008_section_32/009_section_321/2_gof_plot_predictedVsObserved.png)

**Figure 3-1: Quinidine observed versus simulated plasma concentration-time data**

<br>
<br>

<a id="figure-3-2"></a>

![](images/006_section_3/008_section_32/009_section_321/3_gof_plot_residualsOverTime.png)

**Figure 3-2: Quinidine observed versus simulated plasma concentration-time data**

<br>
<br>

### 3.2.2 3-Hydroxyquinidine goodness-of-fit diagnostics<a id="322"></a>

Below you find the goodness-of-fit visual diagnostic plots for 3-hydroxyquinidine plasma concentration data used in the model evaluation.

The first plot shows observed versus simulated plasma concentration, the second weighted residuals versus time.

<a id="table-3-2"></a>

**Table 3-2: GMFE for 3-Hydroxyquinidine observed versus simulated plasma concentration-time data**

|Group              |GMFE |
|:------------------|:----|
|3-Hydroxyquinidine |1.45 |

<br>
<br>

<a id="figure-3-3"></a>

![](images/006_section_3/008_section_32/010_section_322/5_gof_plot_predictedVsObserved.png)

**Figure 3-3: 3-Hydroxyquinidine observed versus simulated plasma concentration-time data**

<br>
<br>

<a id="figure-3-4"></a>

![](images/006_section_3/008_section_32/010_section_322/6_gof_plot_residualsOverTime.png)

**Figure 3-4: 3-Hydroxyquinidine observed versus simulated plasma concentration-time data**

<br>
<br>

## 3.3 Concentration-time profiles<a id="33"></a>

Simulated versus observed concentration-time profiles of all data listed in [Section 2.2.2](Section2.2_Data.md#222-clinical-data) are presented below.

### 3.3.1 Model Building<a id="331"></a>

<a id="figure-3-5"></a>

![](images/006_section_3/011_section_33/012_section_331/1_time_profile_plot_Quinidine_Andreasen__2007____quinidine_sulfate__po__200_mg__n_10.png)

**Figure 3-5: Time Profile Analysis**

<br>
<br>

<a id="figure-3-6"></a>

![](images/006_section_3/011_section_33/012_section_331/2_time_profile_plot_Quinidine_Ochs__1978____quinidine_sulfate__po__400_200_mg_md__n_7.png)

**Figure 3-6: Time Profile Analysis**

<br>
<br>

<a id="figure-3-7"></a>

![](images/006_section_3/011_section_33/012_section_331/5_time_profile_plot_Quinidine_Ochs__1980____quinidine_gluconate__iv__300_mg_base__n_1___A.png)

**Figure 3-7: Time Profile Analysis**

<br>
<br>

<a id="figure-3-8"></a>

![](images/006_section_3/011_section_33/012_section_331/6_time_profile_plot_Quinidine_Ochs__1980____quinidine_gluconate__iv__300_mg_base__n_1___B.png)

**Figure 3-8: Time Profile Analysis**

<br>
<br>

<a id="figure-3-9"></a>

![](images/006_section_3/011_section_33/012_section_331/16_time_profile_plot_Quinidine_Maeda__2011____quinidine_sulfate__po__0_1_mg__n_7.png)

**Figure 3-9: Time Profile Analysis**

<br>
<br>

<a id="figure-3-10"></a>

![](images/006_section_3/011_section_33/012_section_331/17_time_profile_plot_Quinidine_Maeda__2011____quinidine_sulfate__po__1_mg__n_7.png)

**Figure 3-10: Time Profile Analysis**

<br>
<br>

<a id="figure-3-11"></a>

![](images/006_section_3/011_section_33/012_section_331/18_time_profile_plot_Quinidine_Maeda__2011____quinidine_sulfate__po__10_mg__n_7.png)

**Figure 3-11: Time Profile Analysis**

<br>
<br>

<a id="figure-3-12"></a>

![](images/006_section_3/011_section_33/012_section_331/19_time_profile_plot_Quinidine_Maeda__2011____quinidine_sulfate__po__100_mg__n_7.png)

**Figure 3-12: Time Profile Analysis**

<br>
<br>

<a id="figure-3-13"></a>

![](images/006_section_3/011_section_33/012_section_331/20_time_profile_plot_Quinidine_Strum__1977____quinidine_sulfate__400_mg__po__n_11___A.png)

**Figure 3-13: Time Profile Analysis**

<br>
<br>

<a id="figure-3-14"></a>

![](images/006_section_3/011_section_33/012_section_331/21_time_profile_plot_Quinidine_Strum__1977____quinidine_sulfate__400_mg__po__n_11___B.png)

**Figure 3-14: Time Profile Analysis**

<br>
<br>

### 3.3.2 Model Verification<a id="332"></a>

<a id="figure-3-15"></a>

![](images/006_section_3/011_section_33/013_section_332/3_time_profile_plot_Quinidine_Ochs__1978____quinidine_sulfate__po__400_mg__n_7.png)

**Figure 3-15: Time Profile Analysis**

<br>
<br>

<a id="figure-3-16"></a>

![](images/006_section_3/011_section_33/013_section_332/4_time_profile_plot_Quinidine_Ching__1991____quinidine_sulfate__po__400_mg__n_8.png)

**Figure 3-16: Time Profile Analysis**

<br>
<br>

<a id="figure-3-17"></a>

![](images/006_section_3/011_section_33/013_section_332/7_time_profile_plot_Quinidine_Laganiere__1996____quinidine_sulfate__po__200_mg__n_12.png)

**Figure 3-17: Time Profile Analysis**

<br>
<br>

<a id="figure-3-18"></a>

![](images/006_section_3/011_section_33/013_section_332/8_time_profile_plot_Quinidine_Bleske__1990____quinidine_sulfate__po__400_mg__n_8.png)

**Figure 3-18: Time Profile Analysis**

<br>
<br>

<a id="figure-3-19"></a>

![](images/006_section_3/011_section_33/013_section_332/9_time_profile_plot_Quinidine_Damkier__1999____quinidine_sulfate__200_mg__po__n_6.png)

**Figure 3-19: Time Profile Analysis**

<br>
<br>

<a id="figure-3-20"></a>

![](images/006_section_3/011_section_33/013_section_332/10_time_profile_plot_Quinidine_Damkier__1999a____quinidine_sulfate__200_mg__po__n_6.png)

**Figure 3-20: Time Profile Analysis**

<br>
<br>

<a id="figure-3-21"></a>

![](images/006_section_3/011_section_33/013_section_332/11_time_profile_plot_Quinidine_Edwards__1987____quinidine_sulfate__400_mg__po__n_6.png)

**Figure 3-21: Time Profile Analysis**

<br>
<br>

<a id="figure-3-22"></a>

![](images/006_section_3/011_section_33/013_section_332/12_time_profile_plot_Quinidine_Hardy__1983____quinidine_sulfate__400_mg__po__n_6.png)

**Figure 3-22: Time Profile Analysis**

<br>
<br>

<a id="figure-3-23"></a>

![](images/006_section_3/011_section_33/013_section_332/13_time_profile_plot_Quinidine_Kolb__1984____quinidine_sulfate__400_mg__po__n_9.png)

**Figure 3-23: Time Profile Analysis**

<br>
<br>

<a id="figure-3-24"></a>

![](images/006_section_3/011_section_33/013_section_332/14_time_profile_plot_Quinidine_Rao__1995____quinidine_sulfate__po__250_mg__n_8.png)

**Figure 3-24: Time Profile Analysis**

<br>
<br>

<a id="figure-3-25"></a>

![](images/006_section_3/011_section_33/013_section_332/15_time_profile_plot_Quinidine_Kaukonen__1997____quinidine_sulfate__100_mg__po__n_9.png)

**Figure 3-25: Time Profile Analysis**

<br>
<br>

<a id="figure-3-26"></a>

![](images/006_section_3/011_section_33/013_section_332/22_time_profile_plot_Quinidine_Strum__1977____quinidine_sulfate__400_mg__po__n_11___C.png)

**Figure 3-26: Time Profile Analysis**

<br>
<br>

<a id="figure-3-27"></a>

![](images/006_section_3/011_section_33/013_section_332/23_time_profile_plot_Quinidine_Strum__1977____quinidine_sulfate__400_mg__po__n_11___D.png)

**Figure 3-27: Time Profile Analysis**

<br>
<br>

<a id="figure-3-28"></a>

![](images/006_section_3/011_section_33/013_section_332/24_time_profile_plot_Quinidine_Bolme__1977____quinidine_sulfate__400_mg_tid__po__n_3.png)

**Figure 3-28: Time Profile Analysis**

<br>
<br>

<a id="figure-3-29"></a>

![](images/006_section_3/011_section_33/013_section_332/25_time_profile_plot_Quinidine_Bolme__1977____quinidine_sulfate__300_mg_tid__po__n_5.png)

**Figure 3-29: Time Profile Analysis**

<br>
<br>

<a id="figure-3-30"></a>

![](images/006_section_3/011_section_33/013_section_332/26_time_profile_plot_Quinidine_Bolme__1977____quinidine_sulfate__200_mg_tid__po__n_5.png)

**Figure 3-30: Time Profile Analysis**

<br>
<br>

<a id="figure-3-31"></a>

![](images/006_section_3/011_section_33/013_section_332/27_time_profile_plot_Quinidine_Frigo__1977____quinidine_sulfate__600_mg__po__n_8.png)

**Figure 3-31: Time Profile Analysis**

<br>
<br>

<a id="figure-3-32"></a>

![](images/006_section_3/011_section_33/013_section_332/28_time_profile_plot_Quinidine_Mason__1976____quinidine_sulfate__po__200_mg__n_13___tab.png)

**Figure 3-32: Time Profile Analysis**

<br>
<br>

<a id="figure-3-33"></a>

![](images/006_section_3/011_section_33/013_section_332/29_time_profile_plot_Quinidine_Mason__1976____quinidine_sulfate__po__200_mg__n_13___sol.png)

**Figure 3-33: Time Profile Analysis**

<br>
<br>

<a id="figure-3-34"></a>

![](images/006_section_3/011_section_33/013_section_332/30_time_profile_plot_Quinidine_Mason__1976____quinidine_sulfate__po__200_mg__n_13___caps.png)

**Figure 3-34: Time Profile Analysis**

<br>
<br>

<a id="figure-3-35"></a>

![](images/006_section_3/011_section_33/013_section_332/31_time_profile_plot_Quinidine_Shin__2007____quinidine_base_4_mg_kg__iv__n_12___Korean_male.png)

**Figure 3-35: Time Profile Analysis**

<br>
<br>

<a id="figure-3-36"></a>

![](images/006_section_3/011_section_33/013_section_332/32_time_profile_plot_Quinidine_Shin__2007____quinidine_base_4_mg_kg__iv__n_12___Korean_female.png)

**Figure 3-36: Time Profile Analysis**

<br>
<br>

<a id="figure-3-37"></a>

![](images/006_section_3/011_section_33/013_section_332/33_time_profile_plot_Quinidine_Shin__2007____quinidine_base_4_mg_kg__iv__n_7___Caucasian_male.png)

**Figure 3-37: Time Profile Analysis**

<br>
<br>

<a id="figure-3-38"></a>

![](images/006_section_3/011_section_33/013_section_332/34_time_profile_plot_Quinidine_Shin__2007____quinidine_base_4_mg_kg__iv__n_6___Caucasian_female.png)

**Figure 3-38: Time Profile Analysis**

<br>
<br>

<a id="figure-3-39"></a>

![](images/006_section_3/011_section_33/013_section_332/35_time_profile_plot_Quinidine_Darbar__1997____quinidine_gluconate__iv__187_5_mg_base__high_salt__n_9.png)

**Figure 3-39: Time Profile Analysis**

<br>
<br>

<a id="figure-3-40"></a>

![](images/006_section_3/011_section_33/013_section_332/36_time_profile_plot_Quinidine_Darbar__1997____quinidine_sulfate__po__600_mg__high_salt__n_9.png)

**Figure 3-40: Time Profile Analysis**

<br>
<br>

<a id="figure-3-41"></a>

![](images/006_section_3/011_section_33/013_section_332/37_time_profile_plot_Quinidine_Darbar__1997____quinidine_sulfate__po__600_mg__low_salt__n_9.png)

**Figure 3-41: Time Profile Analysis**

<br>
<br>

<a id="figure-3-42"></a>

![](images/006_section_3/011_section_33/013_section_332/38_time_profile_plot_Quinidine_Darbar__1997____quinidine_gluconate__iv__187_5_mg_base__low_salt__n_9.png)

**Figure 3-42: Time Profile Analysis**

<br>
<br>

<a id="figure-3-43"></a>

![](images/006_section_3/011_section_33/013_section_332/39_time_profile_plot_Quinidine_Fremstad__1979____quinidine_gluconate__iv_infusion__0_5_mmol__n_7.png)

**Figure 3-43: Time Profile Analysis**

<br>
<br>

<a id="figure-3-44"></a>

![](images/006_section_3/011_section_33/013_section_332/40_time_profile_plot_Quinidine_Fremstad__1979____quinidine_gluconate__iv_infusion__1_mmol__n_6.png)

**Figure 3-44: Time Profile Analysis**

<br>
<br>

<a id="figure-3-45"></a>

![](images/006_section_3/011_section_33/013_section_332/41_time_profile_plot_Quinidine_Guentert__1979____QN_gluc__iv__3_74_mg_kg_base__n_1__EF_first_iv.png)

**Figure 3-45: Time Profile Analysis**

<br>
<br>

<a id="figure-3-46"></a>

![](images/006_section_3/011_section_33/013_section_332/42_time_profile_plot_Quinidine_Guentert__1979____QN_gluc__iv__3_74_mg_kg_base__n_1__EF_second_iv.png)

**Figure 3-46: Time Profile Analysis**

<br>
<br>

<a id="figure-3-47"></a>

![](images/006_section_3/011_section_33/013_section_332/43_time_profile_plot_Quinidine_Guentert__1979____QN_gluc__iv__3_74_mg_kg_base__n_1__RL.png)

**Figure 3-47: Time Profile Analysis**

<br>
<br>

# 4 Conclusion<a id="4"></a>

The presented PBPK model adequately describes the intravenous and oral pharmacokinetics of quinidine and 3-hydroxyquinidine in the evaluated adult clinical studies and represented formulations.

# 5 References<a id="5"></a>

1. Feick D, Rüdesheim S, Marok FZ, Selzer D, Loer HLH, Teutonico D, et al. Physiologically-Based Pharmacokinetic Modeling of Quinidine to Establish a CYP3A4, P-gp and CYP2D6 Drug-Drug-Gene Interaction Network. CPT Pharmacometrics Syst Pharmacol. 2023;12:1143-1156. doi:10.1002/psp4.12981.
2. Rüdesheim S, Loer HLH, Feick D, Marok FZ, Fuhr LM, Selzer D, et al. A Comprehensive CYP2D6 Drug-Drug-Gene Interaction Network for Application in Precision Dosing and Drug Development. Clin Pharmacol Ther. 2025.
3. Ochs HR, Grube E, Greenblatt DJ, Woo E, Bodem G. Intravenous quinidine: pharmacokinetic properties and effects on left ventricular performance in humans. Am Heart J. 1980;99:468-475. doi:10.1016/0002-8703(80)90381-6.
4. Maeda K, Takano J, Ikeda Y, Fujita T, Oyama Y, Nozawa K, Kumagai Y, Sugiyama Y. Nonlinear pharmacokinetics of oral quinidine and verapamil in healthy subjects: a clinical microdosing study. Clin Pharmacol Ther. 2011;90:263-270. doi:10.1038/clpt.2011.108.
5. Andreasen AH, Brøsen K, Damkier P. A comparative pharmacokinetic study in healthy volunteers of the effect of carbamazepine and oxcarbazepine on CYP3A4. Epilepsia. 2007;48:490-496. doi:10.1111/j.1528-1167.2007.00924.x.
6. Ochs HR, Greenblatt DJ, Woo E, Franke K, Pfeifer HJ, Smith TW. Single and multiple dose pharmacokinetics of oral quinidine sulfate and gluconate. Am J Cardiol. 1978;41:770-777. doi:10.1016/0002-9149(78)90830-5.
7. Strum JD, Colaizzi JL, Jaffe JM, Martineau PC, Poust RI. Comparative bioavailability of four commercial quinidine sulfate tablets. J Pharm Sci. 1977;66:539-542. doi:10.1002/jps.2600660420.
8. Ching MS, Elliott SL, Stead CK, Murdoch RT, Devenish-Meares S, Morgan DJ, Smallwood RA. Quinidine pharmacokinetics and pharmacodynamics are unaltered by omeprazole. Aliment Pharmacol Ther. 1991;5:523-531. doi:10.1111/j.1365-2036.1991.tb00521.x.
9. Laganière S, Davies RF, Carignan G, et al. Pharmacokinetic and pharmacodynamic interactions between diltiazem and quinidine. Clin Pharmacol Ther. 1996;60:255-264. doi:10.1016/S0009-9236(96)90052-1.
10. Bleske BE, Carver PL, Annesley TM, Bleske JRM, Morady F. Effect of ciprofloxacin on quinidine pharmacokinetic and ECG parameters. J Clin Pharmacol. 1990;30:911-915. doi:10.1002/j.1552-4604.1990.tb03570.x.
11. Damkier P, Hansen LL, Brøsen K. Rifampicin treatment greatly increases apparent oral clearance of quinidine. Pharmacol Toxicol. 1999;85:257-262. doi:10.1111/j.1600-0773.1999.tb02019.x.
12. Edwards DJ, Lavoie R, Beckman H, Blevins R, Rubenfire M. Effect of verapamil on quinidine pharmacokinetics and metabolism. Clin Pharmacol Ther. 1987;41:68-73. doi:10.1038/clpt.1987.11.
13. Hardy BG, Schentag JJ. Lack of effect of cimetidine on the metabolism of quinidine: effect on renal clearance. Int J Clin Pharmacol Ther Toxicol. 1988;26:388-391.
14. Kolb KW, Garnett WR, Small RE, Vetrovec GW, Kline BJ, Fox T. Effect of cimetidine on quinidine clearance. Ther Drug Monit. 1984;6:306-312. doi:10.1097/00007691-198409000-00009.
15. Darbar D, Dell'Orto S, Mörike K, Wilkinson GR, Roden DM. Dietary salt increases first-pass elimination of oral quinidine. Clin Pharmacol Ther. 1997;61:292-300. doi:10.1016/S0009-9236(97)90161-2.
16. Fremstad D, Nilsen OG, Storstein L, Amlie J, Jacobsen S. Pharmacokinetics of quinidine related to plasma protein binding in man. Eur J Clin Pharmacol. 1979;15:187-192. doi:10.1007/BF00563104.
17. Guentert TW, Holford NH, Coates PE, Upton RA, Riegelman S. Quinidine pharmacokinetics in man: choice of a disposition model and absolute bioavailability studies. J Pharmacokinet Biopharm. 1979;7:315-330. doi:10.1007/BF01062532.
18. Mason WD, Covinsky JO, Valentine JL, Kelly KL, Weddle OH, Martz BL. Comparative plasma concentrations of quinidine formulations. J Pharm Sci. 1976;65:1325-1329. doi:10.1002/jps.2600650916.
19. Bolme P, Otto U. Dose-dependence of the pharmacokinetics of quinidine. Eur J Clin Pharmacol. 1977;12:73-76. doi:10.1007/BF00561409.
20. Frigo GM, Perucca E, Teggia-Droghi M, Gatti G, Mussini A, Salerno J. Comparison of quinidine plasma concentration curves after oral formulations. Br J Clin Pharmacol. 1977;4:449-454. doi:10.1111/j.1365-2125.1977.tb00760.x.
21. Wishart DS, Knox C, Guo AC, et al. DrugBank: a comprehensive resource for in silico drug discovery and exploration. Nucleic Acids Res. 2006;34:D668-D672. doi:10.1093/nar/gkj067.
22. DrugBank. Quinidine. 2022. https://go.drugbank.com/drugs/DB00908.
23. Takano J, Maeda K, Bolger MB, Sugiyama Y. Prediction of CYP3A/P-glycoprotein importance to nonlinear intestinal absorption. Drug Metab Dispos. 2016;44:1808-1818. doi:10.1124/dmd.116.070011.
24. Tachibana T, Kitamura S, Kato M, et al. Model analysis of concentration-dependent permeability of P-gp substrates. Pharm Res. 2010;27:442-446. doi:10.1007/s11095-009-0026-9.
25. Nielsen TL, Rasmussen BB, Flinois JP, Beaune P, Brøsen K. In vitro metabolism of quinidine. J Pharmacol Exp Ther. 1999;289:31-37.
26. Moghadamnia AA, Rostami-Hodjegan A, Abdul-Manap R, Wright CE, Morice AH, Tucker GT. PBPK modelling of dextromethorphan inhibition by quinidine. Br J Clin Pharmacol. 2003;56:57-67. doi:10.1046/j.1365-2125.2003.01853.x.
27. Austin RP, Barton P, Cockroft SL, Wenlock MC, Riley RJ. Influence of nonspecific microsomal binding on apparent intrinsic clearance. Drug Metab Dispos. 2002;30:1497-1503. doi:10.1124/dmd.30.12.1497.
28. Watanabe R, Esaki T, Kawashima H, et al. Predicting Fraction Unbound in Human Plasma from Chemical Structure. Mol Pharm. 2018;15:5302-5311. doi:10.1021/acs.molpharmaceut.8b00785.

29. Rao BR, Rambhau D. Absence of a pharmacokinetic interaction between quinidine and diazepam. Drug Metabol Drug Interact. 1995;12:45-51. doi:10.1515/dmdi.1995.12.1.45.

30. Kaukonen KM, Olkkola KT, Neuvonen PJ. Itraconazole increases plasma concentrations of quinidine. Clin Pharmacol Ther. 1997;62:510-517. doi:10.1016/S0009-9236(97)90046-1.

31. Shin JG, Kang WK, Shon JH, Arefayene M, Yoon YR, Kim KA, Kim DI, Kim DS, Cho KH, Woosley RL, Flockhart DA. Possible interethnic differences in quinidine-induced QT prolongation between healthy Caucasian and Korean subjects. Br J Clin Pharmacol. 2007;63:206-215. doi:10.1111/j.1365-2125.2006.02793.x.

32. Kuepfer L, Niederalt C, Wendl T, Schlender JF, Willmann S, Lippert J, Block M, Eissing T, Teutonico D. Applied Concepts in PBPK Modeling: How to Build a PBPK/PD Model. CPT Pharmacometrics Syst Pharmacol. 2016;5:516-531.

33. Willmann S, Höhn K, Edginton A, Sevestre M, Solodenko J, Weiss W, Lippert J, Schmitt W. Development of a physiology-based whole-body population model for assessing the influence of individual variability on the pharmacokinetics of drugs. J Pharmacokinet Pharmacodyn. 2007;34:401-431.

