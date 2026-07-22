# Building and evaluation of a PBPK model for Metoprolol in adults

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
   * [3.3 Concentration-time profiles](#33)
     * [3.3.1 Model Building](#331)
     * [3.3.2 Model Verification](#332)
 * [4 Conclusion](#4)
 * [5 References](#5)

# 1 Introduction<a id="1"></a>

Metoprolol is a selective beta1-adrenoceptor blocker used in cardiovascular indications including hypertension, angina pectoris, arrhythmias and heart failure. Metoprolol pharmacokinetics show substantial interindividual variability because CYP2D6 is the dominant enzyme involved in oxidative metabolism and CYP2D6 activity varies across genetic activity-score groups [[1](#5-references)].

The model describes metoprolol as a whole-body parent-metabolite PBPK model with separate (R)-metoprolol and (S)-metoprolol enantiomers, racemic metoprolol as an observed composite endpoint and α-hydroxymetoprolol as a metabolite. This structure supports evaluation of racemic and enantiomer-specific plasma concentration-time data after intravenous infusion, oral immediate-release metoprolol tartrate and oral controlled-release metoprolol succinate administration.

The clinical evaluation covers adult plasma pharmacokinetic data across a dose range of 5 to 200 mg and includes studies with CYP2D6 activity-score or phenotype information. The model was developed to describe metoprolol disposition, α-hydroxymetoprolol formation and CYP2D6 drug-gene effects, and was subsequently used as a CYP2D6 substrate model in the broader CYP2D6 drug-drug-gene interaction network [[1](#5-references), [2](#5-references)].

# 2 Methods<a id="2"></a>

## 2.1 Modeling strategy<a id="21"></a>

The PBPK model was developed using the Open Systems Pharmacology Suite. Distribution and elimination processes were implemented in a whole-body model structure using standard physiological organ compartments and compound-specific physicochemical and biochemical input parameters.

Model development followed an iterative workflow in which in vitro and physicochemical information was combined with clinical plasma concentration-time data. Parameters with direct literature support were used as fixed inputs where possible, while selected parameters controlling oral absorption, CYP2D6 activity-score-dependent metabolism and residual clearance were optimized against clinical data.

The model represents (R)-metoprolol and (S)-metoprolol as separate compounds because CYP2D6-mediated metabolism is enantiomer-specific. Racemic metoprolol is represented as an observer output for comparison with clinical studies reporting total metoprolol. α-Hydroxymetoprolol is included as a measured metabolite formed through the α-hydroxylation pathway.

The base metoprolol model was informed by intravenous and oral metoprolol studies covering normal-release tartrate and controlled-release succinate formulations. Intravenous infusion studies supported systemic disposition and clearance assumptions, while oral studies informed formulation and first-pass behavior. The CYP2D6 activity-score model used clinical studies with reported CYP2D6 phenotypes, genotypes or derived activity scores to identify activity-score-dependent k<sub>cat</sub> values for both enantiomers [[1](#5-references)].

The major proteins represented in the model are CYP2D6 and CYP3A4. CYP2D6 accounts for α-hydroxylation and O-demethylation pathways and is activity-score-dependent. CYP3A4 is represented as a first-order clearance component to account for CYP2D6-independent oxidative metabolism. Renal filtration and unspecific hepatic clearance are retained where required for the parent and metabolite disposition.

## 2.2 Data used<a id="22"></a>

### 2.2.1 In vitro and physicochemical data

Drug-dependent input parameters for the metoprolol enantiomers were taken from the published metoprolol PBPK model and the cited primary sources therein [[1](#5-references)]. The key physicochemical properties include molecular weight, pK<sub>a</sub>, lipophilicity, solubility of metoprolol tartrate and succinate, fraction unbound in plasma and intestinal permeability. The model uses the same physicochemical properties for the two enantiomers where no enantiomer-specific difference is supported by the source data.

CYP2D6 K<sub>m</sub> values for α-hydroxylation and O-demethylation are based on in vitro data by Mautz et al. [[15](#5-references)] as summarized in the metoprolol model publication [[1](#5-references)]. activity-score-dependent k<sub>cat</sub> values were optimized in fixed pathway ratios and are documented in the model publication [[1](#5-references), Table 3].

| Parameter group | Model use | Main source |
| --- | --- | --- |
| Molecular weight, pK<sub>a</sub>, lipophilicity, solubility and f<sub>u</sub> | Parent-enantiomer physicochemical and distribution inputs | [Rüdesheim et al. 2020](#5-references), Table 2 and cited primary sources |
| CYP2D6 K<sub>m</sub> values | Enantiomer-specific α-hydroxylation and O-demethylation | [Rüdesheim et al. 2020](#5-references), Table 2 |
| CYP2D6 activity-score-dependent k<sub>cat</sub> values | DGI model scaling across CYP2D6 activity scores | [Rüdesheim et al. 2020](#5-references), Table 3 |
| Formulation parameters | Normal-release tartrate and controlled-release succinate absorption | [Rüdesheim et al. 2020](#5-references), Table 2 |

### 2.2.2 Clinical data

Clinical plasma concentration-time data were used for model building and verification after intravenous infusion and oral metoprolol administration. The clinical dataset includes racemic metoprolol, enantiomer-specific metoprolol and α-hydroxymetoprolol observations, with CYP2D6 activity-score information used where available.

| Publication | Clinical data used |
| --- | --- |
| [Kirchheiner et al. 2004 / Seeringer et al. 2008](#5-references) | Oral normal-release metoprolol tartrate data in adult CYP2D6 poor, normal and ultrarapid metabolizer groups were used to inform activity-score-dependent enantiomer metabolism. |
| [Sharma et al. 2005](#5-references) | Oral metoprolol tartrate data in adult CYP2D6 poor and normal metabolizer groups supported racemic and enantiomer-specific DGI evaluation. |
| [Regårdh et al. 1974](#5-references), [Regårdh et al. 1980](#5-references), [Johnsson et al. 1975](#5-references), [Kelly et al. 1985](#5-references) and [Godbillon et al. 1985](#5-references) | Intravenous infusion and oral metoprolol studies in adults supported systemic disposition, oral absorption and metabolite formation across the model-building dataset. |
| [Werner et al. 2003](#5-references), [Krösser et al. 2006](#5-references) and [Jin et al. 2008](#5-references) | Oral metoprolol tartrate studies with metoprolol and α-hydroxymetoprolol measurements supported parent-metabolite evaluation and activity-score-dependent predictions. |
| [Huang et al. 1999](#5-references), [Hamelin et al. 2000](#5-references), [Johnson et al. 1996](#5-references), [Luzier et al. 1999](#5-references), [Stout et al. 2011](#5-references), [Parker et al. 2011](#5-references), [Damy et al. 2004](#5-references) and [Bae et al. 2014](#5-references) | Oral metoprolol tartrate or succinate data in adults provided additional verification across CYP2D6 status groups, sex groups and formulation conditions. |

## 2.3 Model parameters and assumptions<a id="23"></a>

### 2.3.1 Absorption

The model includes oral administration of metoprolol tartrate as a normal-release formulation, metoprolol succinate as a controlled-release formulation and dissolved oral dosing. Formulation behavior is represented through Weibull dissolution parameters for normal-release and controlled-release products, with the same compound intestinal permeability applied to both metoprolol enantiomers.

Oral absorption was evaluated together with first-pass metabolism because most clinical studies report plasma concentration-time data after oral dosing. Intravenous infusion studies were retained to separate systemic disposition from oral formulation behavior where possible.

The specific intestinal permeability was optimized and applied consistently for (R)- and (S)-metoprolol. Differences between CYP2D6 activity-score groups are assigned to metabolism rather than to absorption.

### 2.3.2 Distribution

(R)- and (S)-metoprolol use a fraction unbound of 88% and a logP of 1.77 as summarized in [Section 2.2](Section2.2_Data.md). The same distribution assumptions are used for both enantiomers because the source information does not support separate enantiomer-specific binding or lipophilicity values.

Partition coefficients were calculated with the Rodgers and Rowland method. The racemic metoprolol observer is used only for comparison with total metoprolol observations and does not replace the enantiomer-specific disposition model.

α-Hydroxymetoprolol is represented with its own molecular weight, lipophilicity, plasma binding and clearance parameters. This separation is required because metabolite exposure is controlled by both formation from the parent enantiomers and metabolite-specific elimination.

The α-hydroxymetoprolol solubility input is the HMDB ALOGPS prediction of 1.43 g/L, implemented as 1,430 mg/L [[24](#5-references)]. Table S2.4.3 of the published model labels this value as g/mL, but the cited HMDB source establishes g/L.

### 2.3.3 Metabolism and elimination

Metoprolol clearance is represented by CYP2D6-dependent α-hydroxylation, CYP2D6-dependent O-demethylation, CYP3A4 first-order clearance, renal filtration and residual clearance components.

* CYP2D6

CYP2D6 is the dominant metabolic enzyme in the model. Separate CYP2D6 pathways are implemented for (R)- and (S)-metoprolol α-hydroxylation and O-demethylation. K<sub>m</sub> values are enantiomer- and pathway-specific, while k<sub>cat</sub> values are scaled by CYP2D6 activity score [[1](#5-references), Table 3].

The CYP2D6 activity-score implementation is the key determinant of simulated exposure differences between poor, intermediate, normal and ultrarapid metabolizer groups. Poor-metabolizer activity is set to zero, while non-zero activity-score groups use optimized k<sub>cat</sub> values.

* CYP3A4 and residual clearance

CYP3A4 is implemented as a first-order clearance pathway for each metoprolol enantiomer. This pathway accounts for CYP2D6-independent oxidative clearance and supports simulations in CYP2D6 poor-metabolizer groups without assigning all remaining clearance to renal elimination.

Residual clearance terms are empirical. They should be interpreted as structural model components required to describe total disposition rather than as direct measurements of a single biochemical pathway.

* Renal and metabolite elimination

Renal filtration is included with a GFR fraction of 1 for metoprolol and α-hydroxymetoprolol. α-Hydroxymetoprolol also includes unspecific hepatic clearance to describe metabolite elimination beyond passive filtration.

# 3 Results and Discussion<a id="3"></a>

The evaluation combines goodness-of-fit diagnostics and concentration-time profiles for racemic metoprolol, (R)-metoprolol, (S)-metoprolol and α-hydroxymetoprolol. The diagnostic plots are separated by analyte so that parent enantiomers, racemic parent observations and metabolite observations can be assessed without ambiguous legends.

Overall model performance should be interpreted across the full clinical dataset rather than from a single study arm. Intravenous infusion studies primarily assess systemic disposition, oral tartrate and succinate studies assess formulation and first-pass behavior, and CYP2D6-stratified studies assess the activity-score-dependent metabolic implementation.

The metoprolol model publication reported low geometric mean fold errors for AUC<sub>last</sub> and C<sub>max</sub> across all analyzed studies and demonstrated that CYP2D6 DGI ratios were generally captured within accepted prediction limits [[1](#5-references)]. The present report reproduces the concentration-time and GOF assessment structure for the model repository and keeps racemic, enantiomer-specific and metabolite endpoints separated in the diagnostic sections.

Residual uncertainty remains for genotype-level resolution within the same CYP2D6 activity-score group and for the exact quantitative contribution of non-CYP2D6 metabolism. The model therefore supports CYP2D6 activity-score based exposure evaluation, while further genotype-specific refinement would require additional in vitro and clinical data.

## 3.1 Metoprolol final input parameters<a id="31"></a>

The following tables summarize the final drug-dependent model input parameters generated from the model. Parameter values should be interpreted together with the source and method information in [Section 2.2](Section2.2_Data.md) and [Section 2.3](Section2.3_Model_Parameters_and_Assumptions.md).

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
------------------------------------------- | -------------------------- | ---------------------------------------------------------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                                                                      
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                                                                              
Km                                          | 12.43 µmol/l               |                                                                                                                      
kcat                                        | 2.2702082024 1/min         | Parameter Identification-Parameter Identification-Value updated from 'Parameter Identification 6' on 2020-09-11 14:49

##### Metabolizing Enzyme: CYP2D6-AS=1.25 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                                                                                         
------------------------------------------- | -------------------------- | ---------------------------------------------------------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                                                                      
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                                                                              
Km                                          | 12.43 µmol/l               |                                                                                                                      
kcat                                        | 7.8945927646 1/min         | Parameter Identification-Parameter Identification-Value updated from 'Parameter Identification 6' on 2020-09-11 14:46

##### Metabolizing Enzyme: CYP2D6-AS=1.5 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                                                                                         
------------------------------------------- | -------------------------- | ---------------------------------------------------------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                                                                      
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                                                                              
Km                                          | 12.43 µmol/l               |                                                                                                                      
kcat                                        | 8.8076966829 1/min         | Parameter Identification-Parameter Identification-Value updated from 'Parameter Identification 7' on 2020-09-12 18:17

##### Metabolizing Enzyme: CYP2D6-AS=2 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                                                                                         
------------------------------------------- | -------------------------- | ---------------------------------------------------------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                                                                      
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                                                                              
Km                                          | 12.43 µmol/l               | Parameter Identification-Parameter Identification-Value updated from 'Parameter Identification 1' on 2020-07-16 17:43
kcat                                        | 14.0227063168 1/min        | Parameter Identification-Parameter Identification-Value updated from 'Parameter Identification 6' on 2020-09-11 14:33

##### Metabolizing Enzyme: CYP2D6-AS=0.5 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin                                                                                                         
------------------------------------------- | -------------------------- | ---------------------------------------------------------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                                                                      
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                                                                              
Km                                          | 10.75 µmol/l               |                                                                                                                      
kcat                                        | 1.8161665619 1/min         | Parameter Identification-Parameter Identification-Value updated from 'Parameter Identification 6' on 2020-09-11 14:49

##### Metabolizing Enzyme: CYP2D6-AS=1.25 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin                                                                                                         
------------------------------------------- | -------------------------- | ---------------------------------------------------------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                                                                      
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                                                                              
Km                                          | 10.75 µmol/l               |                                                                                                                      
kcat                                        | 6.3022175194 1/min         | Parameter Identification-Parameter Identification-Value updated from 'Parameter Identification 6' on 2020-09-11 14:46

##### Metabolizing Enzyme: CYP2D6-AS=1.5 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin                                                                                                         
------------------------------------------- | -------------------------- | ---------------------------------------------------------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                                                                      
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                                                                              
Km                                          | 10.75 µmol/l               |                                                                                                                      
kcat                                        | 7.0307052469 1/min         | Parameter Identification-Parameter Identification-Value updated from 'Parameter Identification 7' on 2020-09-12 18:17

##### Metabolizing Enzyme: CYP2D6-AS=2 (α-Hydroxymetoprolol)

Molecule: CYP2D6

Metabolite: alpha-Hydroxymetoprolol

###### Parameters

Name                                        | Value                      | Value Origin                                                                                                         
------------------------------------------- | -------------------------- | ---------------------------------------------------------------------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                                                                                      
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                                                                              
Km                                          | 10.75 µmol/l               | Parameter Identification-Parameter Identification-Value updated from 'Parameter Identification 1' on 2020-07-16 17:43
kcat                                        | 11.19 1/min                | Parameter Identification-Parameter Identification-Value updated from 'Parameter Identification 6' on 2020-09-11 14:33

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
Molecular weight                                 | 267.36 g/mol            | Database-Pubchem                 |                     |        
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
------------ | -----:| -----------------------------------------------------------------------------------------------------------------------
GFR fraction |     1 | Parameter Identification-Parameter Identification-Value updated from 'hydroxymetoprolol_enzyme_fit' on 2020-01-29 09:59

##### Systemic Process: Total Hepatic Clearance-ASSUMPTION

Species: Human

###### Parameters

Name                          | Value          | Value Origin                                                                                                             
----------------------------- | -------------- | -------------------------------------------------------------------------------------------------------------------------
Fraction unbound (experiment) | 0.12           |                                                                                                                          
Lipophilicity (experiment)    | 0.47 Log Units |                                                                                                                          
Plasma clearance              | 0 ml/min/kg    |                                                                                                                          
Specific clearance            | 0.34 1/min     | Parameter Identification-Parameter Identification-Value updated from 'Parameter Identification 1 log' on 2020-09-11 09:03

## 3.2 Diagnostic plots<a id="32"></a>

The goodness-of-fit diagnostics combine all modeled compounds in one set of plots. Colors and symbols identify compounds consistently with the concentration-time profiles. Administration route, formulation, and model-building or verification status are not used to split the diagnostics.

<a id="table-3-1"></a>

**Table 3-1: GMFE for Observed versus simulated concentration-time data for all modeled compounds**

|Group                   |GMFE |
|:-----------------------|:----|
|alpha-Hydroxymetoprolol |1.83 |
|Metoprolol racemate     |1.32 |
|R-Metoprolol            |1.28 |
|S-Metoprolol            |1.30 |
|All                     |1.36 |

<br>
<br>

<a id="figure-3-1"></a>

![](images/006_section_3/008_section_32/2_gof_plot_predictedVsObserved.png)

**Figure 3-1: Observed versus simulated concentration-time data for all modeled compounds**

<br>
<br>

<a id="figure-3-2"></a>

![](images/006_section_3/008_section_32/3_gof_plot_residualsOverTime.png)

**Figure 3-2: Observed versus simulated concentration-time data for all modeled compounds**

<br>
<br>

## 3.3 Concentration-time profiles<a id="33"></a>

The concentration-time profiles show simulated and observed plasma concentrations for the model-building and model-verification datasets. Profiles include intravenous infusion, oral normal-release metoprolol tartrate and oral controlled-release metoprolol succinate studies.

### 3.3.1 Model Building<a id="331"></a>

Model-building profiles include studies used to inform systemic disposition, absorption, formulation behavior and CYP2D6 activity-score-dependent metabolism.

<a id="figure-3-3"></a>

![](images/006_section_3/009_section_33/010_section_331/1_time_profile_plot_Metoprolol_Johnsson_1975__5_mg_tartrate_iv_10_min__n_5.png)

**Figure 3-3: Time Profile Analysis**

<br>
<br>

<a id="figure-3-4"></a>

![](images/006_section_3/009_section_33/010_section_331/2_time_profile_plot_Metoprolol_Regardh_1974__5_mg_tartrate_iv_10_min__n_5.png)

**Figure 3-4: Time Profile Analysis**

<br>
<br>

<a id="figure-3-5"></a>

![](images/006_section_3/009_section_33/010_section_331/3_time_profile_plot_Metoprolol_Johnsson_1975__10_mg_tartrate_iv_10_min__n_5.png)

**Figure 3-5: Time Profile Analysis**

<br>
<br>

<a id="figure-3-6"></a>

![](images/006_section_3/009_section_33/010_section_331/4_time_profile_plot_Metoprolol_Regardh_1980__10_mg_tartrate_iv_5_min__n_6.png)

**Figure 3-6: Time Profile Analysis**

<br>
<br>

<a id="figure-3-7"></a>

![](images/006_section_3/009_section_33/010_section_331/5_time_profile_plot_Metoprolol_Johnsson_1975__15_mg_tartrate_iv_10_min__n_5.png)

**Figure 3-7: Time Profile Analysis**

<br>
<br>

<a id="figure-3-8"></a>

![](images/006_section_3/009_section_33/010_section_331/6_time_profile_plot_Metoprolol_Johnsson_1975__20_mg_tartrate_iv_10_min__n_5.png)

**Figure 3-8: Time Profile Analysis**

<br>
<br>

<a id="figure-3-9"></a>

![](images/006_section_3/009_section_33/010_section_331/7_time_profile_plot_Metoprolol_Kelly_1985__50_mg_tartrate_iv_10_min__n_12.png)

**Figure 3-9: Time Profile Analysis**

<br>
<br>

<a id="figure-3-10"></a>

![](images/006_section_3/009_section_33/010_section_331/8_time_profile_plot_Metoprolol_Godbillon_1985__88_7_mg_tartrate_iv_150_min__n_6.png)

**Figure 3-10: Time Profile Analysis**

<br>
<br>

<a id="figure-3-11"></a>

![](images/006_section_3/009_section_33/010_section_331/9_time_profile_plot_Metoprolol_Regardh_1974__5_mg_tartrate_solution__n_5.png)

**Figure 3-11: Time Profile Analysis**

<br>
<br>

<a id="figure-3-12"></a>

![](images/006_section_3/009_section_33/010_section_331/10_time_profile_plot_Metoprolol_Johnsson_1975__20_mg_tartrate_IR__n_5.png)

**Figure 3-12: Time Profile Analysis**

<br>
<br>

<a id="figure-3-13"></a>

![](images/006_section_3/009_section_33/010_section_331/11_time_profile_plot_Metoprolol_Johnsson_1975__50_mg_tartrate_IR__n_5.png)

**Figure 3-13: Time Profile Analysis**

<br>
<br>

<a id="figure-3-14"></a>

![](images/006_section_3/009_section_33/010_section_331/12_time_profile_plot_Metoprolol_Johnsson_1975__100_mg_tartrate_IR__n_5.png)

**Figure 3-14: Time Profile Analysis**

<br>
<br>

<a id="figure-3-15"></a>

![](images/006_section_3/009_section_33/010_section_331/13_time_profile_plot_Metoprolol_Kelly_1985__100_mg_tartrate_IR__n_12_md.png)

**Figure 3-15: Time Profile Analysis**

<br>
<br>

<a id="figure-3-16"></a>

![](images/006_section_3/009_section_33/010_section_331/15_time_profile_plot_Metoprolol_Werner_2003_NM__50_mg_tartrate_IR__n_12__AS_1_5.png)

**Figure 3-16: Time Profile Analysis**

<br>
<br>

<a id="figure-3-17"></a>

![](images/006_section_3/009_section_33/010_section_331/20_time_profile_plot_Metoprolol_Huang_1999_IM__100_mg_tartrate_IR__n_12__AS_0_5.png)

**Figure 3-17: Time Profile Analysis**

<br>
<br>

<a id="figure-3-18"></a>

![](images/006_section_3/009_section_33/010_section_331/21_time_profile_plot_Metoprolol_Huang_1999_NM__100_mg_tartrate_IR__n_16__AS_2.png)

**Figure 3-18: Time Profile Analysis**

<br>
<br>

<a id="figure-3-19"></a>

![](images/006_section_3/009_section_33/010_section_331/22_time_profile_plot_Metoprolol_Huang_1999_NM__100_mg_tartrate_IR__n_12__AS_1_25.png)

**Figure 3-19: Time Profile Analysis**

<br>
<br>

<a id="figure-3-20"></a>

![](images/006_section_3/009_section_33/010_section_331/23_time_profile_plot_Metoprolol_Jin_2008_IM__100_mg_tartrate_IR__n_5__AS_0_5.png)

**Figure 3-20: Time Profile Analysis**

<br>
<br>

<a id="figure-3-21"></a>

![](images/006_section_3/009_section_33/010_section_331/24_time_profile_plot_Metoprolol_Jin_2008_NM__100_mg_tartrate_IR__n_6__AS_2.png)

**Figure 3-21: Time Profile Analysis**

<br>
<br>

<a id="figure-3-22"></a>

![](images/006_section_3/009_section_33/010_section_331/25_time_profile_plot_Metoprolol_Jin_2008_NM__100_mg_tartrate_IR__n_7__AS_1_25.png)

**Figure 3-22: Time Profile Analysis**

<br>
<br>

<a id="figure-3-23"></a>

![](images/006_section_3/009_section_33/010_section_331/27_time_profile_plot_Metoprolol_Kirchheiner_Seeringer_2008_NM__100_mg_tartrate_IR__n_13__AS_2.png)

**Figure 3-23: Time Profile Analysis**

<br>
<br>

<a id="figure-3-24"></a>

![](images/006_section_3/009_section_33/010_section_331/28_time_profile_plot_Metoprolol_Kirchheiner_Seeringer_2008_PM__100_mg_tartrate_IR__n_4__AS_0.png)

**Figure 3-24: Time Profile Analysis**

<br>
<br>

<a id="figure-3-25"></a>

![](images/006_section_3/009_section_33/010_section_331/29_time_profile_plot_Metoprolol_Kirchheiner_Seeringer_2008_UM__100_mg_tartrate_IR__n_12__AS_3.png)

**Figure 3-25: Time Profile Analysis**

<br>
<br>

<a id="figure-3-26"></a>

![](images/006_section_3/009_section_33/010_section_331/30_time_profile_plot_Metoprolol_Krosser_2006_NM__100_mg_tartrate_IR__n_18.png)

**Figure 3-26: Time Profile Analysis**

<br>
<br>

<a id="figure-3-27"></a>

![](images/006_section_3/009_section_33/010_section_331/35_time_profile_plot_Metoprolol_Sharma_2005_NM__100_mg_tartrate__n_20__AS_1_5.png)

**Figure 3-27: Time Profile Analysis**

<br>
<br>

<a id="figure-3-28"></a>

![](images/006_section_3/009_section_33/010_section_331/36_time_profile_plot_Metoprolol_Sharma_2005_PM__100_mg_tartrate__n_20__AS_0.png)

**Figure 3-28: Time Profile Analysis**

<br>
<br>

### 3.3.2 Model Verification<a id="332"></a>

Model-verification profiles include additional adult clinical studies used to assess model behavior across sex, formulation and CYP2D6 status conditions not used as the primary fitting dataset.

<a id="figure-3-29"></a>

![](images/006_section_3/009_section_33/011_section_332/14_time_profile_plot_Metoprolol_Stout_2011_NM__50_mg_tartrate_IR__n_10.png)

**Figure 3-29: Time Profile Analysis**

<br>
<br>

<a id="figure-3-30"></a>

![](images/006_section_3/009_section_33/011_section_332/16_time_profile_plot_Metoprolol_Bae_2014_IM__100_mg_tartrate_IR__n_3__AS_0_5.png)

**Figure 3-30: Time Profile Analysis**

<br>
<br>

<a id="figure-3-31"></a>

![](images/006_section_3/009_section_33/011_section_332/17_time_profile_plot_Metoprolol_Bae_2014_NM__100_mg_tartrate_IR__n_4__AS_2.png)

**Figure 3-31: Time Profile Analysis**

<br>
<br>

<a id="figure-3-32"></a>

![](images/006_section_3/009_section_33/011_section_332/18_time_profile_plot_Metoprolol_Hamelin_2000_NM__100_mg_tartrate_IR__n_10.png)

**Figure 3-32: Time Profile Analysis**

<br>
<br>

<a id="figure-3-33"></a>

![](images/006_section_3/009_section_33/011_section_332/19_time_profile_plot_Metoprolol_Hamelin_2000_PM__100_mg_tartrate_IR__n_6.png)

**Figure 3-33: Time Profile Analysis**

<br>
<br>

<a id="figure-3-34"></a>

![](images/006_section_3/009_section_33/011_section_332/26_time_profile_plot_Metoprolol_Johnson_1996_NM__100_mg_tartrate_IR__n_10_White_American.png)

**Figure 3-34: Time Profile Analysis**

<br>
<br>

<a id="figure-3-35"></a>

![](images/006_section_3/009_section_33/011_section_332/31_time_profile_plot_Metoprolol_Luzier_1999_NM__100_mg_tartrate_IR__n_10_female_md.png)

**Figure 3-35: Time Profile Analysis**

<br>
<br>

<a id="figure-3-36"></a>

![](images/006_section_3/009_section_33/011_section_332/32_time_profile_plot_Metoprolol_Luzier_1999_NM__100_mg_tartrate_IR__n_10_male_md.png)

**Figure 3-36: Time Profile Analysis**

<br>
<br>

<a id="figure-3-37"></a>

![](images/006_section_3/009_section_33/011_section_332/33_time_profile_plot_Metoprolol_Parker_2011_NM__100_mg_succinate_CR__n_15.png)

**Figure 3-37: Time Profile Analysis**

<br>
<br>

<a id="figure-3-38"></a>

![](images/006_section_3/009_section_33/011_section_332/34_time_profile_plot_Metoprolol_Parker_2011_NM__100_mg_tartrate_IR__n_15.png)

**Figure 3-38: Time Profile Analysis**

<br>
<br>

<a id="figure-3-39"></a>

![](images/006_section_3/009_section_33/011_section_332/37_time_profile_plot_Metoprolol_Stout_2011_NM__100_mg_succinate_CR__n_10.png)

**Figure 3-39: Time Profile Analysis**

<br>
<br>

<a id="figure-3-40"></a>

![](images/006_section_3/009_section_33/011_section_332/38_time_profile_plot_Metoprolol_Damy_2004__200_mg_succinate_CR__n_13__NM.png)

**Figure 3-40: Time Profile Analysis**

<br>
<br>

<a id="figure-3-41"></a>

![](images/006_section_3/009_section_33/011_section_332/39_time_profile_plot_Metoprolol_Johnson_1996_NM__200_mg_tartrate_IR__n_10_Black_American.png)

**Figure 3-41: Time Profile Analysis**

<br>
<br>

<a id="figure-3-42"></a>

![](images/006_section_3/009_section_33/011_section_332/40_time_profile_plot_Metoprolol_Parker_2011_NM__200_mg_succinate_CR__n_15.png)

**Figure 3-42: Time Profile Analysis**

<br>
<br>

# 4 Conclusion<a id="4"></a>

The metoprolol PBPK model describes racemic metoprolol, (R)-metoprolol, (S)-metoprolol and α-hydroxymetoprolol plasma concentration-time profiles in adults after intravenous and oral administration. The model includes activity-score-dependent CYP2D6 metabolism and supports evaluation of CYP2D6 drug-gene effects across multiple adult clinical studies.

Its use should remain limited to the represented adult intravenous and oral studies, formulations, and CYP2D6 activity-score settings. Interpretation is constrained by uncertainty in genotype-level resolution within an activity-score group and in the quantitative contribution of non-CYP2D6 metabolism.

# 5 References<a id="5"></a>

[1] S Rüdesheim, J-G Wojtyniak, D Selzer, N Hanke, F Mahfoud, M Schwab, T Lehr. Physiologically Based Pharmacokinetic Modeling of Metoprolol Enantiomers and α-Hydroxymetoprolol to Describe CYP2D6 Drug-Gene Interactions. Pharmaceutics, 2020;12:1200. doi: [10.3390/pharmaceutics12121200](https://doi.org/10.3390/pharmaceutics12121200).

[2] S Rüdesheim, H L H Loer, D Feick, F Z Marok, L M Fuhr, D Selzer, D Teutonico, A R P Schneider, J Solodenko, S Frechen, M van der Lee, D J A R Moes, J J Swen, M Schwab, T Lehr. A Comprehensive CYP2D6 Drug-Drug-Gene Interaction Network for Application in Precision Dosing and Drug Development. Clin Pharmacol Ther, 2025. doi: [10.1002/cpt.3604](https://doi.org/10.1002/cpt.3604).

[3] Bae, S. H., Lee, J. K., Cho, D.-Y. & Bae, S. K. Simultaneous determination of metoprolol and its metabolites, α-hydroxymetoprolol and O-desmethylmetoprolol, in human plasma by liquid chromatography with tandem mass spectrometry: Application to the pharmacokinetics of metoprolol associated with CYP2D6 genotype. Journal of Separation Science 37, 1256-1264 (June 2014). doi: [10.1002/jssc.201301353](https://doi.org/10.1002/jssc.201301353).

[4] Damy, T., Pousset, F., Caplain, H., Hulot, J.-S. & Lechat, P. Pharmacokinetic and pharmacodynamic interactions between metoprolol and dronedarone in extensive and poor CYP2D6 metabolizers healthy subjects. Fundamental and Clinical Pharmacology 18, 113-123 (Feb. 2004). doi: [10.1046/j.1472-8206.2003.00216.x](https://doi.org/10.1046/j.1472-8206.2003.00216.x).

[5] Godbillon, J. et al. Investigation of drug absorption from the gastrointestinal tract of man. III. Metoprolol in the colon. British Journal of Clinical Pharmacology 19 Suppl 2, 113S-118S (Apr. 1985). doi: [10.1111/j.1365-2125.1985.tb02751.x](https://doi.org/10.1111/j.1365-2125.1985.tb02751.x).

[6] Hamelin, B. A. et al. Significant interaction between the nonprescription antihistamine diphenhydramine and the CYP2D6 substrate metoprolol in healthy men with high or low CYP2D6 activity. Clinical Pharmacology and Therapeutics 67, 466-477 (May 2000). doi: [10.1067/mcp.2000.106464](https://doi.org/10.1067/mcp.2000.106464).

[7] Huang, J., Chuang, S. K., Cheng, C. L. & Lai, M. L. Pharmacokinetics of metoprolol enantiomers in Chinese subjects of major CYP2D6 genotypes. Clinical Pharmacology and Therapeutics 65, 402-407 (Apr. 1999). doi: [10.1016/S0009-9236(99)70134-7](https://doi.org/10.1016/S0009-9236(99)70134-7).

[8] Jin, S. K. et al. Influence of CYP2D6*10 on the pharmacokinetics of metoprolol in healthy Korean volunteers. Journal of Clinical Pharmacy and Therapeutics 33, 567-573. doi: [10.1111/j.1365-2710.2008.00945.x](https://doi.org/10.1111/j.1365-2710.2008.00945.x).

[9] Johnson, J. A. & Burlew, B. S. Metoprolol metabolism via cytochrome P4502D6 in ethnic populations. Drug Metabolism and Disposition 24, 350-355 (Mar. 1996). doi: [10.1016/S0090-9556(25)07354-4](https://doi.org/10.1016/S0090-9556(25)07354-4).

[10] Johnsson, G., Regårdh, C.-G. & Sölvell, L. Combined pharmacokinetic and pharmacodynamic studies in man of the adrenergic β1-receptor antagonist metoprolol. Acta Pharmacologica et Toxicologica 36, 31-44 (Mar. 1975). doi: [10.1111/j.1600-0773.1975.tb03320.x](https://doi.org/10.1111/j.1600-0773.1975.tb03320.x).

[11] Kelly, J. G., Salem, S. A., Kinney, C. D., Shanks, R. G. & McDevitt, D. G. Effects of ranitidine on the disposition of metoprolol. British Journal of Clinical Pharmacology 19, 219-224 (Feb. 1985). doi: [10.1111/j.1365-2125.1985.tb02634.x](https://doi.org/10.1111/j.1365-2125.1985.tb02634.x).

[12] Kirchheiner, J. et al. Impact of the ultrarapid metabolizer genotype of cytochrome P450 2D6 on metoprolol pharmacokinetics and pharmacodynamics. Clinical Pharmacology and Therapeutics 76, 302-312 (Oct. 2004). doi: [10.1016/j.clpt.2004.07.002](https://doi.org/10.1016/j.clpt.2004.07.002).

[13] Krösser, S. et al. Investigation of sarizotan's impact on the pharmacokinetics of probe drugs for major cytochrome P450 isoenzymes: a combined cocktail trial. European Journal of Clinical Pharmacology 62, 277-284 (2006). doi: [10.1007/s00228-006-0101-7](https://doi.org/10.1007/s00228-006-0101-7).

[14] Luzier, A. B. et al. Gender-related effects on metoprolol pharmacokinetics and pharmacodynamics in healthy volunteers. Clinical Pharmacology and Therapeutics 66, 594-601 (Dec. 1999). doi: [10.1053/cp.1999.v66.103400001](https://doi.org/10.1053/cp.1999.v66.103400001).

[15] Mautz, D. S., Nelson, W. L. & Shen, D. D. Regioselective and stereoselective oxidation of metoprolol and bufuralol catalyzed by microsomes containing cDNA-expressed human P4502D6. Drug Metabolism and Disposition 23, 513-517 (Apr. 1995). doi: [10.1016/S0090-9556(25)06590-0](https://doi.org/10.1016/S0090-9556(25)06590-0).

[16] Parker, R. B. & Soberman, J. E. Effects of paroxetine on the pharmacokinetics and pharmacodynamics of immediate-release and extended-release metoprolol. Pharmacotherapy 31, 630-641 (2011). doi: [10.1592/phco.31.7.630](https://doi.org/10.1592/phco.31.7.630).

[17] Plosker, G. L. & Clissold, S. P. Controlled Release Metoprolol Formulations. Drugs 43, 382-414 (Mar. 1992). doi: [10.2165/00003495-199243030-00006](https://doi.org/10.2165/00003495-199243030-00006).

[18] Regårdh, C. G., Borg, K. O., Johansson, R., Johnsson, G. & Palmer, L. Pharmacokinetic studies on the selective beta1-receptor antagonist metoprolol in man. Journal of Pharmacokinetics and Biopharmaceutics 2, 347-364 (Aug. 1974). doi: [10.1007/BF01061407](https://doi.org/10.1007/BF01061407).

[19] Regårdh, C. G. & Johnsson, G. Clinical Pharmacokinetics of Metoprolol. Clinical Pharmacokinetics 5, 557-569 (1980). doi: [10.2165/00003088-198005060-00004](https://doi.org/10.2165/00003088-198005060-00004).

[20] Seeringer, A., Brockmöller, J., Bauer, S. & Kirchheiner, J. Enantiospecific pharmacokinetics of metoprolol in CYP2D6 ultra-rapid metabolizers and correlation with exercise-induced heart rate. European Journal of Clinical Pharmacology 64, 883-888 (Sept. 2008). doi: [10.1007/s00228-008-0504-8](https://doi.org/10.1007/s00228-008-0504-8).

[21] Sharma, A. et al. Modulation of Metoprolol Pharmacokinetics and Hemodynamics by Diphenhydramine Coadministration during Exercise Testing in Healthy Premenopausal Women. Journal of Pharmacology and Experimental Therapeutics 313, 1172-1181 (June 2005). doi: [10.1124/jpet.104.081109](https://doi.org/10.1124/jpet.104.081109).

[22] Stout, S. M. et al. Influence of metoprolol dosage release formulation on the pharmacokinetic drug interaction with paroxetine. Journal of Clinical Pharmacology 51, 389-396 (Mar. 2011). doi: [10.1177/0091270010365559](https://doi.org/10.1177/0091270010365559).

[23] Werner, U. et al. Celecoxib inhibits metabolism of cytochrome P450 2D6 substrate metoprolol in humans. Clinical Pharmacology and Therapeutics 74, 130-137 (2003). doi: [10.1016/S0009-9236(03)00120-6](https://doi.org/10.1016/S0009-9236(03)00120-6).

[24] Wishart, D. S. et al. HMDB 4.0: the human metabolome database for 2018. Nucleic Acids Research 46, D608-D617 (2018). doi: [10.1093/nar/gkx1089](https://doi.org/10.1093/nar/gkx1089).

