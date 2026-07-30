# Building and evaluation of a PBPK model for Metoprolol in CYP2D6 phenotype and activity-score groups

| Version                                         | v1.0-OSP12.2                                                  |
| ----------------------------------------------- | ----------------------------------------------------------- |
| based on *Model Snapshot* and *Evaluation Plan* | https://github.com/Open-Systems-Pharmacology/Metoprolol-Model/releases/tag/v1.0 |
| OSP Version                                     | 12.2                                                         |
| Qualification Framework Version                 | 3.3                                                         |

This evaluation report and the corresponding PK-Sim project file are filed at:

https://github.com/Open-Systems-Pharmacology/OSP-PBPK-Model-Library/

# Table of Contents

 * [1 Introduction](#1)
 * [2 Methods](#2)
   * [2.1 Modeling strategy](#21)
   * [2.2 Data used](#22)
   * [2.3 Model parameters and assumptions](#23)
 * [3 Results and Discussion](#3)
   * [3.1 Metoprolol final input parameters](#31)
   * [3.2 Diagnostic plots](#32)
     * [3.2.1 Metoprolol racemate goodness-of-fit diagnostics](#321)
     * [3.2.2 (R)-Metoprolol goodness-of-fit diagnostics](#322)
     * [3.2.3 (S)-Metoprolol goodness-of-fit diagnostics](#323)
     * [3.2.4 α-Hydroxymetoprolol goodness-of-fit diagnostics](#324)
   * [3.3 Concentration-time profiles](#33)
     * [3.3.1 Model Building](#331)
     * [3.3.2 Model Verification](#332)
 * [4 Conclusion](#4)
 * [5 References](#5)

# 1 Introduction<a id="1"></a>

Metoprolol is a selective beta1-adrenoceptor blocker used in cardiovascular indications including hypertension, angina pectoris, arrhythmias and heart failure. Metoprolol pharmacokinetics show substantial interindividual variability because CYP2D6 is the dominant enzyme involved in oxidative metabolism and CYP2D6 activity varies across genetic activity-score groups ([Rüdesheim 2020](#5)).

The model describes metoprolol as a whole-body parent-metabolite PBPK model with separate (R)-metoprolol and (S)-metoprolol enantiomers, racemic metoprolol as an observed composite endpoint and α-hydroxymetoprolol as a metabolite. This structure supports evaluation of racemic and enantiomer-specific plasma concentration-time data after intravenous infusion, oral immediate-release metoprolol tartrate and oral controlled-release metoprolol succinate administration.

The clinical evaluation covers adult plasma pharmacokinetic data across a dose range of 5 to 200 mg and includes studies with CYP2D6 activity-score or phenotype information. The model was developed to describe metoprolol disposition, α-hydroxymetoprolol formation and CYP2D6 drug-gene effects, and was subsequently used as a CYP2D6 substrate model in the broader CYP2D6 drug-drug-gene interaction network ([Rüdesheim 2020](#5), [Rüdesheim 2025](#5)).

# 2 Methods<a id="2"></a>

## 2.1 Modeling strategy<a id="21"></a>

The PBPK model was developed using the Open Systems Pharmacology Suite. Distribution and elimination processes were implemented in a whole-body model structure using standard physiological organ compartments and compound-specific physicochemical and biochemical input parameters.

Model development followed an iterative workflow in which in vitro and physicochemical information was combined with clinical plasma concentration-time data. Parameters with direct literature support were used as fixed inputs where possible, while selected parameters controlling oral absorption, CYP2D6 activity-score-dependent metabolism and residual clearance were optimized against clinical data.

The model represents (R)-metoprolol and (S)-metoprolol as separate compounds because CYP2D6-mediated metabolism is enantiomer-specific. Racemic metoprolol is represented as an observer output for comparison with clinical studies reporting total metoprolol. α-Hydroxymetoprolol is included as a measured metabolite formed through the α-hydroxylation pathway.

The base metoprolol model was informed by intravenous and oral metoprolol studies covering immediate-release tartrate and controlled-release succinate formulations. Intravenous infusion studies supported systemic disposition and clearance assumptions, while oral studies informed formulation and first-pass behavior. The CYP2D6 activity-score model used clinical studies with reported CYP2D6 phenotypes, genotypes or derived activity scores to identify activity-score-dependent k<sub>cat</sub> values for both enantiomers ([Rüdesheim 2020](#5)).

The major proteins represented in the model are CYP2D6 and CYP3A4. CYP2D6 accounts for α-hydroxylation and O-demethylation pathways and is activity-score-dependent. CYP3A4 is represented as a first-order clearance component to account for CYP2D6-independent oxidative metabolism. Renal filtration and unspecific hepatic clearance are retained where required for the parent and metabolite disposition.

## 2.2 Data used<a id="22"></a>

### In vitro and physicochemical data

Drug-dependent input parameters for the metoprolol enantiomers were taken from the published metoprolol PBPK model and its cited primary sources ([Rüdesheim 2020](#5)). The model uses the same physicochemical properties for both enantiomers when the source data do not support an enantiomer-specific difference.

| Parameter | Unit | (R)-metoprolol | (S)-metoprolol | Source | Description |
| --- | --- | ---: | ---: | --- | --- |
| MW | g/mol | 267.36 | 267.36 | Literature | Molecular weight. |
| pK<sub>a</sub>,base | - | 9.70 | 9.70 | Literature | pKa of a basic ionization site. |
| Solubility, tartrate | g/mL | 1.00 | 1.00 | Literature | Aqueous solubility of the tartrate salt at pH 7.4. |
| Solubility, succinate | g/mL | 0.16 | 0.16 | Literature | Aqueous solubility of the succinate salt at pH 5.5. |
| logP | - | 1.77 | 1.77 | Literature | Octanol-water partition coefficient of the neutral species. |
| f<sub>u</sub> | % | 88 | 88 | Literature | Fraction unbound in plasma. |
| K<sub>m,CYP2D6</sub>, αHM | µmol/L | 10.08 | 10.75 | [Mautz 1995](#5) | Michaelis constant for α-hydroxymetoprolol formation. |
| k<sub>cat,CYP2D6</sub>, αHM, AS=2 | 1/min | 10.17 | 11.19 | Optimized | Catalytic rate constant for α-hydroxymetoprolol formation. |
| K<sub>m,CYP2D6</sub>, ODM | µmol/L | 8.82 | 12.43 | [Mautz 1995](#5) | Michaelis constant for O-demethylmetoprolol formation. |
| k<sub>cat,CYP2D6</sub>, ODM, AS=2 | 1/min | 16.69 | 14.02 | Optimized | Catalytic rate constant for O-demethylmetoprolol formation. |
| CL<sub>hep</sub> | 1/min | 0.08 | 0.09 | Optimized | Unspecific hepatic clearance. |
| GFR fraction | - | 1.00 | 1.00 | Assumed | Fraction used to scale passive glomerular filtration. |
| EHC fraction | - | 1.00 | 1.00 | Assumed | Fraction released continuously into bile. |
| P<sub>int</sub> | cm/min | 4.14 × 10<sup>−5</sup> | 4.14 × 10<sup>−5</sup> | Optimized | Specific transcellular intestinal permeability. |
| Partition coefficients | - | Rodgers and Rowland | Rodgers and Rowland | Calculated | Tissue-to-plasma partition coefficients calculated with the Rodgers and Rowland method. |
| Cellular permeabilities | cm/min | 4.64 × 10<sup>−3</sup> | 4.64 × 10<sup>−3</sup> | Calculated | Cellular permeabilities calculated with the PK-Sim Standard method. |
| t<sub>50,IR</sub> | min | 12.31 | 12.31 | Optimized | Time to dissolve 50% of the immediate-release dose. |
| Weibull shape, IR | - | 0.72 | 0.72 | Optimized | Shape parameter for immediate-release dissolution. |
| t<sub>50,CR</sub> | min | 331.92 | 331.92 | Optimized | Time to dissolve 50% of the controlled-release dose. |
| Weibull shape, CR | - | 1.53 | 1.53 | Optimized | Shape parameter for controlled-release dissolution. |

**Table 1:**<a name="table-1"></a> Drug-dependent parameters for (R)-metoprolol and (S)-metoprolol from Table 2 of [Rüdesheim 2020](#5). AS: activity score; CR: controlled release; EHC: enterohepatic circulation; GFR: glomerular filtration rate; IR: immediate release; ODM: O-demethylmetoprolol; αHM: α-hydroxymetoprolol.

| AS | (R)-metoprolol k<sub>cat</sub> → αHM [1/min] | (R)-metoprolol k<sub>cat</sub> → ODM [1/min] | (S)-metoprolol k<sub>cat</sub> → αHM [1/min] | (S)-metoprolol k<sub>cat</sub> → ODM [1/min] | Origin |
| ---: | ---: | ---: | ---: | ---: | --- |
| 0 | 0.00 | 0.00 | 0.00 | 0.00 | Assumed |
| 0.5 | 1.65 | 2.70 | 1.82 | 2.27 | Optimized |
| 1.25 | 5.73 | 9.40 | 6.30 | 7.89 | Optimized |
| 1.5 | 6.38 | 10.48 | 7.03 | 8.81 | Optimized |
| 2 | 10.17 | 16.69 | 11.19 | 14.02 | Optimized |
| 3 | 19.03 | 31.22 | 20.93 | 26.23 | Optimized |

**Table 1a:**<a name="table-1a"></a> CYP2D6 activity-score-specific k<sub>cat</sub> values for metoprolol metabolism from Table 3 and Supplement Table S3.1.1 of [Rüdesheim 2020](#5). AS = 0 represents the assumed absence of CYP2D6 activity. The other values were optimized. AS: activity score; ODM: O-demethylmetoprolol; αHM: α-hydroxymetoprolol.

### Clinical data

The evaluation uses 40 plasma concentration-time profiles from adults ([Table 2](#table-2)). Eighteen profiles were used for model building and 22 profiles were used for model verification. The assignments follow the training and test classifications in the published model.

| Source | Dose [mg] / schedule\* | Age [years] | Weight [kg] | Sex | N | Form. | CYP2D6 characterization |
| --- | --- | --- | --- | --- | ---: | --- | --- |
| [Bae 2014](#5) | 100 | NR | NR | Male | 3 | Tablet IR | AS = 0.5 (IM) |
| [Bae 2014](#5) | 100 | NR | NR | Male | 4 | Tablet IR | AS = 2 (NM) |
| [Damy 2004](#5)<sup>+</sup> | 200 q.d. | 21-45 | NR | 27% female | 13 | Tablet CR | NM |
| [Godbillon 1985](#5) | 88.7, intravenous infusion over 150 min | 23-29 | NR | 17% female | 6 | Solution | EM |
| [Hamelin 2000](#5) | 100 | 26 (20-36) | 73 (59-96) | Male | 10 | Tablet IR | NM |
| [Hamelin 2000](#5) | 100 | 26 (20-36) | 73 (59-96) | Male | 6 | Tablet IR | PM |
| [Huang 1999](#5)<sup>+</sup> | 100 | 24 | 63 | Male | 12 | Tablet IR | AS = 0.5 (IM) |
| [Huang 1999](#5)<sup>+</sup> | 100 | 24 | 65 | Male | 12 | Tablet IR | AS = 1.25 (NM) |
| [Huang 1999](#5)<sup>+</sup> | 100 | 25 | 65 | Male | 16 | Tablet IR | AS = 2 (NM) |
| [Jin 2008](#5)<sup>+</sup> | 100 | 23 | 67 | 22% female | 5 | Tablet IR | AS = 0.5 (IM) |
| [Jin 2008](#5)<sup>+</sup> | 100 | 23 | 67 | 22% female | 7 | Tablet IR | AS = 1.25 (NM) |
| [Jin 2008](#5)<sup>+</sup> | 100 | 23 | 67 | 22% female | 6 | Tablet IR | AS = 2 (NM) |
| [Johnson and Burlew 1996](#5)<sup>+</sup> | 200 | 29 (24-36) | 82 | Male | 10 | Tablet IR | NM |
| [Johnson and Burlew 1996](#5)<sup>+</sup> | 200 | 29 (24-40) | 85 | Male | 10 | Tablet IR | NM |
| [Johnsson 1975](#5) | 5, intravenous infusion over 10 min | 23-28 | 62-70 | Male | 5 | Solution | EM |
| [Johnsson 1975](#5) | 10, intravenous infusion over 10 min | 23-28 | 62-70 | Male | 5 | Solution | EM |
| [Johnsson 1975](#5) | 15, intravenous infusion over 10 min | 23-28 | 62-70 | Male | 5 | Solution | EM |
| [Johnsson 1975](#5) | 20, intravenous infusion over 10 min | 23-28 | 62-70 | Male | 5 | Solution | EM |
| [Johnsson 1975](#5) | 20 | 23-28 | 62-70 | Male | 5 | Tablet IR | EM |
| [Johnsson 1975](#5) | 50 | 23-28 | 62-70 | Male | 5 | Tablet IR | EM |
| [Johnsson 1975](#5) | 100 | 23-28 | 62-70 | Male | 5 | Tablet IR | EM |
| [Kelly 1985](#5)<sup>+</sup> | 50, intravenous infusion over 10 min | 19-26 | 60-98 | Male | 12 | Solution | EM |
| [Kelly 1985](#5)<sup>+</sup> | 100 b.i.d., multiple dose | 19-26 | 60-98 | Male | 12 | NR | EM |
| [Kirchheiner 2004 / Seeringer 2008](#5)<sup>+</sup> | 100 | 28 (23-34) | 77 (69-81) | Male | 13 | Tablet IR | AS = 2 (NM) |
| [Kirchheiner 2004 / Seeringer 2008](#5)<sup>+</sup> | 100 | 38 (29-40) | 90 (77-101) | Male | 4 | Tablet IR | AS = 0 (PM) |
| [Kirchheiner 2004 / Seeringer 2008](#5)<sup>+</sup> | 100 | 28 (25-37) | 76 (70-80) | 8% female | 12 | Tablet IR | AS = 3 (UM) |
| [Krösser 2006](#5) | 100 | 29 (18-39) | 79 (62-100) | Male | 18 | Tablet IR | NM |
| [Luzier 1999](#5) | 100 b.i.d., multiple dose | 25 (21-35) | 62 (54-77) | Female | 10 | Tablet IR | NM |
| [Luzier 1999](#5) | 100 b.i.d., multiple dose | 26 (20-36) | 84 (66-97) | Male | 10 | Tablet IR | NM |
| [Parker and Soberman 2011](#5) | 100 | 21-45 | NR | 27% female | 15 | Tablet CR | AS = 1.5 (NM) |
| [Parker and Soberman 2011](#5) | 100 b.i.d., multiple dose | 21-45 | NR | 27% female | 15 | Tablet IR | AS = 1.5 (NM) |
| [Parker and Soberman 2011](#5) | 200 | 21-45 | NR | 27% female | 15 | Tablet CR | AS = 1.5 (NM) |
| [Regårdh 1974](#5)<sup>+</sup> | 5, intravenous infusion over 10 min | 23-28 | 62-70 | Male | 5 | Solution | EM |
| [Regårdh 1974](#5)<sup>+</sup> | 5 | 23-28 | 62-70 | Male | 5 | Oral solution | EM |
| [Regårdh and Johnsson 1980](#5) | 10, intravenous infusion over 5 min | 23-28 | NR | Male | 6 | Solution | EM |
| [Sharma 2005](#5)<sup>+</sup> | 100 | 27 (18-40) | 60 (49-100) | Female | 16 | NR | AS = 1.5 (NM) |
| [Sharma 2005](#5)<sup>+</sup> | 100 | 27 (18-40) | 60 (49-100) | Female | 4 | NR | AS = 0 (PM) |
| [Stout 2011](#5) | 50 | 28 (18-45) | 82 (63-94) | Male | 10 | NR | EM |
| [Stout 2011](#5) | 100 | 28 (18-45) | 82 (63-94) | Male | 10 | Tablet CR | EM |
| [Werner 2003](#5) | 50 | 31 | 78 | Male | 12 | Tablet IR | AS = 1.5 (NM) |

**Table 2:**<a name="table-2"></a> Clinical metoprolol concentration-time profiles used for model building and verification. \*: Single oral dose unless otherwise specified; AS: activity score; b.i.d.: twice daily; CR: controlled release; EM: extensive metabolizer; IM: intermediate metabolizer; IR: immediate release; NM: normal metabolizer; NR: not reported; PM: poor metabolizer; PT: predicted phenotype; q.d.: once daily; UM: ultrarapid metabolizer; <sup>+</sup>: data used for model building. Parenthetical PTs for AS-coded rows use the current CPIC CYP2D6 activity score-to-phenotype mapping ([Moore 2026](#5)). EM is the model default when study-specific CYP2D6 information is not available. Only metoprolol-only study arms are included. Coadministered perpetrator arms are outside the scope of this compound report.

## 2.3 Model parameters and assumptions<a id="23"></a>

### Absorption

The model includes oral administration of metoprolol tartrate as a normal-release formulation, metoprolol succinate as a controlled-release formulation and dissolved oral dosing. Formulation behavior is represented through Weibull dissolution parameters for normal-release and controlled-release products, with the same compound intestinal permeability applied to both metoprolol enantiomers.

Oral absorption was evaluated together with first-pass metabolism because most clinical studies report plasma concentration-time data after oral dosing. Intravenous infusion studies were retained to separate systemic disposition from oral formulation behavior where possible.

The specific intestinal permeability was optimized and applied consistently for (R)- and (S)-metoprolol. Differences between CYP2D6 activity-score groups are assigned to metabolism rather than to absorption.

### Distribution

(R)- and (S)-metoprolol use a fraction unbound of 88% and a logP of 1.77 as summarized in [Section 2.2](#22). The same distribution assumptions are used for both enantiomers because the source information does not support separate enantiomer-specific binding or lipophilicity values.

Partition coefficients were calculated with the Rodgers and Rowland method. Cellular permeabilities were calculated with the PK-Sim Standard method. The racemic metoprolol observer is used only for comparison with total metoprolol observations and does not replace the enantiomer-specific disposition model.

α-Hydroxymetoprolol is represented with its own molecular weight, lipophilicity, plasma binding and clearance parameters. This separation is required because metabolite exposure is controlled by both formation from the parent enantiomers and metabolite-specific elimination.

The α-hydroxymetoprolol solubility input is the HMDB ALOGPS prediction of 1.43 g/L, implemented as 1,430 mg/L ([Wishart 2018](#5)). Table S2.4.3 of the published model labels this value as g/mL, but the cited HMDB source establishes g/L.

### Metabolism and elimination

Metoprolol clearance is represented by CYP2D6-dependent α-hydroxylation, CYP2D6-dependent O-demethylation, CYP3A4 first-order clearance, renal filtration and residual clearance components.

* CYP2D6

CYP2D6 is the dominant metabolic enzyme in the model. Separate CYP2D6 pathways are implemented for (R)- and (S)-metoprolol α-hydroxylation and O-demethylation. K<sub>m</sub> values are enantiomer- and pathway-specific, while k<sub>cat</sub> values are scaled by CYP2D6 activity score as documented in Table 3 of [Rüdesheim 2020](#5).

The CYP2D6 activity-score implementation is the key determinant of simulated exposure differences between poor, intermediate, normal and ultrarapid metabolizer groups. Poor-metabolizer activity is set to zero, while non-zero activity-score groups use optimized k<sub>cat</sub> values.

* CYP3A4 and residual clearance

CYP3A4 is implemented as a first-order clearance pathway for each metoprolol enantiomer. This pathway accounts for CYP2D6-independent oxidative clearance and supports simulations in CYP2D6 poor-metabolizer groups without assigning all remaining clearance to renal elimination.

Residual clearance terms are empirical. They should be interpreted as structural model components required to describe total disposition rather than as direct measurements of a single biochemical pathway.

* Renal and metabolite elimination

Renal filtration is included with a GFR fraction of 1 for metoprolol and α-hydroxymetoprolol. α-Hydroxymetoprolol also includes unspecific hepatic clearance to describe metabolite elimination beyond passive filtration.

# 3 Results and Discussion<a id="3"></a>

The evaluation combines goodness-of-fit diagnostics and concentration-time profiles for racemic metoprolol, (R)-metoprolol, (S)-metoprolol and α-hydroxymetoprolol. The diagnostic plots are separated by analyte to avoid ambiguous legends.

The intravenous studies assess systemic disposition. The oral immediate-release tartrate and controlled-release succinate studies assess formulation and first-pass behavior. The CYP2D6-stratified studies assess the activity-score-dependent metabolic implementation.

The evaluation includes adult metoprolol-only study arms. It does not evaluate coadministered perpetrator arms. Residual uncertainty includes genotype-level differences within the same CYP2D6 activity score and the quantitative contribution of non-CYP2D6 metabolism.

## 3.1 Metoprolol final input parameters<a id="31"></a>

The following tables summarize the final drug-dependent model input parameters generated from the model. Parameter values should be interpreted together with the source and method information in [Section 2.2](#22) and [Section 2.3](#23).

### Compound: R-Metoprolol

#### Parameters

Name                                             | Value                   | Value Origin                                                | Alternative          | Default
------------------------------------------------ | ----------------------- | ----------------------------------------------------------- | -------------------- | -------
Solubility at reference pH                       | 1000 mg/ml              | Publication-Avdeef 2001                                     | metoprolol tartrate  | True   
Reference pH                                     | 7.4                     | Unknown                                                     | metoprolol tartrate  | True   
Solubility at reference pH                       | 157 mg/ml               | Publication-Boldhane 2010                                   | metoprolol succinate | False  
Reference pH                                     | 5.5                     | Publication-Boldhane 2010                                   | metoprolol succinate | False  
Lipophilicity                                    | 1.77 Log Units          | Publication-Other-Zhao 2002                                 | logP                 | True   
Fraction unbound (plasma, reference value)       | 0.88                    | Publication-Benfield 1986                                   | fu                   | True   
Specific intestinal permeability (transcellular) | 4.1375817791E-05 cm/min | Parameter Identification-Parameter Identification-Optimized | Optimized            | True   
Is small molecule                                | Yes                     |                                                             |                      |        
Molecular weight                                 | 267.36 g/mol            | Publication-Kim 2019                                        |                      |        
Plasma protein binding partner                   | Albumin                 |                                                             |                      |        

#### Calculation methods

Name                    | Value              
----------------------- | -------------------
Partition coefficients  | Rodgers and Rowland
Cellular permeabilities | PK-Sim Standard    

#### Processes

##### Systemic Process: Glomerular Filtration-ASSUMPTION

Species: Human

###### Parameters

Name         | Value | Value Origin
------------ | -----:| ------------
GFR fraction |     1 | Unknown     

##### Metabolizing Enzyme: CYP3A4-Assumption

Species: Human

Molecule: CYP3A4

###### Parameters

Name                | Value              | Value Origin
------------------- | ------------------ | ------------
Intrinsic clearance | 0 l/min            |             
Specific clearance  | 0.0219977664 1/min | Unknown     

##### Metabolizing Enzyme: CYP2D6-NM, Mautz 1995 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                          | Value Origin                                               
------------------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0.123 nmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein        | Unknown                                                    
Km                                          | 8.82 µmol/l                    | Publication-In Vitro-Mautz 1995                            
kcat                                        | 9.8720570601 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-NM, Mautz 1995 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                          | Value Origin                                               
------------------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0.075 nmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein        | Unknown                                                    
Km                                          | 10.08 µmol/l                   | Publication-In Vitro-Mautz 1995                            
kcat                                        | 6.0195469879 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=2 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 8.82 µmol/l                | Publication-In Vitro-Mautz 1995                            
kcat                                        | 16.6917426582 1/min        | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=2 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 10.08 µmol/l               | Publication-In Vitro-Mautz 1995                            
kcat                                        | 10.1731346705 1/min        | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=1.25 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 10.08 µmol/l               | Publication-In Vitro-Mautz 1995                            
kcat                                        | 5.7303081004 1/min         | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=1.25 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 8.82 µmol/l                | Publication-In Vitro-Mautz 1995                            
kcat                                        | 9.3972567283 1/min         | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=1.5 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 10.08 µmol/l               | Publication-In Vitro-Mautz 1995                            
kcat                                        | 6.3836485827 1/min         | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=1.5 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 8.82 µmol/l                | Publication-In Vitro-Mautz 1995                            
kcat                                        | 10.4784549353 1/min        | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=0.5 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 8.82 µmol/l                | Publication-In Vitro-Mautz 1995                            
kcat                                        | 2.703131627 1/min          | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=0.5 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 10.08 µmol/l               | Publication-In Vitro-Mautz 1995                            
kcat                                        | 1.6472208352 1/min         | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-PM, AS=0 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                   
------------------------------------------- | -------------------------- | -------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                        
Km                                          | 8.82 µmol/l                | Publication-In Vitro-Mautz 1995

##### Metabolizing Enzyme: CYP2D6-PM, AS=0 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin                   
------------------------------------------- | -------------------------- | -------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                        
Km                                          | 10.08 µmol/l               | Publication-In Vitro-Mautz 1995

##### Metabolizing Enzyme: CYP2D6-AS=3 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 8.82 µmol/l                | Publication-In Vitro-Mautz 1995                            
kcat                                        | 31.22 1/min                | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=3 (α-Hydroxymetoprolol)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 10.08 µmol/l               | Publication-In Vitro-Mautz 1995                            
kcat                                        | 19.03 1/min                | Parameter Identification-Parameter Identification-Optimized

### Compound: S-Metoprolol

#### Parameters

Name                                             | Value                   | Value Origin                                                | Alternative          | Default
------------------------------------------------ | ----------------------- | ----------------------------------------------------------- | -------------------- | -------
Solubility at reference pH                       | 1000 mg/ml              | Publication-Avdeef 2001                                     | metoprolol tartrate  | True   
Reference pH                                     | 7.4                     | Unknown                                                     | metoprolol tartrate  | True   
Solubility at reference pH                       | 157 mg/ml               | Publication-Boldhane 2010                                   | metoprolol succinate | False  
Reference pH                                     | 5.5                     | Publication-Boldhane 2010                                   | metoprolol succinate | False  
Lipophilicity                                    | 1.77 Log Units          | Publication-Other-Zhao 2002                                 | logP                 | True   
Fraction unbound (plasma, reference value)       | 0.88                    | Publication-Benfield 1986                                   | fu                   | True   
Specific intestinal permeability (transcellular) | 4.1375817791E-05 cm/min | Parameter Identification-Parameter Identification-Optimized | Optimized            | True   
Is small molecule                                | Yes                     |                                                             |                      |        
Molecular weight                                 | 267.36 g/mol            | Publication-Kim 2019                                        |                      |        
Plasma protein binding partner                   | Albumin                 |                                                             |                      |        

#### Calculation methods

Name                    | Value              
----------------------- | -------------------
Partition coefficients  | Rodgers and Rowland
Cellular permeabilities | PK-Sim Standard    

#### Processes

##### Systemic Process: Glomerular Filtration-Paper

Species: Human

###### Parameters

Name         | Value | Value Origin
------------ | -----:| ------------
GFR fraction |     1 | Unknown     

##### Metabolizing Enzyme: CYP3A4-Assumption

Species: Human

Molecule: CYP3A4

###### Parameters

Name                | Value              | Value Origin
------------------- | ------------------ | ------------
Intrinsic clearance | 0 l/min            |             
Specific clearance  | 0.0212570166 1/min | Unknown     

##### Metabolizing Enzyme: CYP2D6-NM, Mautz 1995 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                           | Value Origin                   
------------------------------------------- | ------------------------------- | -------------------------------
In vitro Vmax for liver microsomes          | 0.1037 nmol/min/mg mic. protein |                                
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein         | Unknown                        
Km                                          | 12.43 µmol/l                    | Publication-In Vitro-Mautz 1995

##### Metabolizing Enzyme: CYP2D6-NM, Mautz 1995 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                           | Value Origin                   
------------------------------------------- | ------------------------------- | -------------------------------
In vitro Vmax for liver microsomes          | 0.0827 nmol/min/mg mic. protein |                                
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein         | Unknown                        
Km                                          | 10.75 µmol/l                    | Publication-In Vitro-Mautz 1995

##### Metabolizing Enzyme: CYP2D6-AS=0 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin
------------------------------------------- | -------------------------- | ------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |             
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown     
Km                                          | 10.75 µmol/l               |             

##### Metabolizing Enzyme: CYP2D6-AS=0 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                   
------------------------------------------- | -------------------------- | -------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                        
Km                                          | 12.43 µmol/l               | Publication-In Vitro-Mautz 1995

##### Metabolizing Enzyme: CYP2D6-AS=0.5 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 12.43 µmol/l               |                                                            
kcat                                        | 2.2702082024 1/min         | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=1.25 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 12.43 µmol/l               |                                                            
kcat                                        | 7.8945927646 1/min         | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=1.5 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 12.43 µmol/l               |                                                            
kcat                                        | 8.8076966829 1/min         | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=2 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 12.43 µmol/l               | Parameter Identification-Parameter Identification-Optimized
kcat                                        | 14.0227063168 1/min        | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=0.5 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 10.75 µmol/l               |                                                            
kcat                                        | 1.8161665619 1/min         | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=1.25 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 10.75 µmol/l               |                                                            
kcat                                        | 6.3022175194 1/min         | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=1.5 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 10.75 µmol/l               |                                                            
kcat                                        | 7.0307052469 1/min         | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=2 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 10.75 µmol/l               | Parameter Identification-Parameter Identification-Optimized
kcat                                        | 11.19 1/min                | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=3 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin
------------------------------------------- | -------------------------- | ------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |             
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown     
Km                                          | 10.75 µmol/l               |             
kcat                                        | 20.93 1/min                | Unknown     

##### Metabolizing Enzyme: CYP2D6-AS=3 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin
------------------------------------------- | -------------------------- | ------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |             
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown     
Km                                          | 12.43 µmol/l               |             
kcat                                        | 26.23 1/min                | Unknown     

### Compound: Metoprolol racemate

#### Parameters

Name                                             | Value                   | Value Origin                     | Alternative         | Default
------------------------------------------------ | ----------------------- | -------------------------------- | ------------------- | -------
Solubility at reference pH                       | 16900 mg/l              | Publication-In Vitro-Avdeef 2001 | metoprolol tartrate | True   
Reference pH                                     | 7                       |                                  | metoprolol tartrate | True   
Lipophilicity                                    | 1.77 Log Units          | Publication-Other-Zhao 2002      | logP                | True   
Fraction unbound (plasma, reference value)       | 0.88                    | Publication-Benfield 1986        | fu                  | True   
Specific intestinal permeability (transcellular) | 4.1375817791E-05 cm/min |                                  | Optimized           | True   
Is small molecule                                | Yes                     |                                  |                     |        
Molecular weight                                 | 267.36 g/mol            | Database-PubChem                 |                     |        
Plasma protein binding partner                   | Albumin                 |                                  |                     |        

#### Calculation methods

Name                    | Value              
----------------------- | -------------------
Partition coefficients  | Rodgers and Rowland
Cellular permeabilities | PK-Sim Standard    

#### Processes

### Compound: alpha-Hydroxymetoprolol

#### Parameters

Name                                       | Value                  | Value Origin                                                          | Alternative | Default
------------------------------------------ | ---------------------- | --------------------------------------------------------------------- | ----------- | -------
Solubility at reference pH                 | 1430 mg/l              | Database-Other-HMDB 4.0 (ALOGPS predicted water solubility, 1.43 g/l) | Predicted   | True   
Reference pH                               | 7                      | Database-Other-HMDB                                                   | Predicted   | True   
Lipophilicity                              | 0.8658570657 Log Units | Parameter Identification-Parameter Identification-optimized           | logP        | True   
Fraction unbound (plasma, reference value) | 0.6251                 | Publication-Other-Watanabe 2018                                       | Predicted   | True   
Is small molecule                          | Yes                    |                                                                       |             |        
Molecular weight                           | 283.36 g/mol           |                                                                       |             |        
Plasma protein binding partner             | Albumin                |                                                                       |             |        

#### Calculation methods

Name                    | Value              
----------------------- | -------------------
Partition coefficients  | Rodgers and Rowland
Cellular permeabilities | PK-Sim Standard    

#### Processes

##### Systemic Process: Glomerular Filtration-ASSUMPTION

Species: Human

###### Parameters

Name         | Value | Value Origin                                               
------------ | -----:| -----------------------------------------------------------
GFR fraction |     1 | Parameter Identification-Parameter Identification-Optimized

##### Systemic Process: Total Hepatic Clearance-ASSUMPTION

Species: Human

###### Parameters

Name                          | Value          | Value Origin                                               
----------------------------- | -------------- | -----------------------------------------------------------
Fraction unbound (experiment) | 0.12           |                                                            
Lipophilicity (experiment)    | 0.47 Log Units |                                                            
Plasma clearance              | 0 ml/min/kg    |                                                            
Specific clearance            | 0.34 1/min     | Parameter Identification-Parameter Identification-Optimized

## 3.2 Diagnostic plots<a id="32"></a>

The goodness-of-fit diagnostics are presented separately for racemic metoprolol, (R)-metoprolol, (S)-metoprolol, and α-hydroxymetoprolol. This separation prevents analyte-dependent prediction errors from being hidden in a combined statistic or an ambiguous legend.

### 3.2.1 Metoprolol racemate goodness-of-fit diagnostics<a id="321"></a>

The racemic metoprolol GOF plot compares total metoprolol plasma observations with the racemic metoprolol model output.

<a id="table-3-1"></a>

**Table 3-1: GMFE for Metoprolol racemate goodness-of-fit diagnostics**

|Group               |GMFE |
|:-------------------|:----|
|Metoprolol racemate |1.32 |

<br>
<br>

<a id="figure-3-1"></a>

![](images/006_section_3/008_section_32/009_section_321/2_gof_plot_predictedVsObserved.png)

**Figure 3-1: Metoprolol racemate goodness-of-fit diagnostics**

<br>
<br>

<a id="figure-3-2"></a>

![](images/006_section_3/008_section_32/009_section_321/3_gof_plot_residualsOverTime.png)

**Figure 3-2: Metoprolol racemate goodness-of-fit diagnostics**

<br>
<br>

### 3.2.2 (R)-Metoprolol goodness-of-fit diagnostics<a id="322"></a>

The (R)-metoprolol GOF plot evaluates the enantiomer-specific parent concentration predictions across studies reporting (R)-metoprolol observations.

<a id="table-3-2"></a>

**Table 3-2: GMFE for (R)-Metoprolol goodness-of-fit diagnostics**

|Group        |GMFE |
|:------------|:----|
|R-Metoprolol |1.28 |

<br>
<br>

<a id="figure-3-3"></a>

![](images/006_section_3/008_section_32/010_section_322/5_gof_plot_predictedVsObserved.png)

**Figure 3-3: (R)-Metoprolol goodness-of-fit diagnostics**

<br>
<br>

<a id="figure-3-4"></a>

![](images/006_section_3/008_section_32/010_section_322/6_gof_plot_residualsOverTime.png)

**Figure 3-4: (R)-Metoprolol goodness-of-fit diagnostics**

<br>
<br>

### 3.2.3 (S)-Metoprolol goodness-of-fit diagnostics<a id="323"></a>

The (S)-metoprolol GOF plot evaluates the enantiomer-specific parent concentration predictions across studies reporting (S)-metoprolol observations.

<a id="table-3-3"></a>

**Table 3-3: GMFE for (S)-Metoprolol goodness-of-fit diagnostics**

|Group        |GMFE |
|:------------|:----|
|S-Metoprolol |1.30 |

<br>
<br>

<a id="figure-3-5"></a>

![](images/006_section_3/008_section_32/011_section_323/8_gof_plot_predictedVsObserved.png)

**Figure 3-5: (S)-Metoprolol goodness-of-fit diagnostics**

<br>
<br>

<a id="figure-3-6"></a>

![](images/006_section_3/008_section_32/011_section_323/9_gof_plot_residualsOverTime.png)

**Figure 3-6: (S)-Metoprolol goodness-of-fit diagnostics**

<br>
<br>

### 3.2.4 α-Hydroxymetoprolol goodness-of-fit diagnostics<a id="324"></a>

The α-hydroxymetoprolol GOF plot evaluates the metabolite concentration predictions for studies reporting metabolite plasma concentrations.

<a id="table-3-4"></a>

**Table 3-4: GMFE for α-Hydroxymetoprolol goodness-of-fit diagnostics**

|Group                   |GMFE |
|:-----------------------|:----|
|alpha-Hydroxymetoprolol |1.83 |

<br>
<br>

<a id="figure-3-7"></a>

![](images/006_section_3/008_section_32/012_section_324/11_gof_plot_predictedVsObserved.png)

**Figure 3-7: α-Hydroxymetoprolol goodness-of-fit diagnostics**

<br>
<br>

<a id="figure-3-8"></a>

![](images/006_section_3/008_section_32/012_section_324/12_gof_plot_residualsOverTime.png)

**Figure 3-8: α-Hydroxymetoprolol goodness-of-fit diagnostics**

<br>
<br>

## 3.3 Concentration-time profiles<a id="33"></a>

The concentration-time profiles show simulated and observed plasma concentrations for the model-building and model-verification datasets. Profiles include intravenous infusion, oral normal-release metoprolol tartrate and oral controlled-release metoprolol succinate studies.

### 3.3.1 Model Building<a id="331"></a>

Model-building profiles include studies used to inform systemic disposition, absorption, formulation behavior and CYP2D6 activity-score-dependent metabolism.

<a id="figure-3-9"></a>

![](images/006_section_3/013_section_33/014_section_331/3_time_profile_plot_Metoprolol_Damy_2004__200_mg_succinate_CR__n_13__NM.png)

**Figure 3-9: Damy 2004: 200 mg succinate CR, n=13, NM**

<br>
<br>

<a id="figure-3-10"></a>

![](images/006_section_3/013_section_33/014_section_331/7_time_profile_plot_Metoprolol_Huang_1999_IM__100_mg_tartrate_IR__n_12__AS_0_5.png)

**Figure 3-10: Huang 1999: IM, 100 mg tartrate IR, n=12, AS=0.5**

<br>
<br>

<a id="figure-3-11"></a>

![](images/006_section_3/013_section_33/014_section_331/8_time_profile_plot_Metoprolol_Huang_1999_NM__100_mg_tartrate_IR__n_12__AS_1_25.png)

**Figure 3-11: Huang 1999: NM, 100 mg tartrate IR, n=12, AS=1.25**

<br>
<br>

<a id="figure-3-12"></a>

![](images/006_section_3/013_section_33/014_section_331/9_time_profile_plot_Metoprolol_Huang_1999_NM__100_mg_tartrate_IR__n_16__AS_2.png)

**Figure 3-12: Huang 1999: NM, 100 mg tartrate IR, n=16, AS=2**

<br>
<br>

<a id="figure-3-13"></a>

![](images/006_section_3/013_section_33/014_section_331/10_time_profile_plot_Metoprolol_Jin_2008_IM__100_mg_tartrate_IR__n_5__AS_0_5.png)

**Figure 3-13: Jin 2008: IM, 100 mg tartrate IR, n=5, AS=0.5**

<br>
<br>

<a id="figure-3-14"></a>

![](images/006_section_3/013_section_33/014_section_331/11_time_profile_plot_Metoprolol_Jin_2008_NM__100_mg_tartrate_IR__n_7__AS_1_25.png)

**Figure 3-14: Jin 2008: NM, 100 mg tartrate IR, n=7, AS=1.25**

<br>
<br>

<a id="figure-3-15"></a>

![](images/006_section_3/013_section_33/014_section_331/12_time_profile_plot_Metoprolol_Jin_2008_NM__100_mg_tartrate_IR__n_6__AS_2.png)

**Figure 3-15: Jin 2008: NM, 100 mg tartrate IR, n=6, AS=2**

<br>
<br>

<a id="figure-3-16"></a>

![](images/006_section_3/013_section_33/014_section_331/13_time_profile_plot_Metoprolol_Johnson_1996_NM__200_mg_tartrate_IR__n_10_Black_American.png)

**Figure 3-16: Johnson 1996: NM, 200 mg tartrate IR, n=10 Black American**

<br>
<br>

<a id="figure-3-17"></a>

![](images/006_section_3/013_section_33/014_section_331/14_time_profile_plot_Metoprolol_Johnson_1996_NM__200_mg_tartrate_IR__n_10_White_American.png)

**Figure 3-17: Johnson 1996: NM, 200 mg tartrate IR, n=10 White American**

<br>
<br>

<a id="figure-3-18"></a>

![](images/006_section_3/013_section_33/014_section_331/22_time_profile_plot_Metoprolol_Kelly_1985__50_mg_tartrate_iv_10_min__n_12.png)

**Figure 3-18: Kelly 1985: 50 mg tartrate iv 10 min, n=12**

<br>
<br>

<a id="figure-3-19"></a>

![](images/006_section_3/013_section_33/014_section_331/23_time_profile_plot_Metoprolol_Kelly_1985__100_mg_tartrate_IR__n_12_md.png)

**Figure 3-19: Kelly 1985: 100 mg b.i.d. tartrate IR, n=12, multiple dose**

<br>
<br>

<a id="figure-3-20"></a>

![](images/006_section_3/013_section_33/014_section_331/24_time_profile_plot_Metoprolol_Kirchheiner_Seeringer_2008_NM__100_mg_tartrate_IR__n_13__AS_2.png)

**Figure 3-20: Kirchheiner 2004 / Seeringer 2008: NM, 100 mg tartrate IR, n=13, AS=2**

<br>
<br>

<a id="figure-3-21"></a>

![](images/006_section_3/013_section_33/014_section_331/25_time_profile_plot_Metoprolol_Kirchheiner_Seeringer_2008_PM__100_mg_tartrate_IR__n_4__AS_0.png)

**Figure 3-21: Kirchheiner 2004 / Seeringer 2008: PM, 100 mg tartrate IR, n=4, AS=0**

<br>
<br>

<a id="figure-3-22"></a>

![](images/006_section_3/013_section_33/014_section_331/26_time_profile_plot_Metoprolol_Kirchheiner_Seeringer_2008_UM__100_mg_tartrate_IR__n_12__AS_3.png)

**Figure 3-22: Kirchheiner 2004 / Seeringer 2008: UM, 100 mg tartrate IR, n=12, AS=3**

<br>
<br>

<a id="figure-3-23"></a>

![](images/006_section_3/013_section_33/014_section_331/33_time_profile_plot_Metoprolol_Regardh_1974__5_mg_tartrate_iv_10_min__n_5.png)

**Figure 3-23: Regårdh 1974: 5 mg tartrate iv 10 min, n=5**

<br>
<br>

<a id="figure-3-24"></a>

![](images/006_section_3/013_section_33/014_section_331/34_time_profile_plot_Metoprolol_Regardh_1974__5_mg_tartrate_solution__n_5.png)

**Figure 3-24: Regårdh 1974: 5 mg tartrate solution, n=5**

<br>
<br>

<a id="figure-3-25"></a>

![](images/006_section_3/013_section_33/014_section_331/36_time_profile_plot_Metoprolol_Sharma_2005_NM__100_mg_tartrate__n_16__AS_1_5.png)

**Figure 3-25: Sharma 2005: NM, 100 mg tartrate, n=16, AS=1.5**

<br>
<br>

<a id="figure-3-26"></a>

![](images/006_section_3/013_section_33/014_section_331/37_time_profile_plot_Metoprolol_Sharma_2005_PM__100_mg_tartrate__n_4__AS_0.png)

**Figure 3-26: Sharma 2005: PM, 100 mg tartrate, n=4, AS=0**

<br>
<br>

### 3.3.2 Model Verification<a id="332"></a>

Model-verification profiles include additional adult clinical studies used to assess model behavior across sex, formulation and CYP2D6 status conditions not used as the primary fitting dataset.

<a id="figure-3-27"></a>

![](images/006_section_3/013_section_33/015_section_332/1_time_profile_plot_Metoprolol_Bae_2014_IM__100_mg_tartrate_IR__n_3__AS_0_5.png)

**Figure 3-27: Bae 2014: IM, 100 mg tartrate IR, n=3, AS=0.5**

<br>
<br>

<a id="figure-3-28"></a>

![](images/006_section_3/013_section_33/015_section_332/2_time_profile_plot_Metoprolol_Bae_2014_NM__100_mg_tartrate_IR__n_4__AS_2.png)

**Figure 3-28: Bae 2014: NM, 100 mg tartrate IR, n=4, AS=2**

<br>
<br>

<a id="figure-3-29"></a>

![](images/006_section_3/013_section_33/015_section_332/4_time_profile_plot_Metoprolol_Godbillon_1985__88_7_mg_tartrate_iv_150_min__n_6.png)

**Figure 3-29: Godbillon 1985: 88.7 mg tartrate iv 150 min, n=6**

<br>
<br>

<a id="figure-3-30"></a>

![](images/006_section_3/013_section_33/015_section_332/5_time_profile_plot_Metoprolol_Hamelin_2000_NM__100_mg_tartrate_IR__n_10.png)

**Figure 3-30: Hamelin 2000: NM, 100 mg tartrate IR, n=10**

<br>
<br>

<a id="figure-3-31"></a>

![](images/006_section_3/013_section_33/015_section_332/6_time_profile_plot_Metoprolol_Hamelin_2000_PM__100_mg_tartrate_IR__n_6.png)

**Figure 3-31: Hamelin 2000: PM, 100 mg tartrate IR, n=6**

<br>
<br>

<a id="figure-3-32"></a>

![](images/006_section_3/013_section_33/015_section_332/15_time_profile_plot_Metoprolol_Johnsson_1975__5_mg_tartrate_iv_10_min__n_5.png)

**Figure 3-32: Johnsson 1975: 5 mg tartrate iv 10 min, n=5**

<br>
<br>

<a id="figure-3-33"></a>

![](images/006_section_3/013_section_33/015_section_332/16_time_profile_plot_Metoprolol_Johnsson_1975__10_mg_tartrate_iv_10_min__n_5.png)

**Figure 3-33: Johnsson 1975: 10 mg tartrate iv 10 min, n=5**

<br>
<br>

<a id="figure-3-34"></a>

![](images/006_section_3/013_section_33/015_section_332/17_time_profile_plot_Metoprolol_Johnsson_1975__15_mg_tartrate_iv_10_min__n_5.png)

**Figure 3-34: Johnsson 1975: 15 mg tartrate iv 10 min, n=5**

<br>
<br>

<a id="figure-3-35"></a>

![](images/006_section_3/013_section_33/015_section_332/18_time_profile_plot_Metoprolol_Johnsson_1975__20_mg_tartrate_IR__n_5.png)

**Figure 3-35: Johnsson 1975: 20 mg tartrate IR, n=5**

<br>
<br>

<a id="figure-3-36"></a>

![](images/006_section_3/013_section_33/015_section_332/19_time_profile_plot_Metoprolol_Johnsson_1975__20_mg_tartrate_iv_10_min__n_5.png)

**Figure 3-36: Johnsson 1975: 20 mg tartrate iv 10 min, n=5**

<br>
<br>

<a id="figure-3-37"></a>

![](images/006_section_3/013_section_33/015_section_332/20_time_profile_plot_Metoprolol_Johnsson_1975__50_mg_tartrate_IR__n_5.png)

**Figure 3-37: Johnsson 1975: 50 mg tartrate IR, n=5**

<br>
<br>

<a id="figure-3-38"></a>

![](images/006_section_3/013_section_33/015_section_332/21_time_profile_plot_Metoprolol_Johnsson_1975__100_mg_tartrate_IR__n_5.png)

**Figure 3-38: Johnsson 1975: 100 mg tartrate IR, n=5**

<br>
<br>

<a id="figure-3-39"></a>

![](images/006_section_3/013_section_33/015_section_332/27_time_profile_plot_Metoprolol_Krosser_2006_NM__100_mg_tartrate_IR__n_18.png)

**Figure 3-39: Krösser 2006: NM, 100 mg tartrate IR, n=18**

<br>
<br>

<a id="figure-3-40"></a>

![](images/006_section_3/013_section_33/015_section_332/28_time_profile_plot_Metoprolol_Luzier_1999_NM__100_mg_tartrate_IR__n_10_female_md.png)

**Figure 3-40: Luzier 1999: NM, 100 mg b.i.d. tartrate IR, n=10 female, multiple dose**

<br>
<br>

<a id="figure-3-41"></a>

![](images/006_section_3/013_section_33/015_section_332/29_time_profile_plot_Metoprolol_Luzier_1999_NM__100_mg_tartrate_IR__n_10_male_md.png)

**Figure 3-41: Luzier 1999: NM, 100 mg b.i.d. tartrate IR, n=10 male, multiple dose**

<br>
<br>

<a id="figure-3-42"></a>

![](images/006_section_3/013_section_33/015_section_332/30_time_profile_plot_Metoprolol_Parker_2011_NM__100_mg_succinate_CR__n_15.png)

**Figure 3-42: Parker 2011: NM, 100 mg succinate CR, n=15**

<br>
<br>

<a id="figure-3-43"></a>

![](images/006_section_3/013_section_33/015_section_332/31_time_profile_plot_Metoprolol_Parker_2011_NM__100_mg_tartrate_IR__n_15.png)

**Figure 3-43: Parker 2011: NM, 100 mg tartrate IR, n=15**

<br>
<br>

<a id="figure-3-44"></a>

![](images/006_section_3/013_section_33/015_section_332/32_time_profile_plot_Metoprolol_Parker_2011_NM__200_mg_succinate_CR__n_15.png)

**Figure 3-44: Parker 2011: NM, 200 mg succinate CR, n=15**

<br>
<br>

<a id="figure-3-45"></a>

![](images/006_section_3/013_section_33/015_section_332/35_time_profile_plot_Metoprolol_Regardh_1980__10_mg_tartrate_iv_5_min__n_6.png)

**Figure 3-45: Regårdh 1980: 10 mg tartrate iv 5 min, n=6**

<br>
<br>

<a id="figure-3-46"></a>

![](images/006_section_3/013_section_33/015_section_332/38_time_profile_plot_Metoprolol_Stout_2011_EM__50_mg_tartrate_IR__n_10.png)

**Figure 3-46: Stout 2011: NM, 50 mg tartrate IR, n=10**

<br>
<br>

<a id="figure-3-47"></a>

![](images/006_section_3/013_section_33/015_section_332/39_time_profile_plot_Metoprolol_Stout_2011_EM__100_mg_succinate_CR__n_10.png)

**Figure 3-47: Stout 2011: NM, 100 mg succinate CR, n=10**

<br>
<br>

<a id="figure-3-48"></a>

![](images/006_section_3/013_section_33/015_section_332/40_time_profile_plot_Metoprolol_Werner_2003_NM__50_mg_tartrate_IR__n_12__AS_1_5.png)

**Figure 3-48: Werner 2003: NM, 50 mg tartrate IR, n=12, AS=1.5**

<br>
<br>

# 4 Conclusion<a id="4"></a>

The metoprolol PBPK model was evaluated against adult plasma concentration-time data for racemic metoprolol, both enantiomers and α-hydroxymetoprolol after intravenous and oral administration. The evaluated studies include immediate-release and controlled-release formulations and CYP2D6 phenotype or activity-score groups.

The report characterizes model performance only for these evaluated conditions. Material limitations include unresolved genotype differences within activity scores, fixed CYP2D6 Michaelis constants across scores and uncertainty in non-CYP2D6 metabolism.

# 5 References<a id="5"></a>

[1] Rüdesheim S, Wojtyniak JG, Selzer D, Hanke N, Mahfoud F, Schwab M, Lehr T. Physiologically Based Pharmacokinetic Modeling of Metoprolol Enantiomers and α-Hydroxymetoprolol to Describe CYP2D6 Drug-Gene Interactions. Pharmaceutics. 2020;12:1200. doi: [10.3390/pharmaceutics12121200](https://doi.org/10.3390/pharmaceutics12121200).

[2] Rüdesheim S, Loer HLH, Feick D, Marok FZ, Fuhr LM, Selzer D, et al. A Comprehensive CYP2D6 Drug-Drug-Gene Interaction Network for Application in Precision Dosing and Drug Development. Clinical Pharmacology & Therapeutics. 2025;117:1718-1731. doi: [10.1002/cpt.3604](https://doi.org/10.1002/cpt.3604).

[3] Bae SH, Lee JK, Cho DY, Bae SK. Simultaneous determination of metoprolol and its metabolites, α-hydroxymetoprolol and O-desmethylmetoprolol, in human plasma by liquid chromatography with tandem mass spectrometry: Application to the pharmacokinetics of metoprolol associated with CYP2D6 genotype. Journal of Separation Science. 2014;37:1256-1264. doi: [10.1002/jssc.201301353](https://doi.org/10.1002/jssc.201301353).

[4] Damy T, Pousset F, Caplain H, Hulot JS, Lechat P. Pharmacokinetic and pharmacodynamic interactions between metoprolol and dronedarone in extensive and poor CYP2D6 metabolizers healthy subjects. Fundamental and Clinical Pharmacology. 2004;18:113-123. doi: [10.1046/j.1472-8206.2003.00216.x](https://doi.org/10.1046/j.1472-8206.2003.00216.x).

[5] Godbillon J, et al. Investigation of drug absorption from the gastrointestinal tract of man. III. Metoprolol in the colon. British Journal of Clinical Pharmacology. 1985;19 Suppl 2:113S-118S. doi: [10.1111/j.1365-2125.1985.tb02751.x](https://doi.org/10.1111/j.1365-2125.1985.tb02751.x).

[6] Hamelin BA, et al. Significant interaction between the nonprescription antihistamine diphenhydramine and the CYP2D6 substrate metoprolol in healthy men with high or low CYP2D6 activity. Clinical Pharmacology and Therapeutics. 2000;67:466-477. doi: [10.1067/mcp.2000.106464](https://doi.org/10.1067/mcp.2000.106464).

[7] Huang J, Chuang SK, Cheng CL, Lai ML. Pharmacokinetics of metoprolol enantiomers in Chinese subjects of major CYP2D6 genotypes. Clinical Pharmacology and Therapeutics. 1999;65:402-407. doi: [10.1016/S0009-9236(99)70134-7](https://doi.org/10.1016/S0009-9236(99)70134-7).

[8] Jin SK, et al. Influence of CYP2D6*10 on the pharmacokinetics of metoprolol in healthy Korean volunteers. Journal of Clinical Pharmacy and Therapeutics. 2008;33:567-573. doi: [10.1111/j.1365-2710.2008.00945.x](https://doi.org/10.1111/j.1365-2710.2008.00945.x).

[9] Johnson JA, Burlew BS. Metoprolol metabolism via cytochrome P4502D6 in ethnic populations. Drug Metabolism and Disposition. 1996;24:350-355. doi: [10.1016/S0090-9556(25)07354-4](https://doi.org/10.1016/S0090-9556(25)07354-4).

[10] Johnsson G, Regårdh CG, Sölvell L. Combined pharmacokinetic and pharmacodynamic studies in man of the adrenergic β1-receptor antagonist metoprolol. Acta Pharmacologica et Toxicologica. 1975;36:31-44. doi: [10.1111/j.1600-0773.1975.tb03320.x](https://doi.org/10.1111/j.1600-0773.1975.tb03320.x).

[11] Kelly JG, Salem SA, Kinney CD, Shanks RG, McDevitt DG. Effects of ranitidine on the disposition of metoprolol. British Journal of Clinical Pharmacology. 1985;19:219-224. doi: [10.1111/j.1365-2125.1985.tb02634.x](https://doi.org/10.1111/j.1365-2125.1985.tb02634.x).

[12] Kirchheiner J, et al. Impact of the ultrarapid metabolizer genotype of cytochrome P450 2D6 on metoprolol pharmacokinetics and pharmacodynamics. Clinical Pharmacology and Therapeutics. 2004;76:302-312. doi: [10.1016/j.clpt.2004.07.002](https://doi.org/10.1016/j.clpt.2004.07.002).

[13] Krösser S, et al. Investigation of sarizotan's impact on the pharmacokinetics of probe drugs for major cytochrome P450 isoenzymes: a combined cocktail trial. European Journal of Clinical Pharmacology. 2006;62:277-284. doi: [10.1007/s00228-006-0101-7](https://doi.org/10.1007/s00228-006-0101-7).

[14] Luzier AB, et al. Gender-related effects on metoprolol pharmacokinetics and pharmacodynamics in healthy volunteers. Clinical Pharmacology and Therapeutics. 1999;66:594-601. doi: [10.1053/cp.1999.v66.103400001](https://doi.org/10.1053/cp.1999.v66.103400001).

[15] Mautz DS, Nelson WL, Shen DD. Regioselective and stereoselective oxidation of metoprolol and bufuralol catalyzed by microsomes containing cDNA-expressed human P4502D6. Drug Metabolism and Disposition. 1995;23:513-517. doi: [10.1016/S0090-9556(25)06590-0](https://doi.org/10.1016/S0090-9556(25)06590-0).

[16] Parker RB, Soberman JE. Effects of paroxetine on the pharmacokinetics and pharmacodynamics of immediate-release and extended-release metoprolol. Pharmacotherapy. 2011;31:630-641. doi: [10.1592/phco.31.7.630](https://doi.org/10.1592/phco.31.7.630).

[17] Regårdh CG, Borg KO, Johansson R, Johnsson G, Palmer L. Pharmacokinetic studies on the selective beta1-receptor antagonist metoprolol in man. Journal of Pharmacokinetics and Biopharmaceutics. 1974;2:347-364. doi: [10.1007/BF01061407](https://doi.org/10.1007/BF01061407).

[18] Regårdh CG, Johnsson G. Clinical Pharmacokinetics of Metoprolol. Clinical Pharmacokinetics. 1980;5:557-569. doi: [10.2165/00003088-198005060-00004](https://doi.org/10.2165/00003088-198005060-00004).

[19] Seeringer A, Brockmöller J, Bauer S, Kirchheiner J. Enantiospecific pharmacokinetics of metoprolol in CYP2D6 ultra-rapid metabolizers and correlation with exercise-induced heart rate. European Journal of Clinical Pharmacology. 2008;64:883-888. doi: [10.1007/s00228-008-0504-8](https://doi.org/10.1007/s00228-008-0504-8).

[20] Sharma A, et al. Modulation of Metoprolol Pharmacokinetics and Hemodynamics by Diphenhydramine Coadministration during Exercise Testing in Healthy Premenopausal Women. Journal of Pharmacology and Experimental Therapeutics. 2005;313:1172-1181. doi: [10.1124/jpet.104.081109](https://doi.org/10.1124/jpet.104.081109).

[21] Stout SM, et al. Influence of metoprolol dosage release formulation on the pharmacokinetic drug interaction with paroxetine. Journal of Clinical Pharmacology. 2011;51:389-396. doi: [10.1177/0091270010365559](https://doi.org/10.1177/0091270010365559).

[22] Werner U, et al. Celecoxib inhibits metabolism of cytochrome P450 2D6 substrate metoprolol in humans. Clinical Pharmacology and Therapeutics. 2003;74:130-137. doi: [10.1016/S0009-9236(03)00120-6](https://doi.org/10.1016/S0009-9236(03)00120-6).

[23] Wishart DS, et al. HMDB 4.0: the human metabolome database for 2018. Nucleic Acids Research. 2018;46:D608-D617. doi: [10.1093/nar/gkx1089](https://doi.org/10.1093/nar/gkx1089).

[24] Moore C, Bourque MS, Halman A, Agúndez JAG, Prows CA, Hikino K, et al. Clinical Pharmacogenetics Implementation Consortium (CPIC) Guideline for CYP2D6 Genotype and Use of 5-HT<sub>3</sub> Receptor Antagonists: 2026 Update. Clinical Pharmacology & Therapeutics. 2026;120:387-393. doi: [10.1002/cpt.70291](https://doi.org/10.1002/cpt.70291).

