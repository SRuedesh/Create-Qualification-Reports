# Building and evaluation of a PBPK model for Desipramine in adults

| Version                                         | evaluation-OSP12.2                                                   |
| ----------------------------------------------- | ------------------------------------------------------------ |
| based on *Model Snapshot* and *Evaluation Plan* | https://github.com/Open-Systems-Pharmacology/Desipramine-Model/releases/tag/vevaluation |
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
   * [3.1 Desipramine final input parameters](#31)
   * [3.2 Diagnostic plots](#32)
     * [3.2.1 Desipramine goodness-of-fit diagnostics](#321)
     * [3.2.2 2-Hydroxydesipramine goodness-of-fit diagnostics](#322)
   * [3.3 Concentration-time profiles](#33)
     * [3.3.1 Model Building](#331)
     * [3.3.2 Model Verification](#332)
 * [4 Conclusion](#4)
 * [5 References](#5)

# 1 Introduction<a id="1"></a>

Desipramine is a tricyclic antidepressant and a sensitive CYP2D6 substrate. It is used as a probe substrate in clinical drug-drug interaction studies and is suitable for evaluating CYP2D6 phenotype- and activity-dependent changes in exposure.

This desipramine model is intended to describe plasma concentration-time profiles of desipramine and 2-hydroxydesipramine after intravenous and oral administration. It supports CYP2D6 drug-gene and drug-drug-gene interaction simulations in the CYP2D6 network described by [Rüdesheim 2025](#5-references).

The model was developed using physicochemical, *in vitro*, and clinical pharmacokinetic information for desipramine and 2-hydroxydesipramine. Clinical data included intravenous and oral administration, extensive-, poor-, normal-, and higher-activity CYP2D6 groups, and interacting-drug studies using desipramine as a CYP2D6 victim.

The presented model includes the following features:

- desipramine and 2-hydroxydesipramine as parent and metabolite compounds,
- CYP2D6-mediated 2-hydroxylation with activity-score dependent k<sub>cat</sub> values,
- residual hepatic clearance processes,
- renal filtration with a GFR fraction of 1,
- intravenous and oral applications used for clinical model building and verification.

# 2 Methods<a id="2"></a>

## 2.1 Modeling strategy<a id="21"></a>

The general concept of building a PBPK model has previously been described by Kuepfer et al. ([Kuepfer 2016](#5-references)). Relevant information on anthropometric and physiological parameters in adults was gathered from the literature and incorporated into PK-Sim as default values for adult simulations ([Willmann 2007](#5-references)).

The applied activity and variability of plasma proteins and active processes integrated into PK-Sim are described in the publicly available PK-Sim Ontogeny Database or otherwise referenced for the specific process.

The desipramine model was developed as a parent-metabolite PBPK model with desipramine and 2-hydroxydesipramine. It was included in the comprehensive CYP2D6 drug-drug-gene interaction network by [Rüdesheim 2025](#5-references). The model was built using intravenous and oral desipramine data to inform distribution, absorption, CYP2D6-mediated metabolism, and residual elimination.

Clinical studies used for model building covered intravenous and oral desipramine administration in CYP2D6 poor-, extensive-, and fast-metabolizer groups. Verification simulations included independent oral studies, activity-score groups, and CYP2D6 inhibitor interaction scenarios. The model therefore separates parent desipramine performance from 2-hydroxydesipramine performance where metabolite data are available.

The intravenous data support distribution and systemic clearance assumptions without confounding by oral absorption. Oral studies then support absorption and first-pass metabolism. This split is important for desipramine because the same model must describe both parent exposure and metabolite formation across CYP2D6 function groups.

The structural model contains CYP2D6-mediated 2-hydroxylation, residual hepatic clearance, passive renal filtration, and oral absorption. CYP2D6 poor-metabolizer activity is represented by zero CYP2D6 k<sub>cat</sub>, while normal and higher activity-score groups use optimized CYP2D6 k<sub>cat</sub> values.

The evaluated applications include intravenous infusion or bolus dosing and oral dosing. The major proteins and processes represented explicitly are CYP2D6, plasma protein binding, residual hepatic clearance, and passive renal filtration. Inhibition simulations are interpreted through the CYP2D6 pathway because desipramine is a sensitive CYP2D6 substrate.

The evaluation therefore uses parent concentration-time profiles as the primary readout and metabolite profiles where available as supporting evidence for the CYP2D6 formation pathway. Model-building and verification profiles are separated to preserve the logic of fitting structural parameters first and then evaluating independent clinical scenarios.

Details about input data are provided in [Section 2.2](#22). Details about the structural model and assumptions are provided in [Section 2.3](#23).

## 2.2 Data used<a id="22"></a>

### 2.2.1 In vitro and physicochemical data

The table below summarizes the drug-dependent inputs documented for the desipramine model.

| Parameter | Unit | Value | Source | Description |
| --- | ---: | ---: | --- | --- |
| Desipramine MW | g/mol | 266.4 | [PubChem 2019](#5-references) | Parent compound size used in concentration conversions. |
| Desipramine pK<sub>a</sub> | - | 2.84, 10.02 | [ChemAxon 2023](#5-references); [DrugBank 2006](#5-references) | Ionization constants. |
| Desipramine logP | - | 3.52 | Optimized; [ChemAxon 2023](#5-references); [DrugBank 2006](#5-references) | Distribution-sensitive parent parameter. |
| Desipramine f<sub>u</sub> | % | 14 | [Watanabe 2018](#5-references) | Plasma binding input. |
| CYP2D6 K<sub>m</sub>, desipramine to 2-hydroxydesipramine | µmol/L | 0.73 | [Ball 1997](#5-references); [Austin 2002](#5-references) | CYP2D6 affinity held constant across phenotypes. |
| CYP2D6 k<sub>cat</sub>, normal metabolizers | 1/min | 5.03 | Optimized | CYP2D6 activity-score dependent metabolic capacity. |
| CYP2D6 k<sub>cat</sub>, AS = 2 and AS = 2.5 | 1/min | 9.86, 28.88 | Optimized | Higher activity-score metabolic capacity. |
| 2-Hydroxydesipramine unspecific CL<sub>hep</sub> | 1/min | 9.93 | Optimized | Metabolite elimination. |
| GFR fraction | - | 1.00 | Assumed | Passive glomerular filtration fraction for parent and metabolite. |

### 2.2.2 Clinical data

The evaluation uses 46 observed-data records for desipramine and 2-hydroxydesipramine in peripheral venous blood plasma. The evaluation plan assigns 12 simulations to model building and 8 simulations to model verification.

Model-building clinical data:

| Publication | Arm / Treatment / Information used for model building |
| --- | --- |
| [Brøsen 1988](#5-references) | Plasma PK profiles in adults after intravenous administration of 50 mg desipramine hydrochloride with CYP2D6 poor-, extensive-, and fast-metabolizer status. |
| [Spina 1987](#5-references) | Plasma PK profiles in adults after oral, single dose administration of 25 mg desipramine hydrochloride with CYP2D6 poor- and extensive-metabolizer status. |
| [Aarnoutse 2005](#5-references) | Plasma PK profiles in adults after oral, single dose administration of 50 mg desipramine hydrochloride with CYP2D6 extensive-metabolizer status. |
| [Boni 2009](#5-references) | Plasma PK profiles in adults after oral, single dose administration of 50 mg desipramine hydrochloride with desipramine and 2-hydroxydesipramine measurements. |
| [Harris 2007](#5-references) | Plasma PK profiles in adults after oral, single dose administration of 50 mg desipramine hydrochloride with CYP2D6 extensive-metabolizer status. |
| [Madani 2002](#5-references) | Plasma PK profiles in adults after oral, single dose administration of 50 mg desipramine hydrochloride with CYP2D6 extensive-metabolizer status. |
| [Brøsen 1986](#5-references) | Plasma PK profiles in adults after oral, single dose administration of 100 mg desipramine hydrochloride with CYP2D6 poor-, extensive-, and fast-metabolizer status. |

Model-verification clinical data:

| Publication | Arm / Treatment / Information used for model verification |
| --- | --- |
| [Bergmann 2001](#5-references) | Plasma PK profiles in adults after oral, single dose administration of 100 mg desipramine hydrochloride with CYP2D6 AS = 2 and AS = 2.5 status. |
| [Hynes 2015](#5-references) | Plasma PK profiles in adults after oral, single dose administration of 50 mg desipramine hydrochloride with CYP2D6 extensive-metabolizer status. |
| [Bergstrom 1992](#5-references) | Plasma PK profiles in adults after oral, single dose administration of 50 mg desipramine hydrochloride. |
| [Nichols 2013](#5-references) | Plasma PK profiles in adults after oral, single dose administration of 50 mg desipramine hydrochloride with CYP2D6 extensive-metabolizer status. |
| [Patroneva 2008](#5-references) | Plasma PK profiles in adults after oral, single dose administration of 50 mg desipramine hydrochloride with desipramine and 2-hydroxydesipramine measurements. |
| [Skinner 2003](#5-references) | Plasma PK profiles in adults after oral, single dose administration of 50 mg desipramine hydrochloride with CYP2D6 extensive-metabolizer status. |
| [Spina 1995](#5-references) | Plasma PK profiles in adults after oral, single dose administration of 100 mg desipramine hydrochloride with CYP2D6 extensive-metabolizer status. |

## 2.3 Model parameters and assumptions<a id="23"></a>

### 2.3.1 Absorption

The model includes intravenous and oral desipramine applications. Intravenous simulations do not require an absorption process. Oral desipramine simulations are represented with a solution-type formulation and compound-specific intestinal permeability.

The `Specific intestinal permeability` for desipramine was optimized using oral concentration-time data. The 2-hydroxydesipramine intestinal permeability was calculated and is relevant for metabolite simulations where the compound is present as a separate building block.

The intravenous simulations provide information for systemic disposition without absorption. Oral simulations use the same systemic disposition assumptions and add the intestinal permeability term. This allows the oral absorption parameter to be interpreted separately from the CYP2D6 and residual clearance parameters.

No phenotype-specific absorption parameter was introduced. Differences between CYP2D6 groups and inhibitor scenarios are represented through metabolism, while the same oral absorption assumptions are applied across adult simulations.

### 2.3.2 Distribution

Desipramine plasma protein binding was represented by a fraction unbound of 14% as summarized in [Section 2.2.1](#221-in-vitro-and-physicochemical-data). Lipophilicity was optimized and is an important parameter for the parent volume of distribution.

Partition coefficients were calculated with the Rodgers and Rowland method. Because the model includes both parent and metabolite concentration-time profiles, distribution assumptions affect the interpretation of desipramine and 2-hydroxydesipramine profiles separately.

The model uses compound-specific distribution properties for desipramine and 2-hydroxydesipramine. Parent distribution is particularly important because desipramine is extensively distributed and the concentration-time profile after intravenous administration constrains this part of the model. Metabolite distribution is interpreted more cautiously because metabolite profiles are less comprehensive than parent profiles.

Distribution was kept independent of CYP2D6 status. CYP2D6 poor-, extensive-, and higher-activity groups differ through formation clearance, while the same adult physiological and binding assumptions are applied.

### 2.3.3 Metabolism and Elimination

One explicit metabolic conversion and residual elimination pathways are represented in the model.

* CYP2D6

Desipramine is converted to 2-hydroxydesipramine by CYP2D6. CYP2D6 K<sub>m</sub> is held constant across CYP2D6 groups. Poor-metabolizer k<sub>cat</sub> is set to zero, while normal and higher activity-score k<sub>cat</sub> values were optimized.

This structure assigns CYP2D6 phenotype and activity-score effects to catalytic capacity rather than to affinity. It also makes desipramine suitable for evaluating CYP2D6 inhibitor scenarios because reduced CYP2D6 activity should increase parent exposure and reduce metabolite formation.

* Residual elimination

The model includes residual hepatic clearance for desipramine and unspecific hepatic clearance for 2-hydroxydesipramine. Both parent and metabolite include passive renal filtration with a `GFR fraction` of 1.

Residual hepatic clearance accounts for desipramine elimination not explicitly assigned to CYP2D6 2-hydroxylation. The metabolite unspecific hepatic clearance represents downstream elimination of 2-hydroxydesipramine. Renal filtration is implemented as a passive process using adult renal physiology and the fraction unbound of the respective compound.

### 2.3.4 Automated Parameter Identification

The following parameters were optimized by fitting the model to the data:

| Model Parameter |
| --- |
| `Lipophilicity` |
| `Specific intestinal permeability` |
| CYP2D6 k<sub>cat</sub> values |
| desipramine residual hepatic clearance |
| 2-hydroxydesipramine unspecific CL<sub>hep</sub> |

The optimized parameters were selected to describe distribution, oral absorption, CYP2D6-mediated formation, and residual clearance. Parameters with direct physicochemical or plasma-binding sources were kept fixed. The separation of optimized absorption and clearance terms is necessary because both oral and intravenous studies contribute to the evaluation.

# 3 Results and Discussion<a id="3"></a>

The PBPK model for desipramine was developed and evaluated with clinical pharmacokinetic data after intravenous and oral administration. The evaluation covers desipramine and 2-hydroxydesipramine plasma concentration-time profiles, CYP2D6 poor-, extensive-, normal-, and higher-activity groups, and interaction settings in which desipramine acts as a sensitive CYP2D6 victim drug.

The model-building data informed systemic disposition, oral absorption, CYP2D6-mediated 2-hydroxylation, residual hepatic clearance, and metabolite elimination. Intravenous and oral phenotype-stratified data from [Brøsen 1988](#5-references), [Brøsen 1986](#5-references), and [Spina 1987](#5-references) supported CYP2D6 phenotype-dependent clearance. Oral studies with parent and metabolite measurements, including [Boni 2009](#5-references), supported the parent-metabolite structure. Additional oral data from [Aarnoutse 2005](#5-references), [Harris 2007](#5-references), and [Madani 2002](#5-references) supported adult oral exposure after 50 mg dosing.

Verification used independent studies across CYP2D6 activity and interaction settings, including [Bergmann 2001](#5-references), [Hynes 2015](#5-references), [Bergstrom 1992](#5-references), [Nichols 2013](#5-references), [Patroneva 2008](#5-references), [Skinner 2003](#5-references), and [Spina 1995](#5-references). These data test whether the same model can describe adult oral desipramine exposure without study-specific refitting.

The model quantifies CYP2D6-mediated 2-hydroxylation, residual hepatic clearance of desipramine, unspecific hepatic clearance of 2-hydroxydesipramine, passive glomerular filtration, and enterohepatic circulation. CYP2D6 k<sub>cat</sub> values represent the major phenotype and activity-score dependency. The metabolite pathway is important because adequate parent prediction alone would not demonstrate correct description of 2-hydroxydesipramine exposure.

The next sections show:

1. the final model input parameters for the building blocks: [Section 3.1](#31).
2. the overall goodness of fit: [Section 3.2](#32).
3. simulated vs. observed concentration-time profiles for the clinical studies used for model building and for model verification: [Section 3.3](#33).

The merged GOF diagnostic over the included concentration observations gives GMFE values of 1.28 for desipramine, 1.27 for 2-hydroxydesipramine, and 1.28 for all observations. The close agreement between parent and metabolite GMFE values is important because it indicates that the model is not fitting parent exposure at the expense of metabolite behavior.

The concentration-time profiles should be interpreted by dose route, analyte, and CYP2D6 activity group. Intravenous data mainly test systemic distribution and clearance. Oral data additionally test absorption and first-pass metabolism. Poor-metabolizer profiles are expected to show reduced CYP2D6-mediated 2-hydroxylation, while normal- and higher-activity groups test the activity-score dependent k<sub>cat</sub> values.

[Rüdesheim 2025](#5-references) used the desipramine model in a broader CYP2D6 DDGI network. In that setting, desipramine served as a sensitive CYP2D6 substrate for inhibition and genotype interaction scenarios. The present evaluation should therefore be read as a compound-level check of desipramine and 2-hydroxydesipramine exposure, while DDGI performance depends additionally on perpetrator models and interaction constants.

The model is adequate for adult desipramine simulations within the represented intravenous and oral dose range and CYP2D6 activity groups. Extrapolation to unrepresented populations, strong P-gp effects, or tissue-specific pharmacodynamic endpoints should remain outside the evidence supported by this report.

## 3.1 Desipramine final input parameters<a id="31"></a>

The compound parameter values of the final PBPK model are illustrated below.

### Compound: Desipramine

#### Parameters

Name                                             | Value                  | Value Origin                                                | Alternative | Default
------------------------------------------------ | ---------------------- | ----------------------------------------------------------- | ----------- | -------
Solubility at reference pH                       | 214.29 mg/l            | Database-Other-chemicalize.com                              | Predicted   | True   
Reference pH                                     | 6.5                    | Database-Other-chemicalize.com                              | Predicted   | True   
Lipophilicity                                    | 3.5204587578 Log Units | Parameter Identification-Parameter Identification-Optimized | Optimized   | True   
Lipophilicity                                    | 3.896 Log Units        | Database-Other-chemicalize.com                              | Predicted   | False  
Fraction unbound (plasma, reference value)       | 0.135                  | Publication-Other-Predicted, Watanabe et al. 2018           | Predicted   | True   
Specific intestinal permeability (transcellular) | 1.14E-05 cm/min        | Parameter Identification-Parameter Identification-Optimized | Optimized   | True   
Is small molecule                                | Yes                    |                                                             |             |        
Molecular weight                                 | 266.388 g/mol          | Database-Other-chemicalize.com                              |             |        
Plasma protein binding partner                   | α1-acid glycoprotein   |                                                             |             |        

#### Calculation methods

Name                    | Value              
----------------------- | -------------------
Partition coefficients  | Rodgers and Rowland
Cellular permeabilities | PK-Sim Standard    

#### Processes

##### Systemic Process: Glomerular Filtration-Assumption

Species: Human

###### Parameters

Name         | Value | Value Origin                                               
------------ | -----:| -----------------------------------------------------------
GFR fraction |     1 | Parameter Identification-Parameter Identification-Optimized

##### Systemic Process: Total Hepatic Clearance-Assumption

Species: Human

###### Parameters

Name                          | Value              | Value Origin                                               
----------------------------- | ------------------ | -----------------------------------------------------------
Fraction unbound (experiment) | 0.14               | Unknown-Unknown                                            
Lipophilicity (experiment)    | 3.52 Log Units     |                                                            
Plasma clearance              | 0 ml/min/kg        |                                                            
Specific clearance            | 0.5395490378 1/min | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Ball et al. 1997 (2-Hydroxydesipramine)

Molecule: CYP2D6

Metabolite: 2-Hydroxydesipramine

###### Parameters

Name                                        | Value                       | Value Origin                                                                        
------------------------------------------- | --------------------------- | ------------------------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 68 pmol/min/mg mic. protein |                                                                                     
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein     | Unknown                                                                             
Km                                          | 0.732 µmol/l                | Publication-In Vitro-Ball et al. 1997, corrected for fu,inc 12% (Austin et al. 2002)
kcat                                        | 5.03 1/min                  | Parameter Identification-Parameter Identification-Optimized                         

##### Metabolizing Enzyme: CYP2D6-AS=0 (2-Hydroxydesipramine)

Molecule: CYP2D6

Metabolite: 2-Hydroxydesipramine

###### Parameters

Name                                        | Value                      | Value Origin                                                                        
------------------------------------------- | -------------------------- | ------------------------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                                     
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                                             
Km                                          | 0.73 µmol/l                | Publication-In Vitro-Ball et al. 1997, corrected for fu,inc 12% (Austin et al. 2002)

##### Metabolizing Enzyme: CYP2D6-AS=2 (2-Hydroxydesipramine)

Molecule: CYP2D6

Metabolite: 2-Hydroxydesipramine

###### Parameters

Name                                        | Value                      | Value Origin                                                                        
------------------------------------------- | -------------------------- | ------------------------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                                     
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                                             
Km                                          | 0.732 µmol/l               | Publication-In Vitro-Ball et al. 1997, corrected for fu,inc 12% (Austin et al. 2002)
kcat                                        | 9.86 1/min                 | Parameter Identification-Parameter Identification-Optimized                         

##### Metabolizing Enzyme: CYP2D6-AS=2.5 (2-Hydroxydesipramine)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                                                        
------------------------------------------- | -------------------------- | ------------------------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                                     
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                                             
Km                                          | 0.732 µmol/l               | Publication-In Vitro-Ball et al. 1997, corrected for fu,inc 12% (Austin et al. 2002)
kcat                                        | 28.88 1/min                | Parameter Identification-Parameter Identification-Optimized                         

### Compound: 2-Hydroxydesipramine

#### Parameters

Name                                       | Value           | Value Origin                                                | Alternative | Default
------------------------------------------ | --------------- | ----------------------------------------------------------- | ----------- | -------
Solubility at reference pH                 | 282.39 mg/l     | Database-Other-chemicalize.com                              | Predicted   | True   
Reference pH                               | 6.5             | Database-Other-chemicalize.com                              | Predicted   | True   
Lipophilicity                              | 2.33 Log Units  | Parameter Identification-Parameter Identification-Optimized | Optimized   | True   
Lipophilicity                              | 3.173 Log Units | Database-Other-chemicalize.com                              | Predicted   | False  
Fraction unbound (plasma, reference value) | 0.12            | Publication-Other-Predicted, Watanabe et al. 2018           | Predicted   | True   
Is small molecule                          | Yes             |                                                             |             |        
Molecular weight                           | 282.38 g/mol    | Database-Other-chemicalize.com                              |             |        
Plasma protein binding partner             | Unknown         |                                                             |             |        

#### Calculation methods

Name                    | Value              
----------------------- | -------------------
Partition coefficients  | Rodgers and Rowland
Cellular permeabilities | PK-Sim Standard    

#### Processes

##### Systemic Process: Glomerular Filtration-Assumption

Species: Human

###### Parameters

Name         | Value | Value Origin          
------------ | -----:| ----------------------
GFR fraction |     1 | Other-Other-Assumption

##### Systemic Process: Total Hepatic Clearance-Assumption

Species: Human

###### Parameters

Name                          | Value          | Value Origin                                               
----------------------------- | -------------- | -----------------------------------------------------------
Fraction unbound (experiment) | 0.12           |                                                            
Lipophilicity (experiment)    | 2.53 Log Units | Unknown-Unknown                                            
Plasma clearance              | 0 ml/min/kg    |                                                            
Specific clearance            | 9.93 1/min     | Parameter Identification-Parameter Identification-Optimized

## 3.2 Diagnostic plots<a id="32"></a>

Below you find the goodness-of-fit visual diagnostic plots for the PBPK model performance of all data used presented in [Section 2.2.2](#222-clinical-data).

The first plot shows observed versus simulated plasma concentration, the second weighted residuals versus time.

### 3.2.1 Desipramine goodness-of-fit diagnostics<a id="321"></a>

Below you find the goodness-of-fit visual diagnostic plots for desipramine plasma concentration data used in the model evaluation.

The first plot shows observed versus simulated plasma concentration, the second weighted residuals versus time.

<a id="table-3-1"></a>

**Table 3-1: GMFE for Desipramine observed versus simulated plasma concentration-time data**

|Group       |GMFE |
|:-----------|:----|
|Desipramine |1.28 |

<br>
<br>

<a id="figure-3-1"></a>

![](images/006_section_3/008_section_32/009_section_321/2_gof_plot_predictedVsObserved.png)

**Figure 3-1: Desipramine observed versus simulated plasma concentration-time data**

<br>
<br>

<a id="figure-3-2"></a>

![](images/006_section_3/008_section_32/009_section_321/3_gof_plot_residualsOverTime.png)

**Figure 3-2: Desipramine observed versus simulated plasma concentration-time data**

<br>
<br>

### 3.2.2 2-Hydroxydesipramine goodness-of-fit diagnostics<a id="322"></a>

Below you find the goodness-of-fit visual diagnostic plots for 2-hydroxydesipramine plasma concentration data used in the model evaluation.

The first plot shows observed versus simulated plasma concentration, the second weighted residuals versus time.

<a id="table-3-2"></a>

**Table 3-2: GMFE for 2-Hydroxydesipramine observed versus simulated plasma concentration-time data**

|Group                |GMFE |
|:--------------------|:----|
|2-Hydroxydesipramine |1.27 |

<br>
<br>

<a id="figure-3-3"></a>

![](images/006_section_3/008_section_32/010_section_322/5_gof_plot_predictedVsObserved.png)

**Figure 3-3: 2-Hydroxydesipramine observed versus simulated plasma concentration-time data**

<br>
<br>

<a id="figure-3-4"></a>

![](images/006_section_3/008_section_32/010_section_322/6_gof_plot_residualsOverTime.png)

**Figure 3-4: 2-Hydroxydesipramine observed versus simulated plasma concentration-time data**

<br>
<br>

## 3.3 Concentration-time profiles<a id="33"></a>

Simulated versus observed concentration-time profiles of all data listed in [Section 2.2.2](#222-clinical-data) are presented below.

### 3.3.1 Model Building<a id="331"></a>

<a id="figure-3-5"></a>

![](images/006_section_3/011_section_33/012_section_331/1_time_profile_plot_Desipramine_Aarnoutse__2005____desipramine_hydrochloride__po__50_mg__n_13__EM_.png)

**Figure 3-5: Time Profile Analysis**

<br>
<br>

<a id="figure-3-6"></a>

![](images/006_section_3/011_section_33/012_section_331/4_time_profile_plot_Desipramine_Boni__2009____desipramine_hydrochloride__po__50_mg__n_26__EM_.png)

**Figure 3-6: Time Profile Analysis**

<br>
<br>

<a id="figure-3-7"></a>

![](images/006_section_3/011_section_33/012_section_331/5_time_profile_plot_Desipramine_Brosen__1986____desipramine_hydrochloride__po__100_mg__n_6__fast_EM_.png)

**Figure 3-7: Time Profile Analysis**

<br>
<br>

<a id="figure-3-8"></a>

![](images/006_section_3/011_section_33/012_section_331/6_time_profile_plot_Desipramine_Brosen__1986____desipramine_hydrochloride__po__100_mg__n_6__PM_.png)

**Figure 3-8: Time Profile Analysis**

<br>
<br>

<a id="figure-3-9"></a>

![](images/006_section_3/011_section_33/012_section_331/7_time_profile_plot_Desipramine_Brosen__1986____desipramine_hydrochloride__po__100_mg__n_6__EM_.png)

**Figure 3-9: Time Profile Analysis**

<br>
<br>

<a id="figure-3-10"></a>

![](images/006_section_3/011_section_33/012_section_331/8_time_profile_plot_Desipramine_Harris__2007____desipramine_hydrochloride__po__50_mg__n_17__EM_.png)

**Figure 3-10: Time Profile Analysis**

<br>
<br>

<a id="figure-3-11"></a>

![](images/006_section_3/011_section_33/012_section_331/10_time_profile_plot_Desipramine_Madani__2002____desipramine_hydrochloride__po__50_mg__n_24__EM_.png)

**Figure 3-11: Time Profile Analysis**

<br>
<br>

<a id="figure-3-12"></a>

![](images/006_section_3/011_section_33/012_section_331/12_time_profile_plot_Desipramine_Brosen__1988____desipramine_hydrochloride__iv__50_mg__n_4__fast_EM_.png)

**Figure 3-12: Time Profile Analysis**

<br>
<br>

<a id="figure-3-13"></a>

![](images/006_section_3/011_section_33/012_section_331/13_time_profile_plot_Desipramine_Brosen__1988____desipramine_hydrochloride__iv__50_mg__n_3__PM_.png)

**Figure 3-13: Time Profile Analysis**

<br>
<br>

<a id="figure-3-14"></a>

![](images/006_section_3/011_section_33/012_section_331/14_time_profile_plot_Desipramine_Brosen__1988____desipramine_hydrochloride__iv__50_mg__n_4__EM_.png)

**Figure 3-14: Time Profile Analysis**

<br>
<br>

<a id="figure-3-15"></a>

![](images/006_section_3/011_section_33/012_section_331/17_time_profile_plot_Desipramine_Spina__1987____desipramine_hydrochloride__po__25_mg__n_8__EM_.png)

**Figure 3-15: Time Profile Analysis**

<br>
<br>

<a id="figure-3-16"></a>

![](images/006_section_3/011_section_33/012_section_331/18_time_profile_plot_Desipramine_Spina__1987____desipramine_hydrochloride__po__25_mg__n_6__PM_.png)

**Figure 3-16: Time Profile Analysis**

<br>
<br>

### 3.3.2 Model Verification<a id="332"></a>

<a id="figure-3-17"></a>

![](images/006_section_3/011_section_33/013_section_332/2_time_profile_plot_Desipramine_Bergmann__2001____desipramine_hydrochloride__po__100_mg__n_6__AS_2_.png)

**Figure 3-17: Time Profile Analysis**

<br>
<br>

<a id="figure-3-18"></a>

![](images/006_section_3/011_section_33/013_section_332/3_time_profile_plot_Desipramine_Bergmann__2001____desipramine_hydrochloride__po__100_mg__n_6__AS_2_5_.png)

**Figure 3-18: Time Profile Analysis**

<br>
<br>

<a id="figure-3-19"></a>

![](images/006_section_3/011_section_33/013_section_332/9_time_profile_plot_Desipramine_Hynes__2015____desipramine_hydrochloride__po__50_mg__n_20__EM_.png)

**Figure 3-19: Time Profile Analysis**

<br>
<br>

<a id="figure-3-20"></a>

![](images/006_section_3/011_section_33/013_section_332/11_time_profile_plot_Desipramine_Bergstrom__1992____desipramine_hydrochloride__po__50_mg__n_6.png)

**Figure 3-20: Time Profile Analysis**

<br>
<br>

<a id="figure-3-21"></a>

![](images/006_section_3/011_section_33/013_section_332/15_time_profile_plot_Desipramine_Nichols__2013____desipramine_hydrochloride__po__50_mg__n_38__EM_.png)

**Figure 3-21: Time Profile Analysis**

<br>
<br>

<a id="figure-3-22"></a>

![](images/006_section_3/011_section_33/013_section_332/16_time_profile_plot_Desipramine_Patroneva__2008____desipramine_hydrochloride__po__50_mg__n_20__EM_.png)

**Figure 3-22: Time Profile Analysis**

<br>
<br>

<a id="figure-3-23"></a>

![](images/006_section_3/011_section_33/013_section_332/19_time_profile_plot_Desipramine_Skinner__2003____desipramine_hydrochloride__po__50_mg__n_16__EM_.png)

**Figure 3-23: Time Profile Analysis**

<br>
<br>

<a id="figure-3-24"></a>

![](images/006_section_3/011_section_33/013_section_332/20_time_profile_plot_Desipramine_Spina__1995____desipramine_hydrochloride__po__100_mg__n_6__EM_.png)

**Figure 3-24: Time Profile Analysis**

<br>
<br>

# 4 Conclusion<a id="4"></a>

The presented PBPK model adequately describes the intravenous and oral pharmacokinetics of desipramine and 2-hydroxydesipramine in the evaluated adult CYP2D6 phenotype and activity-score groups.

# 5 References<a id="5"></a>

1. Rüdesheim S, Loer HLH, Feick D, Marok FZ, Fuhr LM, Selzer D, et al. A Comprehensive CYP2D6 Drug-Drug-Gene Interaction Network for Application in Precision Dosing and Drug Development. Clin Pharmacol Ther. 2025.
2. Brøsen K, Gram LF. First-pass metabolism of imipramine and desipramine: impact of the sparteine oxidation phenotype. Clin Pharmacol Ther. 1988;43:400-406. doi:10.1038/clpt.1988.50.
3. Spina E, Steiner E, Ericsson Ö, Sjöqvist F. Hydroxylation of desmethylimipramine: dependence on the debrisoquin hydroxylation phenotype. Clin Pharmacol Ther. 1987;41:314-319. doi:10.1038/clpt.1987.33.
4. Aarnoutse RE, Kleinnijenhuis J, Koopmans PP, Touw DJ, Wieling J, Hekster YA, Burger DM. Effect of low-dose ritonavir on CYP2D6 activity in healthy volunteers. Clin Pharmacol Ther. 2005;78:664-674. doi:10.1016/j.clpt.2005.09.001.
5. Boni J, Abbas R, Leister C, Burns J, Jordan R, Hoffmann M, DeMaio W, Hug B. Disposition of desipramine when coadministered with intravenous temsirolimus. Cancer Chemother Pharmacol. 2009;64:263-270. doi:10.1007/s00280-008-0865-9.
6. Harris RZ, Salfi M, Posvar E, Hoelscher D, Padhi D. Pharmacokinetics of desipramine HCl when administered with cinacalcet HCl. Eur J Clin Pharmacol. 2007;63:159-163. doi:10.1007/s00228-006-0129-8.
7. Madani S, Barilla D, Cramer J, Wang Y, Paul C. Effect of terbinafine on desipramine pharmacokinetics and pharmacodynamics. J Clin Pharmacol. 2002;42:1211-1218. doi:10.1177/009127002762491299.
8. Bergstrom RF, Peyton AL, Lemberger L. Quantification and mechanism of the fluoxetine and tricyclic antidepressant interaction. Clin Pharmacol Ther. 1992;51:239-248. doi:10.1038/clpt.1992.18.
9. Bergmann TK, Bathum L, Brøsen K. Duplication of CYP2D6 predicts high clearance of desipramine. Eur J Clin Pharmacol. 2001;57:123-127. doi:10.1007/s002280100284.
10. Hynes SM, Wickremsinhe E, Zhang W, Decker R, Ott J, Chandler J, Mitchell M. Evaluation of LY2603618 to inhibit CYP2D6 with desipramine as probe substrate. Biopharm Drug Dispos. 2015;36:49-63. doi:10.1002/bdd.1922.
11. Nichols AI, Chen Y, Behrle JA, Frick G, Paul J. Effects of desvenlafaxine on the pharmacokinetics of desipramine in healthy adults. Int Clin Psychopharmacol. 2013;28:99-105. doi:10.1097/YIC.0b013e32835c1f49.
12. Patroneva A, Connolly SM, Fatato P, Pedersen R, Jiang Q, Paul J, Guico-Pabia C, Isler JA, Burczynski ME, Nichols AI. Effect of desvenlafaxine and duloxetine on desipramine pharmacokinetics. Drug Metab Dispos. 2008;36:2484-2491. doi:10.1124/dmd.108.021527.
13. Skinner MH, Kuan HY, Pan A, Sathirakul K, Knadler MP, Gonzales CR, Yeo KP, Reddy S, Lim M, Ayan-Oshodi M, Wise SD. Duloxetine is both an inhibitor and a substrate of CYP2D6. Clin Pharmacol Ther. 2003;73:170-177. doi:10.1067/mcp.2003.28.
14. Kim S, Chen J, Cheng T, Gindulyte A, He J, He S, Li Q, Shoemaker BA, Thiessen PA, Yu B, Zaslavsky L, Zhang J, Bolton EE. PubChem 2019 update: improved access to chemical data. Nucleic Acids Res. 2019;47:D1102-D1109. doi:10.1093/nar/gky1033.
15. Swain M. chemicalize.org. J Chem Inf Model. 2012;52:613-615. doi:10.1021/ci300046g.
16. Wishart DS, Knox C, Guo AC, et al. DrugBank: a comprehensive resource for in silico drug discovery and exploration. Nucleic Acids Res. 2006;34:D668-D672. doi:10.1093/nar/gkj067.
17. Watanabe R, Esaki T, Kawashima H, et al. Predicting Fraction Unbound in Human Plasma from Chemical Structure. Mol Pharm. 2018;15:5302-5311. doi:10.1021/acs.molpharmaceut.8b00785.
18. Ball SE, Ahern D, Scatina J, Kao J. Venlafaxine: in vitro inhibition of CYP2D6-dependent imipramine and desipramine metabolism. Br J Clin Pharmacol. 1997;43:619-626. doi:10.1046/j.1365-2125.1997.00591.x.
19. Austin RP, Barton P, Cockroft SL, Wenlock MC, Riley RJ. Influence of nonspecific microsomal binding on apparent intrinsic clearance. Drug Metab Dispos. 2002;30:1497-1503. doi:10.1124/dmd.30.12.1497.

20. Kuepfer L, Niederalt C, Wendl T, Schlender JF, Willmann S, Lippert J, Block M, Eissing T, Teutonico D. Applied Concepts in PBPK Modeling: How to Build a PBPK/PD Model. CPT Pharmacometrics Syst Pharmacol. 2016;5:516-531.

21. Willmann S, Höhn K, Edginton A, Sevestre M, Solodenko J, Weiss W, Lippert J, Schmitt W. Development of a physiology-based whole-body population model for assessing the influence of individual variability on the pharmacokinetics of drugs. J Pharmacokinet Pharmacodyn. 2007;34:401-431.

22. Brøsen K, Otton SV, Gram LF. Imipramine demethylation and hydroxylation: impact of the sparteine oxidation phenotype. Clin Pharmacol Ther. 1986;40:543-549. doi:10.1038/clpt.1986.221.

23. Spina E, Avenoso A, Campo GM, Caputi AP, Perucca E. The effect of carbamazepine on the 2-hydroxylation of desipramine. Psychopharmacology. 1995;117:413-416. doi:10.1007/BF02246212.

