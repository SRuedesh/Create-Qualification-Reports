# Building and evaluation of a PBPK model for Atomoxetine in CYP2D6 phenotype and activity-score groups

| Version                                         | evaluation-OSP12.2                                                   |
| ----------------------------------------------- | ------------------------------------------------------------ |
| based on *Model Snapshot* and *Evaluation Plan* | https://github.com/Open-Systems-Pharmacology/Atomoxetine-Model/releases/tag/vevaluation |
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
   * [3.1 Atomoxetine final input parameters](#31)
   * [3.2 Diagnostic plots](#32)
   * [3.3 Concentration-time profiles](#33)
     * [3.3.1 Model Building](#331)
     * [3.3.2 Model Verification](#332)
 * [4 Conclusion](#4)
 * [5 References](#5)

# 1 Introduction<a id="1"></a>

Atomoxetine is a selective norepinephrine reuptake inhibitor used for the treatment of attention-deficit/hyperactivity disorder. It is administered orally and is predominantly cleared by CYP2D6-mediated metabolism, which leads to clinically relevant exposure differences between CYP2D6 phenotype and activity-score groups.

This atomoxetine model is intended to describe plasma concentration-time profiles of atomoxetine across CYP2D6 phenotype and activity-score groups. It supports evaluation of CYP2D6 drug-gene interactions and interacting-drug scenarios where atomoxetine exposure is clinically relevant.

The whole-body PBPK model of atomoxetine was developed by [Rüdesheim 2022](#5) together with paroxetine and risperidone models to describe CYP2D6 activity score-dependent metabolism. The clinical data include oral single-dose and repeated-dose administration of atomoxetine as solution, capsule, or tablet and CYP2D6 phenotype or activity-score stratified groups.

The presented model includes the following features:

- atomoxetine as the evaluated parent compound,
- CYP2D6-mediated metabolism with activity-score-dependent k<sub>cat</sub> values,
- CYP2C19-mediated metabolism,
- passive renal filtration,
- oral solution, capsule, and tablet administration in the evaluated clinical studies.

# 2 Methods<a id="2"></a>

## 2.1 Modeling strategy<a id="21"></a>

The general concept of building a PBPK model has previously been described by Kuepfer et al. ([Kuepfer 2016](#5)). Relevant information on anthropometric and physiological parameters in adults was gathered from the literature and incorporated into PK-Sim as default values for adult simulations ([Willmann 2007](#5)).

The applied activity and variability of plasma proteins and active processes integrated into PK-Sim are described in the publicly available PK-Sim Ontogeny Database or otherwise referenced for the specific process.

The atomoxetine model was developed as a single-parent compound model for oral atomoxetine pharmacokinetics. The model by [Rüdesheim 2022](#5) described CYP2D6 activity score-dependent metabolism by representing CYP2D6 metabolic capacity with activity-score-dependent k<sub>cat</sub> values. CYP2D6-independent clearance was represented through a CYP2C19 pathway and passive renal filtration.

Model-building studies included oral solution, capsule, and tablet administration. Model-verification studies included CYP2D6 poor-, normal-, intermediate-, and higher-activity groups.

The represented processes are CYP2D6-mediated metabolism, CYP2C19-mediated metabolism, plasma protein binding, and passive renal filtration. Atomoxetine metabolites were not explicitly implemented because only limited plasma concentration-time profiles for 4-hydroxyatomoxetine were available. CYP2C19-mediated metabolism was included based on *in vitro* data.

For the CYP2D6 drug-gene interaction model, CYP2D6-dependent clearance was represented with Michaelis-Menten kinetics. CYP2D6 k<sub>cat</sub> values were optimized for extensive-metabolizer or activity-score groups, set to zero for poor metabolizers, and scaled for other activity scores using the activity-score framework from [Rüdesheim 2022](#5).

The evaluated applications are oral single-dose and repeated-dose applications using solution, capsule, or tablet dosing. The represented processes include CYP2D6, CYP2C19, plasma protein binding, and passive renal filtration.

Model performance was assessed with goodness-of-fit diagnostics and concentration-time profiles for the model-building and verification sets.

Details about input data are provided in Section 2.2. Details about the structural model and assumptions are provided in Section 2.3.

## 2.2 Data used<a id="22"></a>

### In vitro and physicochemical data

The table below summarizes the drug-dependent inputs documented for the atomoxetine model ([Table 1](#table-1)).

| Parameter | Unit | Value | Source | Description |
| --- | ---: | ---: | --- | --- |
| MW | g/mol | 255.35 | [Zhong 2013](#5) | Molecular weight of atomoxetine free base. |
| pK<sub>a</sub>,base | - | 9.80 | [Swain 2012](#5) | pKa of a basic ionization site. |
| Solubility | mg/mL | 10.29 | [Swain 2012](#5) | Aqueous solubility at pH 7.4. |
| f<sub>u</sub> | % | 1.30 | [Yu 2016](#5) | Fraction unbound in plasma. |
| K<sub>m,CYP2D6</sub> | µmol/L | 2.30 | [Ring 2002](#5) | Michaelis constant for CYP2D6-mediated metabolism. |
| k<sub>cat,CYP2D6</sub>, EM | 1/min | 37.44 | Optimized; [Ring 2002](#5) | Catalytic rate constant for the extensive-metabolizer pathway. |
| k<sub>cat,CYP2D6</sub>, PM | 1/min | 0 | Assumed | Catalytic rate constant for the poor-metabolizer pathway. |
| K<sub>m,CYP2C19</sub> | µmol/L | 83.00 | [Ring 2002](#5) | Michaelis constant for CYP2C19-mediated metabolism. |
| k<sub>cat,CYP2C19</sub> | 1/min | 165.23 | Optimized; [Ring 2002](#5) | Catalytic rate constant for CYP2C19-mediated metabolism. |
| logP | - | 3.49 | Optimized | Octanol-water partition coefficient of the neutral species. |
| GFR fraction | - | 1.00 | Assumed | Fraction used to scale passive glomerular filtration. |
| Partition coefficients | - | Berezhkovskiy | Calculated | Tissue-to-plasma partition coefficients calculated with the Berezhkovskiy method. |
| Cellular permeabilities | cm/min | 0.32 | Calculated | Cellular permeabilities calculated with the PK-Sim Standard method. |
| P<sub>int</sub> | cm/min | 5.23E-05 | Optimized | Specific transcellular intestinal permeability. |
| K<sub>i,CYP2D6</sub> | µmol/L | 3.60 | [Sauer 2004](#5) | Competitive inhibition constant for CYP2D6. |
| K<sub>i,CYP3A4</sub> | µmol/L | 34.00 | [Sauer 2004](#5) | Competitive inhibition constant for CYP3A4. |

**Table 1:**<a name="table-1"></a> Drug-dependent physicochemical, distribution, metabolism, elimination, and inhibition parameters used in the final atomoxetine model.

The CYP2D6 activity-score-specific catalytic rate constants used in the model are listed below.

| CYP2D6 AS | k<sub>cat</sub> [1/min] | Parameter origin |
| ---: | ---: | --- |
| 0 | 0.00 | Calculated |
| 0.5 | 16.79 | Calculated |
| 1 | 39.70 | Calculated |
| 1.25 | 53.44 | Calculated |
| 2 | 103.82 | Optimized |

**Table 1a:**<a name="table-1a"></a> CYP2D6 activity-score-specific k<sub>cat</sub> values for atomoxetine metabolism from Table 2 of [Rüdesheim 2022](#5). The value for AS = 2 was optimized. Values for the other activity scores were calculated from the relative activity-score scale and the optimized AS = 2 value. AS: activity score.

### Clinical data

The evaluation uses 14 atomoxetine plasma concentration-time profiles from healthy adults ([Table 2](#table-2)). Six profiles were used for model building and eight profiles were used for model verification.

| Source | Dose [mg] / schedule\* | Age [years] | Weight [kg] | Sex | N | Form. | CYP2D6 characterization |
| --- | --- | --- | --- | --- | ---: | --- | --- |
| [Belle 2002](#5) | 20 b.i.d., 9 doses | 38 (20-49) | NR | 23% female | 22 | Tablet | EM |
| [Byeon 2015](#5) | 40 | 23 | 68 | Male | 18 | Capsule | AS = 0.5 (IM) |
| [Byeon 2015](#5) | 40 | 23 | 65 | Male | 22 | Capsule | AS = 1.25 (NM) |
| [Byeon 2015](#5)<sup>+</sup> | 40 | 23 | 67 | Male | 22 | Capsule | AS = 2 (NM) |
| [Cui 2007](#5) | 40 q.d. on days 1-3 | 20-29 | 53-72 | 33% female | 16 | Capsule | AS = 1 (IM) |
| [Cui 2007](#5) | 80 q.d. on days 4-10 | 20-29 | 53-72 | 33% female | 16 | Capsule | AS = 1 (IM) |
| [Kim 2018](#5) | 20 | 19-25 | 52-72 | Male | 8 | Capsule | AS = 0.5 (IM) |
| [Kim 2018](#5)<sup>+</sup> | 20 | 19-25 | 49-73 | Male | 11 | Capsule | AS = 2 (NM) |
| [Nakano 2016](#5)<sup>+</sup> | 50 | 23 (20-37) | 62 (52-76) | Male | 42 | Capsule | EM |
| [Nakano 2016](#5)<sup>+</sup> | 50 | 23 (20-37) | 62 (52-76) | Male | 42 | Solution | EM |
| [Sauer 2003](#5)<sup>+</sup> | 20 b.i.d., 11 doses | 45 (38-54) | NR | Male | 4 | Capsule | EM |
| [Sauer 2003](#5)<sup>+</sup> | 20 b.i.d., 11 doses | 35 (19-49) | NR | Male | 3 | Capsule | PM |
| [Todor 2016](#5) | 25 | 18-55 | NR | NR | 18 | Capsule | EM |
| [Todor 2016](#5) | 25 | 18-55 | NR | NR | 2 | Capsule | PM |

**Table 2:**<a name="table-2"></a> Clinical atomoxetine concentration-time data used for model building and verification. \*: Single oral dose unless otherwise specified; AS: activity score; b.i.d.: twice daily; EM: extensive metabolizer; IM: intermediate metabolizer; NM: normal metabolizer; NR: not reported; PM: poor metabolizer; PT: predicted phenotype; q.d.: once daily; UM: ultrarapid metabolizer; <sup>+</sup>: data used for model building. Parenthetical PTs for AS-coded rows use the current CPIC CYP2D6 activity score-to-phenotype mapping ([Moore 2026](#5)).

## 2.3 Model parameters and assumptions<a id="23"></a>

### Absorption

The model includes oral solution, capsule, and tablet applications. Oral absorption was described using PK-Sim permeability and formulation settings. The `Specific intestinal permeability` was optimized to 5.23E-05 cm/min based on oral concentration-time data.

No separate dissolution model was used. Solution and solid formulations were represented by their application and formulation settings.

### Distribution

Atomoxetine is highly bound to plasma proteins. A fraction unbound of 1.30% was used as summarized in Section 2.2.1.

Lipophilicity was optimized to logP 3.49. Partition coefficients were calculated with the Berezhkovskiy method. Cellular permeabilities were calculated with the PK-Sim Standard method.

Distribution was not stratified by CYP2D6 phenotype. Differences between poor, normal, and higher-activity groups are represented through metabolic capacity, while the same compound distribution assumptions are applied to all adult simulations.

### Metabolism and elimination

Two metabolic pathways and passive renal filtration are represented in the model.

* CYP2D6

CYP2D6 is the dominant pathway for atomoxetine clearance in normal metabolizers. CYP2D6 metabolism is represented by Michaelis-Menten kinetics. CYP2D6 poor-metabolizer k<sub>cat</sub> is set to zero, and non-zero activity-score groups use optimized or activity-score scaled k<sub>cat</sub> values.

The same CYP2D6 K<sub>m</sub> is used across CYP2D6 groups. Activity-score effects are represented by changes in k<sub>cat</sub>.

* CYP2C19

CYP2C19 metabolism is represented by Michaelis-Menten kinetics. CYP2C19 K<sub>m</sub> was taken from [Ring 2002](#5), and CYP2C19 k<sub>cat</sub> was optimized.

* Renal elimination

Passive renal filtration is represented with a `GFR fraction` of 1.

### DDI parameters

The snapshot contains competitive inhibition parameters for parent atomoxetine in a perpetrator role. This compound evaluation report does not verify these parameters with sensitive CYP2D6 or CYP3A4 substrates and does not independently qualify atomoxetine perpetrator simulations. The CYP2D6 interaction network evaluates applicable DDI and DDGI scenarios separately ([Rüdesheim 2025](#5)).

#### CYP2D6 inhibition

Competitive inhibition of CYP2D6 is represented with a K<sub>i</sub> of 3.60 µmol/L. The value was adopted from [Sauer 2004](#5) and is documented for the published atomoxetine perpetrator model in Table S11 of the CYP2D6 network supplement ([Rüdesheim 2025](#5)).

#### CYP3A4 inhibition

Competitive inhibition of CYP3A4 is represented with a K<sub>i</sub> of 34.00 µmol/L. The value was adopted from [Sauer 2004](#5) and is documented in Table S11 of the CYP2D6 network supplement ([Rüdesheim 2025](#5)). Only inhibition by parent atomoxetine is represented. Contributions from atomoxetine metabolites are outside the scope of this parent-only model.

# 3 Results and Discussion<a id="3"></a>

The PBPK model for atomoxetine was developed and evaluated with clinical pharmacokinetic data after oral administration. The evaluation covers single-dose and repeated-dose oral administration, solution, capsule, and tablet dosing, and CYP2D6 normal/extensive, intermediate, and poor metabolizer groups represented by genotype, phenotype, or activity score.

The model-building data supported the oral absorption description, CYP2D6-mediated clearance, CYP2D6-independent metabolism, passive renal filtration, and activity-score-dependent clearance implementation. Model-building studies included solution and capsule data from [Nakano 2016](#5), CYP2D6 poor- and extensive-metabolizer data from [Sauer 2003](#5), and activity-score stratified data from [Byeon 2015](#5) and [Kim 2018](#5). Verification included independent oral studies from [Belle 2002](#5), [Cui 2007](#5), [Byeon 2015](#5), [Kim 2018](#5), and [Todor 2016](#5).

The next sections show:

1. the final model input parameters for the building blocks in Section 3.1.
2. the overall goodness of fit in Section 3.2.
3. simulated vs. observed concentration-time profiles for the clinical studies used for model building and for model verification in Section 3.3.

## 3.1 Atomoxetine final input parameters<a id="31"></a>

The final Atomoxetine input parameter table summarizes the drug-dependent model parameters used for the evaluated simulations.

### Compound: Atomoxetine

#### Parameters

Name                                             | Value                  | Value Origin                                                | Alternative | Default
------------------------------------------------ | ---------------------- | ----------------------------------------------------------- | ----------- | -------
Solubility at reference pH                       | 10.29 mg/ml            | Publication-Literature value in, Swain 2012                 | Measurement | True   
Reference pH                                     | 7.4                    | Publication                                                 | Measurement | True   
Lipophilicity                                    | 3.4885087539 Log Units | Parameter Identification-Parameter Identification-Optimized | LogP        | True   
Lipophilicity                                    | 3.65 Log Units         |                                                             | Mohan 2015  | False  
Lipophilicity                                    | 3.81 Log Units         | Publication-Literature value in, Swain 2012                 | ChemAxon    | False  
Fraction unbound (plasma, reference value)       | 1.3 %                  | Publication-In Vivo-Literature value in, Yu 2016            | Measurement | True   
Fraction unbound (plasma, reference value)       | 3.9 %                  | Unknown-Watanabe 2018                                       | Calculated  | False  
Specific intestinal permeability (transcellular) | 5.23E-05 cm/min        | Parameter Identification-Parameter Identification-Optimized | Optimized   | True   
Is small molecule                                | Yes                    |                                                             |             |        
Molecular weight                                 | 255.35 g/mol           | Publication-Literature value in, Zhong et al. 2013          |             |        
Plasma protein binding partner                   | Albumin                |                                                             |             |        

#### Calculation methods

Name                    | Value          
----------------------- | ---------------
Partition coefficients  | Berezhkovskiy  
Cellular permeabilities | PK-Sim Standard

#### Processes

##### Metabolizing Enzyme: CYP2D6-Ring 2002 (4-hydroxylation)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                        | Value Origin                                               
------------------------------------------- | ---------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 115 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein      | Unknown                                                    
Km                                          | 2.3 µmol/l                   | Publication-In Vitro-Literature value in, Ring et al. 2002 
kcat                                        | 37.4392066898 1/min          | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=0

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                                       
------------------------------------------- | -------------------------- | -------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                    
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                            
Km                                          | 2.3 µmol/l                 | Publication-In Vitro-Same CYP2D6 Km as base model, Ring et al. 2002

##### Systemic Process: Glomerular Filtration-Assumed

Species: Human

###### Parameters

Name         | Value | Value Origin 
------------ | -----:| -------------
GFR fraction |     1 | Other-Assumed

##### Metabolizing Enzyme: CYP2D6-AS=2

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                                             
------------------------------------------- | -------------------------- | -------------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                          
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                                  
Km                                          | 2.3 µmol/l                 | Publication-In Vitro-Same CYP2D6 Km as base model, Ring et al. 2002      
kcat                                        | 103.82 1/min               | Parameter Identification-Parameter Identification-Optimized AS=2 baseline

##### Metabolizing Enzyme: CYP2D6-AS=0.5

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                                       
------------------------------------------- | -------------------------- | -------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                    
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                            
Km                                          | 2.3 µmol/l                 | Publication-In Vitro-Same CYP2D6 Km as base model, Ring et al. 2002
kcat                                        | 16.79 1/min                | Other-Manual Fit-CYP2D6 activity-score scaling                     

##### Metabolizing Enzyme: CYP2D6-AS=1.25

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                                       
------------------------------------------- | -------------------------- | -------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                    
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                            
Km                                          | 2.3 µmol/l                 | Publication-In Vitro-Same CYP2D6 Km as base model, Ring et al. 2002
kcat                                        | 53.44 1/min                | Other-Manual Fit-CYP2D6 activity-score scaling                     

##### Metabolizing Enzyme: CYP2C19-Ring 2002

Molecule: CYP2C19

###### Parameters

Name                                        | Value                       | Value Origin                                               
------------------------------------------- | --------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 97 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 19 pmol/mg mic. protein     | Unknown                                                    
Km                                          | 83 µmol/l                   | Publication-In Vitro-Literature value in, Ring et al. 2002 
kcat                                        | 165.2291488831 1/min        | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=1

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                                       
------------------------------------------- | -------------------------- | -------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                    
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                            
Km                                          | 2.3 µmol/l                 | Publication-In Vitro-Same CYP2D6 Km as base model, Ring et al. 2002
kcat                                        | 39.7 1/min                 | Other-Manual Fit-CYP2D6 activity-score scaling                     

##### Inhibition: CYP2D6-Sauer 2004

Molecule: CYP2D6

###### Parameters

Name | Value      | Value Origin                  
---- | ---------- | ------------------------------
Ki   | 3.6 µmol/l | Publication-Unknown-Sauer 2004

##### Inhibition: CYP3A4-Sauer 2004

Molecule: CYP3A4

###### Parameters

Name | Value     | Value Origin                  
---- | --------- | ------------------------------
Ki   | 34 µmol/l | Publication-Unknown-Sauer 2004

## 3.2 Diagnostic plots<a id="32"></a>

The first goodness-of-fit plot compares observed and simulated atomoxetine concentrations. The second plot shows log residuals over time. Administration route, formulation, and model-building or verification status are not used to stratify these diagnostics.

<a id="table-3-1"></a>

**Table 3-1: GMFE for Atomoxetine goodness-of-fit diagnostics**

|Group       |GMFE |
|:-----------|:----|
|Atomoxetine |1.29 |

<br>
<br>

<a id="figure-3-1"></a>

![](images/006_section_3/008_section_32/2_gof_plot_predictedVsObserved.png)

**Figure 3-1: Atomoxetine goodness-of-fit diagnostics**

<br>
<br>

<a id="figure-3-2"></a>

![](images/006_section_3/008_section_32/3_gof_plot_residualsOverTime.png)

**Figure 3-2: Atomoxetine goodness-of-fit diagnostics**

<br>
<br>

## 3.3 Concentration-time profiles<a id="33"></a>

Simulated versus observed concentration-time profiles of all data listed in Section 2.2.2 (Clinical data) are presented below.

### 3.3.1 Model Building<a id="331"></a>

<a id="figure-3-3"></a>

![](images/006_section_3/009_section_33/010_section_331/2_time_profile_plot_Atomoxetine_Byeon__2015____atomoxetine__40_mg__dose_normalized___n_22__AS_2_.png)

**Figure 3-3: Byeon 2015: atomoxetine, 40 mg (dose normalized), n=22 (AS=2)**

<br>
<br>

<a id="figure-3-4"></a>

![](images/006_section_3/009_section_33/010_section_331/7_time_profile_plot_Atomoxetine_Kim__2018____atomoxetine__20_mg__po__n_11__AS_2_.png)

**Figure 3-4: Kim 2018: atomoxetine, 20 mg, po, n=11 (AS=2)**

<br>
<br>

<a id="figure-3-5"></a>

![](images/006_section_3/009_section_33/010_section_331/9_time_profile_plot_Atomoxetine_Nakano__2016____atomoxetine__50_mg__po_capsules__n_42__EM_.png)

**Figure 3-5: Nakano 2016: atomoxetine, 50 mg, po capsules, n=42 (EM)**

<br>
<br>

<a id="figure-3-6"></a>

![](images/006_section_3/009_section_33/010_section_331/10_time_profile_plot_Atomoxetine_Nakano__2016____atomoxetine__50_mg__po_solution__n_42__EM_.png)

**Figure 3-6: Nakano 2016: atomoxetine, 50 mg, po solution, n=42 (EM)**

<br>
<br>

<a id="figure-3-7"></a>

![](images/006_section_3/009_section_33/010_section_331/11_time_profile_plot_Atomoxetine_Sauer__2003____atomoxetine__20_mg_b_i_d___po__n_3__PM_.png)

**Figure 3-7: Sauer 2003: atomoxetine, 20 mg b.i.d., 11 doses, po, n=3 (PM)**

<br>
<br>

<a id="figure-3-8"></a>

![](images/006_section_3/009_section_33/010_section_331/12_time_profile_plot_Atomoxetine_Sauer__2003____atomoxetine__20_mg_b_i_d___po__n_4__EM_.png)

**Figure 3-8: Sauer 2003: atomoxetine, 20 mg b.i.d., 11 doses, po, n=4 (EM)**

<br>
<br>

### 3.3.2 Model Verification<a id="332"></a>

The following verification profiles compare the final model with independent atomoxetine studies across dose, formulation, and CYP2D6 activity groups. They should be interpreted together with the study-specific observed-data records and the merged goodness-of-fit diagnostic.

<a id="figure-3-9"></a>

![](images/006_section_3/009_section_33/011_section_332/1_time_profile_plot_Atomoxetine_Belle__2002____atomoxetine__20_mg_b_i_d___9_doses__po__n_22__EM_.png)

**Figure 3-9: Belle 2002: atomoxetine, 20 mg b.i.d., 9 doses, po, n=22 (EM)**

<br>
<br>

<a id="figure-3-10"></a>

![](images/006_section_3/009_section_33/011_section_332/3_time_profile_plot_Atomoxetine_Byeon__2015____atomoxetine__40_mg__dose_normalized___po__n_18__AS_0_5_.png)

**Figure 3-10: Byeon 2015: atomoxetine, 40 mg (dose normalized), po, n=18 (AS=0.5)**

<br>
<br>

<a id="figure-3-11"></a>

![](images/006_section_3/009_section_33/011_section_332/4_time_profile_plot_Atomoxetine_Byeon__2015____atomoxetine__40_mg__dose_normalized___po__n_22__AS_1_25_.png)

**Figure 3-11: Byeon 2015: atomoxetine, 40 mg (dose normalized), po, n=22 (AS=1.25)**

<br>
<br>

<a id="figure-3-12"></a>

![](images/006_section_3/009_section_33/011_section_332/5_time_profile_plot_Atomoxetine_Cui__2007____atomoxetine__40_mg__po__n_16__AS_1_.png)

**Figure 3-12: Cui 2007: atomoxetine, 40 mg q.d., day 1, po, n=16 (AS=1)**

<br>
<br>

<a id="figure-3-13"></a>

![](images/006_section_3/009_section_33/011_section_332/6_time_profile_plot_Atomoxetine_Cui__2007____atomoxetine__80_mg__po__n_16__AS_1_.png)

**Figure 3-13: Cui 2007: atomoxetine, 40 mg q.d. for 3 days, then 80 mg q.d. for 7 days, po, n=16 (AS=1)**

<br>
<br>

<a id="figure-3-14"></a>

![](images/006_section_3/009_section_33/011_section_332/8_time_profile_plot_Atomoxetine_Kim__2018____atomoxetine__20_mg__po__n_8__AS_0_5_.png)

**Figure 3-14: Kim 2018: atomoxetine, 20 mg, po, n=8 (AS=0.5)**

<br>
<br>

<a id="figure-3-15"></a>

![](images/006_section_3/009_section_33/011_section_332/13_time_profile_plot_Atomoxetine_Todor__2016____atomoxetine__25_mg__po__n_18__EM_.png)

**Figure 3-15: Todor 2016: atomoxetine, 25 mg, po, n=18 (EM)**

<br>
<br>

<a id="figure-3-16"></a>

![](images/006_section_3/009_section_33/011_section_332/14_time_profile_plot_Atomoxetine_Todor__2016____atomoxetine__25_mg__po__n_2__PM_.png)

**Figure 3-16: Todor 2016: atomoxetine, 25 mg, po, n=2 (PM)**

<br>
<br>

# 4 Conclusion<a id="4"></a>

The atomoxetine PBPK model describes the evaluated plasma concentration-time data after oral doses of 20-80 mg in healthy adults. The evaluation includes single-dose and repeated-dose administration, solution, capsule, and tablet formulations, and CYP2D6 poor, intermediate, and normal/extensive metabolizer groups represented by phenotype, genotype, or activity score.

The model uses common absorption and distribution parameters across CYP2D6 groups. CYP2D6 and CYP2C19 represent metabolism, and passive glomerular filtration represents renal elimination. Activity-score-dependent CYP2D6 catalytic rates describe the observed differences in atomoxetine exposure across the evaluated CYP2D6 groups.

The concentration-time profiles and goodness-of-fit diagnostics characterize model performance for adult oral atomoxetine simulations within the evaluated dose, formulation, regimen, and CYP2D6 ranges. No formal acceptance criterion was applied. The snapshot also contains competitive CYP2D6 and CYP3A4 inhibition parameters for parent atomoxetine.

The main limitation is the absence of an explicit 4-hydroxyatomoxetine metabolite.

# 5 References<a id="5"></a>

[1] Rüdesheim S, Selzer D, Mürdter T, Igel S, Kerb R, Schwab M, Lehr T. Physiologically Based Pharmacokinetic Modeling to Describe the CYP2D6 Activity Score-Dependent Metabolism of Paroxetine, Atomoxetine and Risperidone. Pharmaceutics. 2022;14:1734. doi: [10.3390/pharmaceutics14081734](https://doi.org/10.3390/pharmaceutics14081734).

[2] Belle DJ, et al. Effect of potent CYP2D6 inhibition by paroxetine on atomoxetine pharmacokinetics. Journal of Clinical Pharmacology. 2002;42:1219-1227. doi: [10.1177/009127002762491307](https://doi.org/10.1177/009127002762491307).

[3] Byeon JY, et al. Effects of the CYP2D6*10 allele on the pharmacokinetics of atomoxetine and its metabolites. Archives of Pharmacal Research. 2015;38:2083-2091. doi: [10.1007/s12272-015-0646-z](https://doi.org/10.1007/s12272-015-0646-z).

[4] Cui YM, et al. Atomoxetine pharmacokinetics in healthy Chinese subjects and effect of the CYP2D6*10 allele. British Journal of Clinical Pharmacology. 2007;64:445-449. doi: [10.1111/j.1365-2125.2007.02912.x](https://doi.org/10.1111/j.1365-2125.2007.02912.x).

[5] Kim SH, et al. Physiologically based pharmacokinetic modelling of atomoxetine with regard to CYP2D6 genotypes. Scientific Reports. 2018;8:12405. doi: [10.1038/s41598-018-30841-8](https://doi.org/10.1038/s41598-018-30841-8).

[6] Nakano M, Witcher J, Satoi Y, Goto T. Pharmacokinetic profile and palatability of atomoxetine oral solution in healthy Japanese male adults. Clinical Drug Investigation. 2016;36:903-911. doi: [10.1007/s40261-016-0430-y](https://doi.org/10.1007/s40261-016-0430-y).

[7] Sauer JM, et al. Disposition and metabolic fate of atomoxetine hydrochloride: The role of CYP2D6 in human disposition and metabolism. Drug Metabolism and Disposition. 2003;31:98-107. doi: [10.1124/dmd.31.1.98](https://doi.org/10.1124/dmd.31.1.98).

[8] Todor I, et al. Evaluation of a potential metabolism-mediated drug-drug interaction between atomoxetine and bupropion in healthy volunteers. Journal of Pharmacy and Pharmaceutical Sciences. 2016;19:198-207. doi: [10.18433/J3H03R](https://doi.org/10.18433/J3H03R).

[9] Ring BJ, Gillespie JS, Eckstein JA, Wrighton SA. Identification of the human cytochromes P450 responsible for atomoxetine metabolism. Drug Metabolism and Disposition. 2002;30:319-323. doi: [10.1124/dmd.30.3.319](https://doi.org/10.1124/dmd.30.3.319).

[10] Yu G, Li GF, Markowitz JS. Atomoxetine: A review of its pharmacokinetics and pharmacogenomics relative to drug disposition. Journal of Child and Adolescent Psychopharmacology. 2016;26:314-326. doi: [10.1089/cap.2015.0137](https://doi.org/10.1089/cap.2015.0137).

[11] Kuepfer L, Niederalt C, Wendl T, Schlender JF, Willmann S, Lippert J, Block M, Eissing T, Teutonico D. Applied Concepts in PBPK Modeling: How to Build a PBPK/PD Model. CPT Pharmacometrics Syst Pharmacol. 2016;5:516-531. doi: [10.1002/psp4.12134](https://doi.org/10.1002/psp4.12134).

[12] Willmann S, Höhn K, Edginton A, Sevestre M, Solodenko J, Weiss W, Lippert J, Schmitt W. Development of a physiology-based whole-body population model for assessing the influence of individual variability on the pharmacokinetics of drugs. J Pharmacokinet Pharmacodyn. 2007;34:401-431. doi: [10.1007/s10928-007-9059-5](https://doi.org/10.1007/s10928-007-9059-5).

[13] Zhong H, Mashinson V, Woolman T, Zha M. Understanding the Molecular Properties and Metabolism of Top Prescribed Drugs. Curr Top Med Chem. 2013;13:1290-1307. doi: [10.2174/15680266113139990034](https://doi.org/10.2174/15680266113139990034).

[14] Swain M. chemicalize.org. Journal of Chemical Information and Modeling. 2012;52:613-615. doi: [10.1021/ci300046g](https://doi.org/10.1021/ci300046g).

[15] Sauer JM, Long AJ, Ring B, Gillespie JS, Sanburn NP, DeSante KA, et al. Atomoxetine hydrochloride: Clinical drug-drug interaction prediction and outcome. Journal of Pharmacology and Experimental Therapeutics. 2004;308:410-418. doi: [10.1124/jpet.103.058727](https://doi.org/10.1124/jpet.103.058727).

[16] Rüdesheim S, Loer HLH, Feick D, Marok FZ, Fuhr LM, Selzer D, et al. A Comprehensive CYP2D6 Drug-Drug-Gene Interaction Network for Application in Precision Dosing and Drug Development. Clinical Pharmacology & Therapeutics. 2025;117:1718-1731. doi: [10.1002/cpt.3604](https://doi.org/10.1002/cpt.3604).

[17] Moore C, Bourque MS, Halman A, Agúndez JAG, Prows CA, Hikino K, et al. Clinical Pharmacogenetics Implementation Consortium (CPIC) Guideline for CYP2D6 Genotype and Use of 5-HT<sub>3</sub> Receptor Antagonists: 2026 Update. Clinical Pharmacology & Therapeutics. 2026;120:387-393. doi: [10.1002/cpt.70291](https://doi.org/10.1002/cpt.70291).

