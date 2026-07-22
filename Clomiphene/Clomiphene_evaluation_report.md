# Building and evaluation of a PBPK model for Clomiphene in adults

| Version                                         | vevaluation                                                        |
| ----------------------------------------------- | ----------------------------------------------------------- |
| based on *Model Snapshot* and *Evaluation Plan* | https://github.com/Open-Systems-Pharmacology/Clomiphene-Model/releases/tag/v1.0 |
| OSP Version                                     | evaluation                                                         |
| Qualification Framework Version                 | 12.2                                                         |

This evaluation report and the corresponding PK-Sim project file are filed at:

https://github.com/Open-Systems-Pharmacology/OSP-PBPK-Model-Library/

# Table of Contents

 * [1 Introduction](#1)
 * [2 Methods](#2)
   * [2.1 Modeling strategy](#21)
   * [2.2 Data used](#22)
   * [2.3 Model parameters and assumptions](#23)
 * [3 Results and Discussion](#3)
   * [3.1 Clomiphene final input parameters](#31)
   * [3.2 Diagnostic plots](#32)
   * [3.3 Concentration-time profiles](#33)
     * [3.3.1 CYP2D6 DGI panel study](#331)
     * [3.3.2 Literature studies](#332)
 * [4 Conclusion](#4)
 * [5 References](#5)

# 1 Introduction<a id="1"></a>

(E)-Clomiphene is the trans-isomer of clomiphene and contributes to the clinical pharmacology of clomiphene citrate, a selective estrogen receptor modulator used in reproductive medicine. Its pharmacokinetics are complex because clomiphene is administered as an E/Z mixture, undergoes sequential oxidative metabolism and shows clinically relevant variability linked to CYP2D6 activity [[1](#5-references)].

The model describes (E)-clomiphene as a whole-body parent-metabolite PBPK model with (E)-N-desethylclomiphene, (E)-4-hydroxyclomiphene and (E)-4-hydroxy-N-desethylclomiphene as measured metabolites. This structure supports evaluation of parent and metabolite plasma concentration-time data after oral clomiphene or enclomiphene administration and enables activity-score-dependent CYP2D6 DGI simulations.

The clinical evaluation covers adult plasma pharmacokinetic data after single-dose and multiple-dose oral administration. The dataset includes a CYP2D6 activity-score stratified panel study with parent and metabolite measurements and external literature studies reporting (E)-clomiphene concentration-time data. The model was developed for clomiphene DGI and DDGI scenario prediction and was subsequently integrated into the broader CYP2D6 interaction network [[1](#5-references), [2](#5-references)].

# 2 Methods<a id="2"></a>

## 2.1 Modeling strategy<a id="21"></a>

The PBPK model was developed using the Open Systems Pharmacology Suite. Distribution and elimination processes were implemented in a whole-body model structure using standard physiological organ compartments and compound-specific physicochemical and biochemical input parameters.

Model development followed an iterative workflow in which in vitro and physicochemical information was combined with clinical plasma concentration-time data. Parameters with direct literature support were used as fixed inputs where possible, while selected parameters controlling oral absorption, metabolism, residual clearance and activity-score-dependent CYP2D6 scaling were optimized against clinical data.

The model represents (E)-clomiphene and three metabolites as separate compounds. (E)-N-Desethylclomiphene is included as the main desethyl metabolite, while (E)-4-hydroxyclomiphene and (E)-4-hydroxy-N-desethylclomiphene are included as active hydroxylated metabolites. The four-compound structure is required because the available panel study reports parent and metabolite concentration-time data across CYP2D6 activity-score groups.

The clinical panel study by Kovar et al. informed activity-score-dependent parent-metabolite disposition after oral clomiphene citrate administration [[1](#5-references)]. Literature studies by Mikkelson et al., Ratiopharm GmbH, Wiehle et al. and Miller et al. provided additional single-dose and multiple-dose oral concentration-time data for (E)-clomiphene [[3](#5-references), [4](#5-references), [5](#5-references), [6](#5-references)]. The literature studies are used to evaluate oral formulation behavior and the parent compound over a dose range broader than the DGI panel study.

The major proteins represented in the model are CYP2D6, CYP3A4 and CYP2B6. CYP2D6 accounts for the activity-score-dependent formation and elimination pathways that drive DGI behavior. CYP3A4 contributes to desethylation and metabolite turnover, while CYP2B6 contributes to (E)-4-hydroxyclomiphene formation. Renal filtration, enterohepatic recirculation and residual hepatic clearance are retained where required to describe parent and metabolite disposition.

## 2.2 Data used<a id="22"></a>

### 2.2.1 In vitro and physicochemical data

Drug-dependent input parameters for (E)-clomiphene and its metabolites were taken from the published clomiphene PBPK model and the cited primary sources therein [[1](#5-references)]. The key physicochemical properties include molecular weight, pK<sub>a</sub>, lipophilicity, solubility, fraction unbound in plasma and intestinal permeability. Compound-specific values are used for the parent and each metabolite because polarity, protein binding and elimination differ across the metabolic sequence.

CYP2D6 K<sub>m</sub> values are based on in vitro metabolism data for clomiphene and its metabolites, with nonspecific in vitro binding accounted for in the model development workflow [[1](#5-references), [7](#5-references)]. Activity-score-dependent k<sub>cat</sub> values were identified for normal metabolizers and scaled to additional CYP2D6 activity-score groups using pathway-specific in vitro scaling factors [[1](#5-references), [2](#5-references)].

| Parameter group | Model use | Main source |
| --- | --- | --- |
| Molecular weight, pK<sub>a</sub>, solubility, lipophilicity and f<sub>u</sub> | Parent and metabolite physicochemical and distribution inputs | [Kovar et al. 2022](#5-references) and cited primary sources |
| CYP2D6 K<sub>m</sub> and k<sub>cat</sub> values | activity-score-dependent hydroxylation and downstream metabolite clearance | [Mürdter et al. 2012](#5-references), [Kovar et al. 2022](#5-references) |
| CYP3A4 and CYP2B6 metabolic pathways | Desethylation, hydroxylation and metabolite turnover | [Mazzarino et al. 2013](#5-references), [Kovar et al. 2022](#5-references) |
| Plasma binding estimates | Distribution and unbound concentration scaling | [Watanabe et al. 2018](#5-references), [Kovar et al. 2022](#5-references) |
| Partition coefficients and permeability | Tissue distribution and cellular permeability | [Schmitt 2008](#5-references), [Rodgers and Rowland 2005](#5-references), [Rodgers et al. 2006](#5-references), [Berezhkovskiy 2004](#5-references) |

### 2.2.2 Clinical data

Clinical plasma concentration-time data were used for model building and evaluation after oral clomiphene or enclomiphene administration. The clinical dataset includes parent (E)-clomiphene observations from external literature and parent-metabolite observations from the CYP2D6 activity-score panel study.

| Publication | Clinical data used |
| --- | --- |
| [Kovar et al. 2022](#5-references) | Oral single-dose clomiphene citrate data in healthy adult premenopausal women with CYP2D6 activity-score groups were used for parent-metabolite DGI evaluation. |
| [Mikkelson et al. 1986](#5-references) | Oral single-dose clomiphene citrate data in healthy adult volunteers supported evaluation of (E)-clomiphene disposition after a low single dose. |
| [Ratiopharm GmbH 2016](#5-references) | Oral single-dose clomiphene citrate data from the product information dataset supported an additional (E)-clomiphene single-dose comparison. |
| [Wiehle et al. 2013](#5-references) | Oral multiple-dose enclomiphene citrate data in adult men with secondary hypogonadism supported evaluation across 6.25, 12.5 and 25 mg dose levels. |
| [Miller et al. 2019](#5-references) | Oral multiple-dose clomiphene data in adult men supported an additional repeated-dose (E)-clomiphene comparison. |

## 2.3 Model parameters and assumptions<a id="23"></a>

### 2.3.1 Absorption

The model includes oral administration of (E)-clomiphene after clomiphene citrate or enclomiphene citrate dosing. The clinical panel study used clomiphene citrate tablets containing the E/Z isomer mixture, and the model evaluates the (E)-clomiphene fraction relevant to the measured parent-metabolite dataset [[1](#5-references)].

Oral absorption is represented with a tablet Weibull dissolution function and compound intestinal permeability. The tablet formulation parameters describe the oral input profile, while differences between CYP2D6 activity-score groups are assigned to metabolism rather than absorption.

The external literature studies include single-dose and multiple-dose oral dosing conditions. These data support evaluation of oral input behavior across lower single doses and repeated enclomiphene exposure, but they do not by themselves resolve individual CYP2D6 activity in the absence of genotype or phenotype information.

### 2.3.2 Distribution

(E)-Clomiphene is represented as a highly lipophilic, highly protein-bound compound with logP of 5.67 and f<sub>u</sub> of 0.08% as summarized in [Section 2.2](Section2.2_Data.md). The metabolites are less lipophilic but remain substantially bound, with logP values of 4.17 for (E)-N-desethylclomiphene, 5.50 for (E)-4-hydroxyclomiphene and 3.71 for (E)-4-hydroxy-N-desethylclomiphene [[1](#5-references)].

Partition coefficients were calculated with Schmitt, Rodgers and Rowland or Berezhkovskiy methods depending on the compound. The model therefore treats the parent and metabolites as separate distribution entities rather than as a single lumped active moiety.

The active hydroxylated metabolites are represented with their own molecular weight, pK<sub>a</sub>, lipophilicity, plasma binding and clearance parameters. This separation is required because metabolite exposure is controlled by both formation from upstream compounds and metabolite-specific elimination.

### 2.3.3 Metabolism and elimination

Clomiphene elimination is represented by CYP2D6-dependent hydroxylation and desethylation, CYP3A4-dependent desethylation and metabolite turnover, CYP2B6-dependent hydroxylation, renal filtration, enterohepatic recirculation and residual hepatic clearance components.

* CYP2D6

CYP2D6 is the central enzyme for DGI behavior in the model. It forms (E)-4-hydroxyclomiphene from (E)-clomiphene and contributes to desethylation and downstream metabolite elimination. Pathway-specific K<sub>m</sub> values are used, while k<sub>cat</sub> values depend on activity score [[1](#5-references), [7](#5-references)].

The CYP2D6 activity-score implementation is the key determinant of simulated exposure differences across poor, intermediate, normal and ultrarapid metabolizer groups. Poor-metabolizer activity is set to zero, while non-zero activity-score groups use scaled k<sub>cat</sub> values.

* CYP3A4, CYP2B6 and residual clearance

CYP3A4 is implemented for (E)-N-desethylclomiphene formation and downstream metabolite turnover. CYP2B6 contributes to (E)-4-hydroxyclomiphene formation from (E)-clomiphene. These pathways support non-CYP2D6 clearance and metabolite formation where the in vitro data indicate additional enzymatic contribution [[1](#5-references), [9](#5-references)].

Residual hepatic clearance terms are empirical. They should be interpreted as structural model components required to describe total disposition rather than as direct measurements of a single biochemical pathway.

* Renal filtration and enterohepatic recirculation

Renal filtration is included with compound-specific GFR fractions for the parent and metabolites. Enterohepatic recirculation is represented with continuous bile release fractions where required by the model structure.

# 3 Results and Discussion<a id="3"></a>

The evaluation combines goodness-of-fit diagnostics and concentration-time profiles for (E)-clomiphene, (E)-4-hydroxyclomiphene, (E)-N-desethylclomiphene and (E)-4-hydroxy-N-desethylclomiphene. The diagnostic plots are separated by analyte so that parent and metabolite observations can be assessed without ambiguous legends.

Overall model performance should be interpreted across the full clinical dataset rather than from a single study arm. The external literature studies primarily assess oral parent-compound disposition across single-dose and multiple-dose conditions, while the CYP2D6 activity-score panel study assesses parent-metabolite behavior across CYP2D6 activity groups.

The clomiphene model publication reported that the model described the observed parent and metabolite concentration-time profiles and supported prediction of CYP2D6 DGI and CYP2D6/CYP3A4 DDGI scenarios [[1](#5-references)]. The present report reproduces the concentration-time and GOF assessment structure for the model repository and keeps parent and metabolite endpoints separated in the diagnostic sections.

Residual uncertainty remains for the exact contribution of non-CYP2D6 pathways, protein-binding estimates and individual variability within the same CYP2D6 activity-score group. The model therefore supports CYP2D6 activity-score-based exposure evaluation, while further genotype-specific refinement would require additional clinical data with paired parent-metabolite profiles.

## 3.1 Clomiphene final input parameters<a id="31"></a>

The following input-parameter tables summarize the final model parameterization for (E)-clomiphene and its metabolites. Parameter interpretation should be based on the source descriptions in [Section 2.2](Section2.2_Data.md) and the assumptions in [Section 2.3](Section2.3_Model_Parameters_and_Assumptions.md).

### Compound: (E)-clomiphene

#### Parameters

Name                                             | Value               | Value Origin                                                | Alternative            | Default
------------------------------------------------ | ------------------- | ----------------------------------------------------------- | ---------------------- | -------
Solubility at reference pH                       | 13.8 mg/l           | Publication-Das et al. 2020                                 | Das et al. 2020 pH 6.8 | True   
Reference pH                                     | 6.8                 | Publication-Das et al. 2020                                 | Das et al. 2020 pH 6.8 | True   
Lipophilicity                                    | 5.67 Log Units      | Parameter Identification-Parameter Identification-Optimized | Optimized              | True   
Fraction unbound (plasma, reference value)       | 0.00084694454938    | Parameter Identification-Parameter Identification-Optimized | Measurement            | True   
Specific intestinal permeability (transcellular) | 0.0828652784 cm/min | Parameter Identification-Parameter Identification-Optimized | Optimized              | True   
Cl                                               | 1                   | Publication-Siramshetty et al. 2022                         |                        |        
Is small molecule                                | Yes                 |                                                             |                        |        
Molecular weight                                 | 405.96 g/mol        | Publication-Siramshetty et al. 2022                         |                        |        
Plasma protein binding partner                   | Albumin             |                                                             |                        |        

#### Calculation methods

Name                    | Value                   
----------------------- | ------------------------
Partition coefficients  | Schmitt                 
Cellular permeabilities | Charge dependent Schmitt

#### Processes

##### Metabolizing Enzyme: CYP3A4-Mürdter et al. 2012

Molecule: CYP3A4

Metabolite: (E)-Deethyl-clomiphene

###### Parameters

Name                               | Value                          | Value Origin                                               
---------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 290.7 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 0.783674994 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 44.9466036298 1/min            | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=2) - (E)-4-OH-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-hydroxyclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 90.1 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       |                                                            
Km                                          | 0.130612499 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 306.3819989852 1/min          | Parameter Identification-Parameter Identification-Optimized

##### Systemic Process: Glomerular Filtration-Pharmacokinetic panel study

Species: Human

###### Parameters

Name         |        Value | Value Origin                                               
------------ | ------------:| -----------------------------------------------------------
GFR fraction | 0.9183035142 | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2B6-Mürdter et al. 2012

Molecule: CYP2B6

Metabolite: 4-Hydroxy-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 90.1 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Content of CYP proteins in liver microsomes | 39 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.600817495 µmol/l            | Publication-In Vitro-Mürdter et al. 2012                   
kcat                                        | 7.493654322 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (AS=2) - (Z)-3-OH-clomiphene

Molecule: CYP2D6

Metabolite: (Z)-3-OH-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 38.2 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.030872045 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 130.3516139745 1/min          | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mazzarino et al. 2013 (AS=3) - (E)-DE-clomiphene

Molecule: CYP2D6

Metabolite: (E)-N-desethylclomiphene

###### Parameters

Name                               | Value                          | Value Origin                                               
---------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 290.7 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 0.783674994 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 171.5386005 1/min              | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (AS=0.5) - (Z)-3-OH-clomiphene

Molecule: CYP2D6

Metabolite: (Z)-3-OH-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 38.2 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.030872045 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 22.68117655 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (AS=0.75) - (Z)-3-OH-clomiphene

Molecule: CYP2D6

Metabolite: (Z)-3-OH-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 38.2 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.030872045 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 29.84299905 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (AS=0) - (Z)-3-OH-clomiphene

Molecule: CYP2D6

Metabolite: (Z)-3-OH-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 38.2 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.030872045 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 0 1/min                       | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (AS=1) - (Z)-3-OH-clomiphene

Molecule: CYP2D6

Metabolite: (Z)-3-OH-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 38.2 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.030872045 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 66.12599871 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (AS=3) - (Z)-3-OH-clomiphene

Molecule: CYP2D6

Metabolite: (Z)-3-OH-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 38.2 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.030872045 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 184.2542995 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mazzarino et al. 2013 (AS=2) - (E)-DE-clomiphene

Molecule: CYP2D6

Metabolite: (E)-N-desethylclomiphene

###### Parameters

Name                               | Value                          | Value Origin                                               
---------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 290.7 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 0.783674994 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 121.3558299218 1/min           | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mazzarino et al. 2013 (AS=0) - (E)-DE-clomiphene

Molecule: CYP2D6

Metabolite: (E)-N-desethylclomiphene

###### Parameters

Name                               | Value                          | Value Origin                                               
---------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 290.7 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 0.783674994 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 0 1/min                        | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mazzarino et al. 2013 (AS=0.5) - (E)-DE-clomiphene

Molecule: CYP2D6

Metabolite: (E)-N-desethylclomiphene

###### Parameters

Name                               | Value                          | Value Origin                                               
---------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 290.7 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 0.783674994 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 21.11591042 1/min              | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mazzarino et al. 2013 (AS=0.75) - (E)-DE-clomiphene

Molecule: CYP2D6

Metabolite: (E)-N-desethylclomiphene

###### Parameters

Name                               | Value                          | Value Origin                                               
---------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 290.7 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 0.783674994 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 27.7834835 1/min               | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mazzarino et al. 2013 (AS=1) - (E)-DE-clomiphene

Molecule: CYP2D6

Metabolite: (E)-N-desethylclomiphene

###### Parameters

Name                               | Value                          | Value Origin                                               
---------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 290.7 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 0.783674994 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 61.56253235 1/min              | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=0) - (E)-4-OH-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-hydroxyclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 90.1 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.130612499 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 0 1/min                       | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=0.5) - (E)-4-OH-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-hydroxyclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 90.1 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.130612499 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 57.48197455 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=0.75) - (E)-4-OH-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-hydroxyclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 90.1 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.130612499 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 81.56688504 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=1) - (E)-4-OH-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-hydroxyclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 90.1 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.130612499 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 175.0793273 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=3) - (E)-4-OH-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-hydroxyclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 90.1 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.130612499 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 467.2288197 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mazzarino et al. 2013 (Miller 2018) - (E)-DE-clomiphene

Molecule: CYP2D6

Metabolite: (E)-N-desethylclomiphene

###### Parameters

Name                               | Value                          | Value Origin                                               
---------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 290.7 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 0.783674994 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 7.1740592157 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (Miller 2018) - (Z)-3-OH-clomiphene

Molecule: CYP2D6

Metabolite: (Z)-3-OH-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 38.2 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.030872045 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 7.7058530943 1/min            | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (Miller 2018) - (E)-4-OH-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-hydroxyclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 90.1 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.130612499 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 18.1120478905 1/min           | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (Wiehle 2013 12.5 mg) - (Z)-3-OH-clomiphene

Molecule: CYP2D6

Metabolite: (Z)-3-OH-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 38.2 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.030872045 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 52.779552089 1/min            | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mazzarino et al. 2013 (Wiehle 2013 12.5 mg) - (E)-DE-clomiphene

Molecule: CYP2D6

Metabolite: (E)-N-desethylclomiphene

###### Parameters

Name                               | Value                          | Value Origin                                               
---------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 290.7 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 0.783674994 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 49.1371464562 1/min            | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (Wiehle 2013 12.5 mg) - (E)-4-OH-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-hydroxyclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 90.1 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.130612499 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 124.0545029059 1/min          | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (Wiehle 2013 25  mg) - (Z)-3-OH-clomiphene

Molecule: CYP2D6

Metabolite: (Z)-3-OH-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 38.2 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.030872045 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 18.4144257821 1/min           | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (Wiehle 2013 6.25 mg) - (Z)-3-OH-clomiphene

Molecule: CYP2D6

Metabolite: (Z)-3-OH-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 38.2 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.030872045 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 37.3233521148 1/min           | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (Study Ratiopharm) - (Z)-3-OH-clomiphene

Molecule: CYP2D6

Metabolite: (Z)-3-OH-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 38.2 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.030872045 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 120.4548809775 1/min          | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (Mikkelson 1986) - (Z)-3-OH-clomiphene

Molecule: CYP2D6

Metabolite: (Z)-3-OH-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 38.2 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.030872045 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 90.6375098012 1/min           | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mazzarino et al. 2013 (Wiehle 2013 25 mg) - (E)-DE-clomiphene

Molecule: CYP2D6

Metabolite: (E)-N-desethylclomiphene

###### Parameters

Name                               | Value                          | Value Origin                                               
---------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 290.7 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 0.783674994 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 17.143615297 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mazzarino et al. 2013 (Wiehle 2013 6.25 mg) - (E)-DE-clomiphene

Molecule: CYP2D6

Metabolite: (E)-N-desethylclomiphene

###### Parameters

Name                               | Value                          | Value Origin                                               
---------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 290.7 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 0.783674994 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 34.7476048301 1/min            | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mazzarino et al. 2013 (Study Ratiopharm) - (E)-DE-clomiphene

Molecule: CYP2D6

Metabolite: (E)-N-desethylclomiphene

###### Parameters

Name                               | Value                          | Value Origin                                               
---------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 290.7 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 0.783674994 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 112.1420871092 1/min           | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mazzarino et al. 2013 (Mikkelson 1986) - (E)-DE-clomiphene

Molecule: CYP2D6

Metabolite: (E)-N-desethylclomiphene

###### Parameters

Name                               | Value                          | Value Origin                                               
---------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 290.7 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 0.783674994 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 84.3824628525 1/min            | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (Wiehle 2013 25 mg) - (E)-4-OH-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-hydroxyclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                    
------------------------------------------- | ----------------------------- | --------------------------------
In vitro Vmax for liver microsomes          | 90.1 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                         
Km                                          | 0.130612499 µmol/l            | Publication-In Vitro-Kröner 2018
kcat                                        | 43.2817700468 1/min           | Unknown                         

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (Wiehle 2013 6.25 mg) - (E)-4-OH-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-hydroxyclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 90.1 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.130612499 µmol/l            | Publication-In Vitro-Kröner 2018                           
kcat                                        | 87.725827714 1/min            | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (Study Ratiopharm) - (E)-4-OH-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-hydroxyclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                    
------------------------------------------- | ----------------------------- | --------------------------------
In vitro Vmax for liver microsomes          | 90.1 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                         
Km                                          | 0.130612499 µmol/l            | Publication-In Vitro-Kröner 2018
kcat                                        | 283.1204470445 1/min          | Unknown                         

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (Mikkelson 1986) - (E)-4-OH-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-hydroxyclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                    
------------------------------------------- | ----------------------------- | --------------------------------
In vitro Vmax for liver microsomes          | 90.1 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                         
Km                                          | 0.130612499 µmol/l            | Publication-In Vitro-Kröner 2018
kcat                                        | 213.0368822389 1/min          | Unknown                         

### Compound: (E)-N-desethylclomiphene

#### Parameters

Name                                       | Value                  | Value Origin                                                | Alternative | Default
------------------------------------------ | ---------------------- | ----------------------------------------------------------- | ----------- | -------
Solubility at reference pH                 | 0.46 mg/ml             | Database-Chemicalize                                        | Measurement | True   
Reference pH                               | 6.5                    | Database-Chemicalize                                        | Measurement | True   
Lipophilicity                              | 4.1726909096 Log Units | Parameter Identification-Parameter Identification-Optimized | Optimized   | True   
Fraction unbound (plasma, reference value) | 0.0085575590017        | Parameter Identification-Parameter Identification-Optimized | Measurement | True   
Cl                                         | 1                      |                                                             |             |        
Is small molecule                          | Yes                    |                                                             |             |        
Molecular weight                           | 377.91 g/mol           |                                                             |             |        
Plasma protein binding partner             | Albumin                |                                                             |             |        

#### Calculation methods

Name                    | Value                   
----------------------- | ------------------------
Partition coefficients  | Rodgers and Rowland     
Cellular permeabilities | Charge dependent Schmitt

#### Processes

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=3) - (E)-4-Hydroxy-deethyl-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-Hydroxy-deethyl-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 53.6 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.48716284 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                                        | 84.00858577 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Systemic Process: Glomerular Filtration-Pharmacokinetic panel study

Species: Human

###### Parameters

Name         |        Value | Value Origin                                               
------------ | ------------:| -----------------------------------------------------------
GFR fraction | 0.1005414757 | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=3) - (E)-N,N-didesethylclomiphene

Molecule: CYP2D6

Metabolite: (E)-N,N-didesethylclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 20.6 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.96838467 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                                        | 8.248111562 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP3A4-Mürdter et al. 2012 - (E)-N,N-didesethylclomiphene

Molecule: CYP3A4

Metabolite: (E)-N,N-didesethylclomiphene

###### Parameters

Name                               | Value                         | Value Origin                                               
---------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 20.6 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 0.96838467 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 0.7771909271 1/min            | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=0) - (E)-N,N-didesethylclomiphene

Molecule: CYP2D6

Metabolite: (E)-N,N-didesethylclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 20.6 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.96838467 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                                        | 0 1/min                       | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=0.5) - (E)-N,N-didesethylclomiphene

Molecule: CYP2D6

Metabolite: (E)-N,N-didesethylclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 20.6 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.96838467 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                                        | 1.01531891 1/min              | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=0.75) - (E)-N,N-didesethylclomiphene

Molecule: CYP2D6

Metabolite: (E)-N,N-didesethylclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 20.6 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.96838467 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                                        | 1.335916645 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=1) - (E)-N,N-didesethylclomiphene

Molecule: CYP2D6

Metabolite: (E)-N,N-didesethylclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 20.6 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.96838467 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                                        | 2.960118793 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=2) - (E)-N,N-didesethylclomiphene

Molecule: CYP2D6

Metabolite: (E)-N,N-didesethylclomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 20.6 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.96838467 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                                        | 5.8351672527 1/min            | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=2) - (E)-4-Hydroxy-deethyl-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-Hydroxy-deethyl-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 53.6 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.48716284 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                                        | 64.5203767233 1/min           | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=0.5) - (E)-4-Hydroxy-deethyl-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-Hydroxy-deethyl-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 53.6 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.48716284 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                                        | 10.34807199 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=0.75) - (E)-4-Hydroxy-deethyl-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-Hydroxy-deethyl-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 53.6 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.48716284 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                                        | 12.36587928 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=1) - (E)-4-Hydroxy-deethyl-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-Hydroxy-deethyl-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 53.6 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.48716284 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                                        | 28.59140514 1/min             | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (AS=0) - (E)-4-Hydroxy-deethyl-clomiphene

Molecule: CYP2D6

Metabolite: (E)-4-Hydroxy-deethyl-clomiphene

###### Parameters

Name                                        | Value                         | Value Origin                                               
------------------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 53.6 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein       | Unknown                                                    
Km                                          | 0.48716284 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                                        | 0 1/min                       | Parameter Identification-Parameter Identification-Optimized

### Compound: (E)-4-hydroxyclomiphene

#### Parameters

Name                                       | Value                  | Value Origin                                                | Alternative | Default
------------------------------------------ | ---------------------- | ----------------------------------------------------------- | ----------- | -------
Solubility at reference pH                 | 0.06 mg/ml             |                                                             | Measurement | True   
Reference pH                               | 6.5                    |                                                             | Measurement | True   
Lipophilicity                              | 5.5012508036 Log Units | Parameter Identification-Parameter Identification-Optimized | Optimized   | True   
Fraction unbound (plasma, reference value) | 0.00449                | Parameter Identification-Parameter Identification-Optimized | Measurement | True   
Cl                                         | 1                      |                                                             |             |        
Is small molecule                          | Yes                    |                                                             |             |        
Molecular weight                           | 421.97 g/mol           |                                                             |             |        
Plasma protein binding partner             | Albumin                |                                                             |             |        

#### Calculation methods

Name                    | Value          
----------------------- | ---------------
Partition coefficients  | Berezhkovskiy  
Cellular permeabilities | PK-Sim Standard

#### Processes

##### Metabolizing Enzyme: CYP3A4-Mürdter et al. 2012

Molecule: CYP3A4

Metabolite: (E)-4-Hydroxy-deethyl-clomiphene

###### Parameters

Name                               | Value                          | Value Origin                                               
---------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 161.2 pmol/min/mg mic. protein | Publication-In Vitro-Mürdter et al. 2012                   
Km                                 | 3.400160633 µmol/l             | Publication-In Vitro-Mürdter et al. 2012                   
kcat                               | 19.52 1/min                    | Parameter Identification-Parameter Identification-Optimized

##### Systemic Process: Glomerular Filtration-Pharmacokinetic panel study

Species: Human

###### Parameters

Name         |        Value | Value Origin                                               
------------ | ------------:| -----------------------------------------------------------
GFR fraction | 0.2386673303 | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (AS=3)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                          | Value Origin                                               
------------------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 474.5 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein        | Unknown                                                    
Km                                          | 3.59784439 µmol/l              | Publication-In Vitro-Kröner 2018                           
kcat                                        | 1208.794021 1/min              | Parameter Identification-Parameter Identification-Optimized

##### Systemic Process: Total Hepatic Clearance-Assumption

Species: Human

###### Parameters

Name                          | Value                  | Value Origin                                               
----------------------------- | ---------------------- | -----------------------------------------------------------
Fraction unbound (experiment) | 0.0133                 |                                                            
Lipophilicity (experiment)    | 4.6502520184 Log Units |                                                            
Plasma clearance              | 0 ml/min/kg            |                                                            
Specific clearance            | 23.7771867087 1/min    | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (AS=0)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                          | Value Origin                                               
------------------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 474.5 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein        | Unknown                                                    
Km                                          | 3.59784439 µmol/l              | Publication-In Vitro-Kröner 2018                           
kcat                                        | 0 1/min                        | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (AS=0.5)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                          | Value Origin                                               
------------------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 474.5 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein        | Unknown                                                    
Km                                          | 3.59784439 µmol/l              | Publication-In Vitro-Kröner 2018                           
kcat                                        | 148.7990819 1/min              | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (AS=0.75)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                          | Value Origin                                               
------------------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 474.5 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein        | Unknown                                                    
Km                                          | 3.59784439 µmol/l              | Publication-In Vitro-Kröner 2018                           
kcat                                        | 195.7839731 1/min              | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (AS=1)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                          | Value Origin                                               
------------------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 474.5 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein        | Unknown                                                    
Km                                          | 3.59784439 µmol/l              | Publication-In Vitro-Kröner 2018                           
kcat                                        | 433.8173497 1/min              | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (AS=2)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                          | Value Origin                                               
------------------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 474.5 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018                           
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein        | Unknown                                                    
Km                                          | 3.59784439 µmol/l              | Publication-In Vitro-Kröner 2018                           
kcat                                        | 855.1672990338 1/min           | Parameter Identification-Parameter Identification-Optimized

### Compound: (E)-4-hydroxy-N-desethylclomiphene

#### Parameters

Name                                       | Value                  | Value Origin                                                | Alternative | Default
------------------------------------------ | ---------------------- | ----------------------------------------------------------- | ----------- | -------
Solubility at reference pH                 | 0.17 mg/ml             | Database-Chemicalize                                        | Measurement | True   
Reference pH                               | 6.5                    | Database-Chemicalize                                        | Measurement | True   
Lipophilicity                              | 3.7147097639 Log Units | Parameter Identification-Parameter Identification-Optimized | Optimized   | True   
Fraction unbound (plasma, reference value) | 0.0132                 | Publication-Other-Watanabe et al. 2018                      | Measurement | True   
Cl                                         | 1                      |                                                             |             |        
Is small molecule                          | Yes                    |                                                             |             |        
Molecular weight                           | 393.91 g/mol           |                                                             |             |        
Plasma protein binding partner             | Albumin                |                                                             |             |        

#### Calculation methods

Name                    | Value                   
----------------------- | ------------------------
Partition coefficients  | Schmitt                 
Cellular permeabilities | Charge dependent Schmitt

#### Processes

##### Systemic Process: Total Hepatic Clearance-Assumption

Species: Human

###### Parameters

Name                          | Value              | Value Origin                                               
----------------------------- | ------------------ | -----------------------------------------------------------
Fraction unbound (experiment) | 0.0132             |                                                            
Lipophilicity (experiment)    | 6 Log Units        |                                                            
Plasma clearance              | 0 ml/min/kg        |                                                            
Specific clearance            | 8.5014115561 1/min | Parameter Identification-Parameter Identification-Optimized

##### Systemic Process: Glomerular Filtration-Pharmacokinetic panel study

Species: Human

###### Parameters

Name         |        Value | Value Origin                                               
------------ | ------------:| -----------------------------------------------------------
GFR fraction | 0.1294297124 | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Assumption (AS=3)

Molecule: CYP2D6

Metabolite: (Z)-3,4-Dihydroxy-deethyl-clomiphene

###### Parameters

Name                                        | Value                          | Value Origin                                               
------------------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 474.5 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018 - (E)-4-OH-clomiphene     
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein        | Unknown                                                    
Km                                          | 8.855527731 µmol/l             | Publication-In Vitro-Kröner 2018 - (E)-4-OH-clomiphene     
kcat                                        | 299.2603852 1/min              | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Assumption (AS=0)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                          | Value Origin                                               
------------------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 474.5 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018 - (E)-4-OH-clomiphene     
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein        | Unknown                                                    
Km                                          | 8.855527731 µmol/l             | Publication-In Vitro-Kröner 2018 - (E)-4-OH-clomiphene     
kcat                                        | 0 1/min                        | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Assumption (AS=0.5)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                          | Value Origin                                               
------------------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 474.5 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018 - (E)-4-OH-clomiphene     
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein        | Unknown                                                    
Km                                          | 8.855527731 µmol/l             | Publication-In Vitro-Kröner 2018 - (E)-4-OH-clomiphene     
kcat                                        | 36.83809632 1/min              | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Assumption (AS=0.75)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                          | Value Origin                                               
------------------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 474.5 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018 - (E)-4-OH-clomiphene     
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein        | Unknown                                                    
Km                                          | 8.855527731 µmol/l             | Publication-In Vitro-Kröner 2018 - (E)-4-OH-clomiphene     
kcat                                        | 48.47011666 1/min              | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Assumption (AS=1)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                          | Value Origin                                               
------------------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 474.5 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018 - (E)-4-OH-clomiphene     
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein        | Unknown                                                    
Km                                          | 8.855527731 µmol/l             | Publication-In Vitro-Kröner 2018 - (E)-4-OH-clomiphene     
kcat                                        | 107.3998919 1/min              | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Assumption (AS=2)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                          | Value Origin                                               
------------------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 474.5 pmol/min/mg mic. protein | Publication-In Vitro-Kröner 2018 - (E)-4-OH-clomiphene     
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein        | Unknown                                                    
Km                                          | 8.855527731 µmol/l             | Publication-In Vitro-Kröner 2018 - (E)-4-OH-clomiphene     
kcat                                        | 211.7132372293 1/min           | Parameter Identification-Parameter Identification-Optimized

## 3.2 Diagnostic plots<a id="32"></a>

The goodness-of-fit diagnostics combine all modeled compounds in one set of plots. Colors and symbols identify compounds consistently with the concentration-time profiles. Administration route, formulation, and model-building or verification status are not used to split the diagnostics.

<a id="table-3-1"></a>

**Table 3-1: GMFE for Observed versus simulated concentration-time data for all modeled compounds**

|Group                              |GMFE |
|:----------------------------------|:----|
|(E)-4-hydroxy-N-desethylclomiphene |1.56 |
|(E)-4-hydroxyclomiphene            |1.64 |
|(E)-clomiphene                     |1.44 |
|(E)-N-desethylclomiphene           |1.87 |
|All                                |1.59 |

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

The concentration-time profile sections show observed and simulated plasma concentrations for the CYP2D6 activity-score panel study and the external literature studies. The section split follows the scientific role of the data rather than the analyte split used for GOF diagnostics.

### 3.3.1 CYP2D6 DGI panel study<a id="331"></a>

The CYP2D6 DGI panel study includes parent and metabolite plasma concentration-time profiles after oral clomiphene citrate administration in CYP2D6 activity-score groups. These profiles are used to assess whether the model captures activity-score-dependent differences in parent-metabolite disposition.

<a id="figure-3-3"></a>

![](images/006_section_3/009_section_33/010_section_331/7_time_profile_plot_Clomiphene_IKP_AS_0__42_mg_po_s_d___n_6.png)

**Figure 3-3: Time Profile Analysis**

<br>
<br>

<a id="figure-3-4"></a>

![](images/006_section_3/009_section_33/010_section_331/8_time_profile_plot_Clomiphene_IKP_AS_0_5__42_mg_po_s_d___n_4.png)

**Figure 3-4: Time Profile Analysis**

<br>
<br>

<a id="figure-3-5"></a>

![](images/006_section_3/009_section_33/010_section_331/9_time_profile_plot_Clomiphene_IKP_AS_0_75__42_mg_po_s_d___n_1.png)

**Figure 3-5: Time Profile Analysis**

<br>
<br>

<a id="figure-3-6"></a>

![](images/006_section_3/009_section_33/010_section_331/10_time_profile_plot_Clomiphene_IKP_AS_1__42_mg_po_s_d___n_2.png)

**Figure 3-6: Time Profile Analysis**

<br>
<br>

<a id="figure-3-7"></a>

![](images/006_section_3/009_section_33/010_section_331/11_time_profile_plot_Clomiphene_IKP_AS_2__42_mg_po_s_d___n_3.png)

**Figure 3-7: Time Profile Analysis**

<br>
<br>

<a id="figure-3-8"></a>

![](images/006_section_3/009_section_33/010_section_331/12_time_profile_plot_Clomiphene_IKP_AS_3__42_mg_po_s_d___n_3.png)

**Figure 3-8: Time Profile Analysis**

<br>
<br>

### 3.3.2 Literature studies<a id="332"></a>

The literature study profiles include oral single-dose and multiple-dose (E)-clomiphene data. These profiles provide additional evaluation of parent-compound disposition across dosing conditions outside the CYP2D6 activity-score panel study.

<a id="figure-3-9"></a>

![](images/006_section_3/009_section_33/011_section_332/1_time_profile_plot_Clomiphene_Wiehle_2013__6_25_mg_po_m_d___n_16.png)

**Figure 3-9: Time Profile Analysis**

<br>
<br>

<a id="figure-3-10"></a>

![](images/006_section_3/009_section_33/011_section_332/2_time_profile_plot_Clomiphene_Wiehle_2013__12_5_mg_po_m_d___n_14.png)

**Figure 3-10: Time Profile Analysis**

<br>
<br>

<a id="figure-3-11"></a>

![](images/006_section_3/009_section_33/011_section_332/3_time_profile_plot_Clomiphene_Mikkelson_1986__21_mg_po_s_d_.png)

**Figure 3-11: Time Profile Analysis**

<br>
<br>

<a id="figure-3-12"></a>

![](images/006_section_3/009_section_33/011_section_332/4_time_profile_plot_Clomiphene_Miller_2019__21_mg_po_m_d___n_12.png)

**Figure 3-12: Time Profile Analysis**

<br>
<br>

<a id="figure-3-13"></a>

![](images/006_section_3/009_section_33/011_section_332/5_time_profile_plot_Clomiphene_Ratiopharm_1991__21_mg_po_s_d_.png)

**Figure 3-13: Time Profile Analysis**

<br>
<br>

<a id="figure-3-14"></a>

![](images/006_section_3/009_section_33/011_section_332/6_time_profile_plot_Clomiphene_Wiehle_2013__25_mg_po_m_d___n_16.png)

**Figure 3-14: Time Profile Analysis**

<br>
<br>

# 4 Conclusion<a id="4"></a>

The clomiphene PBPK model describes (E)-clomiphene, (E)-N-desethylclomiphene, (E)-4-hydroxyclomiphene and (E)-4-hydroxy-N-desethylclomiphene plasma concentration-time profiles in adults after oral administration. The model includes activity-score-dependent CYP2D6 metabolism and supports evaluation of CYP2D6 drug-gene effects across the available adult clinical studies.

Its use should remain limited to the represented adult oral studies and CYP2D6 activity-score settings. Interpretation is constrained by uncertainty in the contribution of non-CYP2D6 pathways, protein binding, and variability within an activity-score group. Genotype-specific refinement requires further paired parent-metabolite clinical data.

# 5 References<a id="5"></a>

[1] C Kovar, L Kovar, S Rüdesheim, D Selzer, B Ganchev, P Kröner, S Igel, R Kerb, E Schaeffeler, T E Mürdter, M Schwab, T Lehr. Prediction of Drug-Drug-Gene Interaction Scenarios of (E)-Clomiphene and Its Metabolites Using Physiologically Based Pharmacokinetic Modeling. Pharmaceutics, 2022;14:2604. doi: [10.3390/pharmaceutics14122604](https://doi.org/10.3390/pharmaceutics14122604).

[2] S Rüdesheim, H L H Loer, D Feick, F Z Marok, L M Fuhr, D Selzer, D Teutonico, A R P Schneider, J Solodenko, S Frechen, M van der Lee, D J A R Moes, J J Swen, M Schwab, T Lehr. A Comprehensive CYP2D6 Drug-Drug-Gene Interaction Network for Application in Precision Dosing and Drug Development. Clin Pharmacol Ther, 2025. doi: [10.1002/cpt.3604](https://doi.org/10.1002/cpt.3604).

[3] T J Mikkelson, P D Kroboth, W J Cameron, L W Dittert, V Chungi, P J Manberg. Single-dose pharmacokinetics of clomiphene citrate in normal volunteers. Fertil Steril, 1986;46:392-396. doi: [10.1016/S0015-0282(16)49574-9](https://doi.org/10.1016/S0015-0282(16)49574-9).

[4] Ratiopharm GmbH. Clomifen-ratiopharm 50 mg Tabletten, Fachinformation, 2016.

[5] R Wiehle, G R Cunningham, N Pitteloud, J Wike, K Hsu, G K Fontenot, M Rosner, A Dwyer, J Podolski. Testosterone Restoration by Enclomiphene Citrate in Men with Secondary Hypogonadism: Pharmacodynamics and Pharmacokinetics. BJU Int, 2013;112:1188-1200. doi: [10.1111/bju.12363](https://doi.org/10.1111/bju.12363).

[6] G D Miller, C Moore, V Nair, B Hill, S E Willick, A D Rogol, D Eichner. Hypothalamic-Pituitary-Testicular Axis Effects and Urinary Detection Following Clomiphene Administration in Males. J Clin Endocrinol Metab, 2019;104:906-914. doi: [10.1210/jc.2018-01159](https://doi.org/10.1210/jc.2018-01159).

[7] T E Mürdter, R Kerb, M Turpeinen, W Schroth, B Ganchev, G M Böhmer, S Igel, E Schaeffeler, U Zanger, H Brauch, M Schwab. Genetic polymorphism of cytochrome P450 2D6 determines oestrogen receptor activity of the major infertility drug clomiphene via its active metabolites. Hum Mol Genet, 2012;21:1145-1154. doi: [10.1093/hmg/ddr543](https://doi.org/10.1093/hmg/ddr543).

[8] P Kröner, J Zolk, T E Mürdter, M Schwab, T Lehr. Determination of clomiphene and active metabolites in human plasma by LC-MS/MS. Talanta, 2021;221:121658. doi: [10.1016/j.talanta.2020.121658](https://doi.org/10.1016/j.talanta.2020.121658).

[9] M Mazzarino, M Biava, X de la Torre, I Fiacco, F Botrè. Characterization of biotransformation pathways of clomiphene, tamoxifen and toremifene as assessed by LC-MS/(MS) following in vitro and excretion studies. Anal Bioanal Chem, 2013;405:5467-5487. doi: [10.1007/s00216-013-6961-7](https://doi.org/10.1007/s00216-013-6961-7).

[10] R Watanabe, T Esaki, H Kawashima, Y Natsume-Kitatani, C Nagao, R Ohashi, K Mizuguchi. Predicting Fraction Unbound in Human Plasma from Chemical Structure: Improved Accuracy in the Low Value Ranges. Mol Pharm, 2018;15:5302-5311. doi: [10.1021/acs.molpharmaceut.8b00785](https://doi.org/10.1021/acs.molpharmaceut.8b00785).

[11] W Schmitt. General approach for the calculation of tissue to plasma partition coefficients. Toxicol In Vitro, 2008;22:457-467. doi: [10.1016/j.tiv.2007.09.010](https://doi.org/10.1016/j.tiv.2007.09.010).

[12] T Rodgers, D Leahy, M Rowland. Physiologically based pharmacokinetic modeling 1: predicting the tissue distribution of moderate-to-strong bases. J Pharm Sci, 2005;94:1259-1276. doi: [10.1002/jps.20322](https://doi.org/10.1002/jps.20322).

[13] T Rodgers, M Rowland. Physiologically based pharmacokinetic modelling 2: predicting the tissue distribution of acids, very weak bases, neutrals and zwitterions. J Pharm Sci, 2006;95:1238-1257. doi: [10.1002/jps.20502](https://doi.org/10.1002/jps.20502).

[14] L M Berezhkovskiy. Volume of distribution at steady state for a linear pharmacokinetic system with peripheral elimination. J Pharm Sci, 2004;93:1628-1640. doi: [10.1002/jps.20073](https://doi.org/10.1002/jps.20073).

