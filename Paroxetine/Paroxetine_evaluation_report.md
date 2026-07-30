# Building and evaluation of a PBPK model for Paroxetine in CYP2D6 phenotype and activity-score groups

| Version                                         | evaluation-OSP12.2                                                   |
| ----------------------------------------------- | ------------------------------------------------------------ |
| based on *Model Snapshot* and *Evaluation Plan* | https://github.com/Open-Systems-Pharmacology/Paroxetine-Model/releases/tag/vevaluation |
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
   * [3.1 Paroxetine final input parameters](#31)
   * [3.2 Diagnostic plots](#32)
   * [3.3 Concentration-time profiles](#33)
     * [3.3.1 Model building](#331)
     * [3.3.2 Model verification](#332)
 * [4 Conclusion](#4)
 * [5 References](#5)

# 1 Introduction<a id="1"></a>

Paroxetine is a selective serotonin reuptake inhibitor used for the treatment of depression and other psychiatric indications. Paroxetine is administered orally and undergoes nonlinear metabolism, mainly via CYP2D6, with additional CYP3A4 metabolism and CYP2D6-independent hepatic clearance represented in the model.

The whole-body PBPK model published by [Rüdesheim 2022](#5) is intended to describe paroxetine plasma concentration-time profiles across CYP2D6 phenotype and activity-score groups and to support CYP2D6 drug-gene interaction simulations.

This whole-body PBPK model of paroxetine has been developed using published pharmacokinetic clinical data by [Lund 1982](#5), [Belle 2002](#5), [Massaroti 2005](#5), [Mürdter 2016](#5), [Sindrup 1992](#5), and [Yoon 2000](#5). The clinical data included intravenous infusion, immediate-release oral dosing, tablet dosing, controlled-release oral dosing, and repeated dosing across a dose range of 20 to 70 mg paroxetine. The model was then evaluated with clinical studies including [Calvo 2004](#5), [Chen 2015](#5), [McClelland 1984](#5), [Schoedel 2012](#5), [Segura 2005](#5), [van der Lee 2007](#5), [Yasui-Furukori 2006](#5), [Yasui-Furukori 2007](#5), [Mürdter 2016](#5), and [Yoon 2000](#5).

The presented model includes the following features:

- CYP2D6-mediated metabolism with activity-score specific k<sub>cat</sub> values,
- CYP3A4-mediated metabolism,
- unspecific hepatic clearance,
- renal filtration with a GFR fraction of 1,
- intravenous infusion, immediate-release oral, tablet, and controlled-release oral applications.

# 2 Methods<a id="2"></a>

## 2.1 Modeling strategy<a id="21"></a>

The general concept of building a PBPK model has previously been described by Kuepfer et al. ([Kuepfer 2016](#5)). Relevant information on anthropometric (height, weight) and physiological parameters (e.g. blood flows, organ volumes, binding protein concentrations, hematocrit, cardiac output) in adults was gathered from the literature and has been previously published ([Willmann 2007](#5)). The information was incorporated into PK-Sim® and was used as default values for the simulations in adults.

The applied activity and variability of plasma proteins and active processes that are integrated into PK-Sim® are described in the publicly available PK-Sim® Ontogeny Database Version 7.3 ([PK-Sim Ontogeny Database Version 7.3](#5)) or otherwise referenced for the specific process.

The paroxetine base model was developed sequentially. Model-building data from intravenous paroxetine administration in [Lund 1982](#5) supported the selection of partition-coefficient and cellular-permeability calculation methods. Oral single-dose and multiple-dose data from [Lund 1982](#5), [Belle 2002](#5), [Massaroti 2005](#5), [Sindrup 1992](#5), [Mürdter 2016](#5), and [Yoon 2000](#5) informed oral absorption, CYP2D6-independent metabolism, and CYP2D6-mediated metabolism.

Oral solution and tablet applications were used for immediate-release dosing, while controlled-release oral applications were represented with Weibull dissolution parameters based on controlled-release formulation data. The model contains CYP2D6 and CYP3A4 as active metabolic processes, an unspecific hepatic clearance process, renal filtration, and mechanism-based inhibition processes for CYP2D6 and CYP3A4.

For the CYP2D6 drug-gene interaction model, CYP2D6-dependent clearance was represented with Michaelis-Menten kinetics. CYP2D6 k<sub>cat</sub> values were optimized for activity score 2 and set to zero for poor metabolizers, while other activity-score k<sub>cat</sub> values were calculated from a polynomial regression derived from metoprolol and dextromethorphan models. CYP2D6 K<sub>m</sub> and CYP2D6 reference concentrations were kept constant over the modeled activity-score range.

Details about the input data are provided in Section 2.2. Details about the structural model and assumptions are provided in Section 2.3.

## 2.2 Data used<a id="22"></a>

### In vitro and physicochemical data

The table below summarizes the drug-dependent inputs documented for the paroxetine model.

| Parameter | Unit | Value | Source | Description |
| --- | ---: | ---: | --- | --- |
| MW | g/mol | 329.37 | [Zhong 2013](#5) | Molecular weight. |
| pK<sub>a</sub>,base | - | 9.9 | [Agrawal 2013](#5) | pKa of a basic ionization site. |
| Solubility | mg/mL | 7.31 | [Khatavkar 2016](#5) | Aqueous solubility at pH 4.5. |
| logP | - | 3.95 | [Agrawal 2013](#5) | Octanol-water partition coefficient of the neutral species. |
| f<sub>u</sub> | % | 4.873 | Optimized; [Kaye 1989](#5) | Fraction unbound in plasma. |
| K<sub>m,CYP3A4</sub> | µmol/L | 4.7 | [Jornil 2010](#5) | Michaelis constant for CYP3A4-mediated metabolism. |
| k<sub>cat,CYP3A4</sub> | 1/min | 1.01 | Optimized; [Jornil 2010](#5) | Catalytic rate constant for CYP3A4-mediated metabolism. |
| K<sub>m,CYP2D6</sub> | µmol/L | 0.028 | [Jornil 2010](#5) | Activity-score-invariant Michaelis constant for CYP2D6-mediated metabolism. |
| k<sub>cat,CYP2D6</sub>, EM | 1/min | 1.3693020782 | Optimized; [Jornil 2010](#5) | Catalytic rate constant for the extensive-metabolizer pathway. |
| k<sub>cat,CYP2D6</sub>, PM | 1/min | 0 | Assumed; [Jornil 2010](#5) | Catalytic rate constant for the poor-metabolizer pathway. |
| CL<sub>hep</sub> | 1/min | 2.2538632474<sup>c</sup> | Optimized; [Jornil 2010](#5) | CYP2D6-independent hepatic clearance. |
| K<sub>i,CYP2D6</sub> | µmol/L | 0.16738 | Optimized; [Venkatakrishnan 2005](#5) | Inhibition constant for mechanism-based CYP2D6 inhibition. |
| k<sub>inact,CYP2D6</sub> | 1/min | 0.17 | [Venkatakrishnan 2005](#5) | Maximum CYP2D6 inactivation rate constant. |
| K<sub>i,CYP3A4</sub> | µmol/L | 4.48 | [Bertelsen 2003](#5) | Inhibition constant for mechanism-based CYP3A4 inhibition. |
| k<sub>inact,CYP3A4</sub> | 1/min | 0.011 | [Bertelsen 2003](#5) | Maximum CYP3A4 inactivation rate constant. |
| GFR fraction | - | 1 | Assumed | Fraction used to scale passive glomerular filtration. |
| Weibull shape | - | 7.17 | Optimized | Shape parameter for controlled-release dissolution. |
| t<sub>50</sub> | min | 276.35 | Optimized; [Chen 2015](#5); [Khatavkar 2013](#5) | Time to dissolve 50% of the controlled-release dose. |
| Partition coefficients | - | Rodgers and Rowland | Calculated; [Rodgers 2007](#5) | Tissue-to-plasma partition coefficients calculated with the Rodgers and Rowland method. |
| Cellular permeabilities | - | PK-Sim Standard | Calculated | Cellular permeabilities calculated with the PK-Sim Standard method. |
| P<sub>int</sub> | cm/min | 3.93 × 10<sup>−5</sup> | Optimized | Specific transcellular intestinal permeability. |

**Table 1:**<a name="table-1"></a> Drug-dependent physicochemical, distribution, metabolism, elimination, inhibition, and formulation parameters used in the final paroxetine model.

<sup>c</sup> The optimized snapshot value is retained. The supplement to [Rüdesheim 2022](#5) reports 1.37 1/min.

The CYP2D6 activity-score-specific catalytic rate constants implemented in the model are listed below.

| CYP2D6 AS | k<sub>cat</sub> [1/min] | Origin |
| ---: | ---: | --- |
| 0 | 0.00 | Assumed |
| 0.5 | 0.66 | Calculated |
| 0.75 | 1.08 | Calculated |
| 1 | 1.56 | Calculated |
| 1.25 | 2.11 | Calculated |
| 1.5 | 2.71 | Calculated |
| 2 | 4.09 | Optimized |
| 3 | 7.58 | Calculated |

**Table 1a:**<a name="table-1a"></a> CYP2D6 activity-score-specific k<sub>cat</sub> values for paroxetine metabolism from Table 2 of [Rüdesheim 2022](#5). The AS = 2 value was optimized, AS = 0 was assumed to have no CYP2D6 activity, and the other implemented values were calculated from the relative activity scale. AS: activity score.

### Clinical data

The evaluation uses 33 plasma concentration-time profiles from adults ([Table 2](#table-2)). Fourteen profiles were used for model building and 19 profiles were used for model verification. The assignments follow the training and test classifications in the published model supplement. For interaction studies, this report includes only paroxetine-only or control-arm pharmacokinetic data.

| Source | Dose [mg] / schedule\* | Age [years] | Weight [kg] | Sex | N | Form. | CYP2D6 characterization |
| --- | --- | --- | --- | --- | ---: | --- | --- |
| [Belle 2002](#5)<sup>+</sup> | 20 q.d., 12 days | 38 (20–49) | NR | 23% female | 22 | Tablet | EM |
| [Calvo 2004](#5) | 20 q.d., 15 doses | 26 | 64 | 64% female | 25 | NR | EM |
| [Chen 2015](#5) | 25 | 26 (19–45) | 64 | 25% female | 4 | Tablet CR | AS = 0.5 (IM) |
| [Chen 2015](#5) | 25 | 26 (19–45) | 61 | 45% female | 11 | Tablet CR | AS = 1 (IM) |
| [Chen 2015](#5) | 25 | 22 (19–45) | 58 | 60% female | 5 | Tablet CR | AS = 1.5 (NM) |
| [Chen 2015](#5) | 25 | 28 (19–45) | 61 | 25% female | 4 | Tablet CR | AS = 2 (NM) |
| [Lund 1982](#5)<sup>+</sup> | 23, intravenous infusion | 29 | 72 | Male | 1 | Solution | EM |
| [Lund 1982](#5)<sup>+</sup> | 28, intravenous infusion | 28 | 75 | Male | 1 | Solution | EM |
| [Lund 1982](#5)<sup>+</sup> | 28, intravenous infusion | 24 | 66 | Male | 1 | Solution | EM |
| [Lund 1982](#5)<sup>+</sup> | 28, intravenous infusion | 26 | 88 | Male | 1 | Solution | EM |
| [Lund 1982](#5)<sup>+</sup> | 45 | 28 | 75 | Male | 1 | NR | EM |
| [Lund 1982](#5)<sup>+</sup> | 45 | 24 | 66 | Male | 1 | NR | EM |
| [Lund 1982](#5)<sup>+</sup> | 45 | 26 | 88 | Male | 1 | NR | EM |
| [Lund 1982](#5)<sup>+</sup> | 45 | 29 | 72 | Male | 1 | NR | EM |
| [Massaroti 2005](#5)<sup>+</sup> | 20 | 28 (18–42) | 72 (57–87) | Male | 28 | Tablet | EM |
| [McClelland 1984](#5) | 70 | 31 (22–44) | NR | Male | 5 | NR | EM |
| [Mürdter 2016](#5) | 40 q.d., 3 days | 25 (22–26) | 62 (50–70) | Female | 3 | Tablet | AS = 0 (PM) |
| [Mürdter 2016](#5) | 40 q.d., 3 days | 24 (21–29) | 59 (56–64) | Female | 4 | Tablet | AS = 0.5 (IM) |
| [Mürdter 2016](#5) | 40 q.d., 3 days | 25 | 68 | Female | 1 | Tablet | AS = 0.75 (IM) |
| [Mürdter 2016](#5) | 40 q.d., 3 days | 26 (23–28) | 67 (64–74) | Female | 2 | Tablet | AS = 1 (IM) |
| [Mürdter 2016](#5)<sup>+</sup> | 40 q.d., 3 days | 32 (26–43) | 57 (48–64) | Female | 3 | Tablet | AS = 2 (NM) |
| [Mürdter 2016](#5) | 40 q.d., 3 days | 26 (22–28) | 62 (54–73) | Female | 3 | Tablet | AS = 3 (UM) |
| [Schoedel 2012](#5) | 20 q.d., 12 days | 34 (19–55) | 75 | 14% female | 14 | NR | EM |
| [Segura 2005](#5) | 20 q.d., 2 days | 23 | 65 | Male | 7 | Tablet | EM |
| [Sindrup 1992](#5)<sup>+</sup> | 30 q.d., 14 doses | 24 (20–30) | 73 (65–81) | Male | 9 | Tablet | EM |
| [Sindrup 1992](#5)<sup>+</sup> | 30 q.d., 14 doses | 27 (23–39) | 82 (68–95) | Male | 8 | Tablet | PM |
| [van der Lee 2007](#5) | 20 q.d., 10 days | 44 (18–64) | 69 (51–89) | 69% female | 26 | Tablet | EM |
| [Yasui-Furukori 2006](#5) | 20 | 25 (20–35) | 58 (46–75) | 25% female | 12 | NR | AS = 1.25 (NM) |
| [Yasui-Furukori 2007](#5) | 20 | 24 (21–35) | 57 (45–67) | 23% female | 13 | NR | EM |
| [Yoon 2000](#5) | 40 | 21 | 58 | Female | 1 | Tablet | AS = 0 (PM) |
| [Yoon 2000](#5) | 40 | 22 | 68 | Male | 3 | Tablet | AS = 0.5 (IM) |
| [Yoon 2000](#5) | 40 | 22 | 67 | Male | 6 | Tablet | AS = 1.25 (NM) |
| [Yoon 2000](#5)<sup>+</sup> | 40 | 23 | 59 | 17% female | 6 | Tablet | AS = 2 (NM) |

**Table 2:**<a name="table-2"></a> Clinical paroxetine concentration-time profiles used for model building and verification. \*: Single oral dose unless otherwise specified; AS: activity score; CR: controlled release; EM: extensive metabolizer; IM: intermediate metabolizer; NM: normal metabolizer; NR: not reported; PM: poor metabolizer; PT: predicted phenotype; q.d.: once daily; UM: ultrarapid metabolizer; <sup>+</sup>: data used for model building. Parenthetical PTs for AS-coded rows use the current CPIC CYP2D6 activity score-to-phenotype mapping ([Moore 2026](#5)). EM is the model default when study-specific CYP2D6 information is not available.

## 2.3 Model parameters and assumptions<a id="23"></a>

### Absorption

The model includes intravenous infusion, immediate-release oral solution, oral tablet, and controlled-release oral applications. Intravenous simulations do not require an absorption process. Oral-solution and tablet simulations are represented with dissolved formulation input, while controlled-release simulations use a Weibull tablet formulation.

The value for `Specific intestinal permeability` and the solubility at pH 4.5 are summarized in Section 2.2.1. The controlled-release formulation is described by the `CR Weibull shape` and `CR Weibull time` parameters.

### Distribution

Paroxetine is highly bound to plasma proteins. The literature starting value for `Fraction unbound (plasma, reference value)` was 5.00% ([Kaye 1989](#5)). The value was optimized to 4.873% in the PBPK model.

An important parameter influencing the resulting volume of distribution is lipophilicity. A `Lipophilicity` value of 3.95 was used in the model as summarized in Section 2.2.1.

Partition coefficients were calculated with the Rodgers and Rowland method. Cellular permeabilities were calculated with the PK-Sim Standard method.

### Metabolism and elimination

Two metabolic pathways and one residual hepatic clearance process were implemented into the model.

* CYP2D6

CYP2D6 metabolism is represented by Michaelis-Menten kinetics. Activity-score-dependent k<sub>cat</sub> values are implemented as separate CYP2D6 processes. The extensive-metabolizer k<sub>cat</sub> was optimized, the poor-metabolizer value was set to zero, and other activity-score values were calculated from the regression described by [Rüdesheim 2022](#5).

* CYP3A4

CYP3A4 metabolism is represented by Michaelis-Menten kinetics using the K<sub>m</sub> and k<sub>cat</sub> values summarized in Section 2.2.1.

* Unspecific hepatic clearance

The model contains optimized unspecific hepatic clearance as summarized in Section 2.2.1.

Additionally, renal filtration is represented with a `GFR fraction` of 1. Mechanism-based inhibition processes for CYP2D6 and CYP3A4 are included using the K<sub>i</sub> and k<sub>inact</sub> values summarized in Section 2.2.1.

# 3 Results and Discussion<a id="3"></a>

The PBPK model for paroxetine was developed and verified with clinical pharmacokinetic data after intravenous and oral administration. The evaluation covers immediate-release and controlled-release applications, single-dose and repeated-dose regimens, and a dose range of 20 to 70 mg. The clinical dataset also includes CYP2D6 poor-metabolizer, extensive-metabolizer, and activity-score stratified groups, which are central to the intended use of the model.

The model was built with data supporting distribution, oral absorption, CYP2D6-dependent clearance, CYP2D6-independent clearance, and controlled-release dissolution. Intravenous data from [Lund 1982](#5) supported systemic disposition independent of oral absorption. Oral data from [Belle 2002](#5), [Massaroti 2005](#5), [Mürdter 2016](#5), [Sindrup 1992](#5), and [Yoon 2000](#5) supported oral absorption, repeated-dose behavior, and CYP2D6 activity-score-dependent clearance. Verification used independent immediate-release and controlled-release oral studies, including [Chen 2015](#5), [McClelland 1984](#5), [Schoedel 2012](#5), [Segura 2005](#5), [van der Lee 2007](#5), and [Yasui-Furukori 2006](#5).

The model quantifies CYP2D6- and CYP3A4-mediated metabolism, unspecific hepatic clearance, and passive renal filtration. The CYP2D6 activity-score implementation is the major driver for differences between poor-, intermediate-, extensive-, and higher-activity groups. CYP3A4 metabolism and unspecific hepatic clearance provide additional clearance capacity.

The next sections show:

1. the final model input parameters for the building blocks: [Section 3.1](#31).
2. the overall goodness of fit: [Section 3.2](#32).
3. simulated vs. observed concentration-time profiles for the clinical studies used for model building and for model verification: [Section 3.3](#33).

The concentration-time profiles should be interpreted by study context. Intravenous profiles mainly test distribution and systemic clearance. Immediate-release oral profiles test the combined absorption and first-pass components. Controlled-release profiles additionally test the Weibull dissolution parameters. CYP2D6 poor-metabolizer and low-activity-score profiles are particularly informative for CYP2D6-independent clearance.

## 3.1 Paroxetine final input parameters<a id="31"></a>

The following tables summarize the final input parameters for paroxetine. Interpret optimized parameters together with the sources in [Section 2.2](#22) and the assumptions in [Section 2.3](#23).

### Compound: Paroxetine

#### Parameters

Name                                             | Value           | Value Origin                                                | Alternative             | Default
------------------------------------------------ | --------------- | ----------------------------------------------------------- | ----------------------- | -------
Solubility at reference pH                       | 7.31 mg/ml      | Publication-In Vitro-Khatavkar et al. 2013                  | Khatavkar 2013 (pH 4.5) | True   
Reference pH                                     | 4.5             | Publication-In Vitro-Khatavkar et al. 2013                  | Khatavkar 2013 (pH 4.5) | True   
Lipophilicity                                    | 3.95 Log Units  | Publication-Other-Agrawal 2013                              | optimized               | True   
Lipophilicity                                    | 3.95 Log Units  |                                                             | Agrawal 2013            | False  
Lipophilicity                                    | 3.15 Log Units  |                                                             | ChemAxon                | False  
Lipophilicity                                    | 3.4 Log Units   |                                                             | Zhong 2014              | False  
Fraction unbound (plasma, reference value)       | 0.0487321988    | Parameter Identification-Parameter Identification-Optimized | Optimized               | True   
Specific intestinal permeability (transcellular) | 3.93E-05 cm/min | Parameter Identification-Parameter Identification-Optimized | Optimized               | True   
F                                                | 1               |                                                             |                         |        
Is small molecule                                | Yes             |                                                             |                         |        
Molecular weight                                 | 329.37 g/mol    |                                                             |                         |        
Plasma protein binding partner                   | Albumin         |                                                             |                         |        

#### Calculation methods

Name                    | Value              
----------------------- | -------------------
Partition coefficients  | Rodgers and Rowland
Cellular permeabilities | PK-Sim Standard    

#### Processes

##### Metabolizing Enzyme: CYP2D6-Jornil 2010

Molecule: CYP2D6

###### Parameters

Name                             | Value                         | Value Origin                                               
-------------------------------- | ----------------------------- | -----------------------------------------------------------
In vitro Vmax/recombinant enzyme | 9.7 pmol/min/pmol rec. enzyme | Publication-In Vitro-Jornil et al. 2010                    
Km                               | 0.028 µmol/l                  | Publication-In Vitro-Jornil et al. 2010                    
kcat                             | 1.3693020782 1/min            | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP3A4-Jornil 2010

Molecule: CYP3A4

###### Parameters

Name                             | Value                          | Value Origin                                               
-------------------------------- | ------------------------------ | -----------------------------------------------------------
In vitro Vmax/recombinant enzyme | 5.32 pmol/min/pmol rec. enzyme | Publication-In Vitro-Jornil et al. 2010                    
Km                               | 4.7 µmol/l                     | Publication-In Vitro-Jornil et al. 2010                    
kcat                             | 1.01 1/min                     | Parameter Identification-Parameter Identification-Optimized

##### Systemic Process: Glomerular Filtration-Assumption

Species: Human

###### Parameters

Name         | Value | Value Origin                                          
------------ | -----:| ------------------------------------------------------
GFR fraction |     1 | Other-Assumption-Assumed in Supplementary Table S2.1.1

##### Inhibition: CYP2D6-Obach, 2007

Molecule: CYP2D6

###### Parameters

Name          | Value          | Value Origin                                               
------------- | -------------- | -----------------------------------------------------------
kinact        | 0.17 1/min     | Publication-In Vitro-Obach et al. 2007                     
K_kinact_half | 0.16738 µmol/l | Parameter Identification-Parameter Identification-Optimized

##### Inhibition: CYP3A4-Obach 2007

Molecule: CYP3A4

###### Parameters

Name          | Value       | Value Origin                          
------------- | ----------- | --------------------------------------
kinact        | 0.011 1/min | Publication-In Vitro-Obach et al. 2007
K_kinact_half | 4.48 µmol/l | Publication-In Vitro-Obach et al. 2007

##### Metabolizing Enzyme: CYP2D6-AS=2

Molecule: CYP2D6

###### Parameters

Name                             | Value                         | Value Origin                           
-------------------------------- | ----------------------------- | ---------------------------------------
In vitro Vmax/recombinant enzyme | 9.7 pmol/min/pmol rec. enzyme |                                        
Km                               | 0.028 µmol/l                  | Publication-In Vitro-Jornil et al. 2010
kcat                             | 4.09 1/min                    | Other-Manual Fit                       

##### Metabolizing Enzyme: CYP2D6-AS=1.5

Molecule: CYP2D6

###### Parameters

Name                             | Value                         | Value Origin                           
-------------------------------- | ----------------------------- | ---------------------------------------
In vitro Vmax/recombinant enzyme | 9.7 pmol/min/pmol rec. enzyme |                                        
Km                               | 0.028 µmol/l                  | Publication-In Vitro-Jornil et al. 2010
kcat                             | 2.71 1/min                    | Other-Manual Fit-AS Model              

##### Metabolizing Enzyme: CYP2D6-AS=1.25

Molecule: CYP2D6

###### Parameters

Name                             | Value                         | Value Origin                           
-------------------------------- | ----------------------------- | ---------------------------------------
In vitro Vmax/recombinant enzyme | 9.7 pmol/min/pmol rec. enzyme |                                        
Km                               | 0.028 µmol/l                  | Publication-In Vitro-Jornil et al. 2010
kcat                             | 2.11 1/min                    | Other-Manual Fit-AS-Model              

##### Metabolizing Enzyme: CYP2D6-AS=1

Molecule: CYP2D6

###### Parameters

Name                             | Value                         | Value Origin                           
-------------------------------- | ----------------------------- | ---------------------------------------
In vitro Vmax/recombinant enzyme | 9.7 pmol/min/pmol rec. enzyme |                                        
Km                               | 0.028 µmol/l                  | Publication-In Vitro-Jornil et al. 2010
kcat                             | 1.56 1/min                    | Other-Manual Fit-AS Model              

##### Metabolizing Enzyme: CYP2D6-AS=0.5

Molecule: CYP2D6

###### Parameters

Name                             | Value                         | Value Origin                           
-------------------------------- | ----------------------------- | ---------------------------------------
In vitro Vmax/recombinant enzyme | 9.7 pmol/min/pmol rec. enzyme |                                        
Km                               | 0.028 µmol/l                  | Publication-In Vitro-Jornil et al. 2010
kcat                             | 0.66 1/min                    | Other-Manual Fit-AS Model              

##### Metabolizing Enzyme: CYP2D6-AS=0

Molecule: CYP2D6

###### Parameters

Name                             | Value                         | Value Origin
-------------------------------- | ----------------------------- | ------------
In vitro Vmax/recombinant enzyme | 9.7 pmol/min/pmol rec. enzyme |             
Km                               | 0.028 µmol/l                  |             
kcat                             | 0 1/min                       | Unknown     

##### Metabolizing Enzyme: CYP2D6-AS=3

Molecule: CYP2D6

###### Parameters

Name                             | Value                         | Value Origin                           
-------------------------------- | ----------------------------- | ---------------------------------------
In vitro Vmax/recombinant enzyme | 9.7 pmol/min/pmol rec. enzyme |                                        
Km                               | 0.028 µmol/l                  | Publication-In Vitro-Jornil et al. 2010
kcat                             | 7.58 1/min                    | Other-Manual Fit-AS Model              

##### Metabolizing Enzyme: CYP2D6-AS=0.75

Molecule: CYP2D6

###### Parameters

Name                             | Value                         | Value Origin                           
-------------------------------- | ----------------------------- | ---------------------------------------
In vitro Vmax/recombinant enzyme | 9.7 pmol/min/pmol rec. enzyme |                                        
Km                               | 0.028 µmol/l                  | Publication-In Vitro-Jornil et al. 2010
kcat                             | 1.08 1/min                    | Other-Manual Fit-AS Model              

##### Systemic Process: Total Hepatic Clearance-Assumption

Species: Human

###### Parameters

Name                          | Value              | Value Origin                                               
----------------------------- | ------------------ | -----------------------------------------------------------
Fraction unbound (experiment) | 0.0487321988       |                                                            
Lipophilicity (experiment)    | 3.95 Log Units     |                                                            
Plasma clearance              | 0 ml/min/kg        |                                                            
Specific clearance            | 2.2538632474 1/min | Parameter Identification-Parameter Identification-Optimized

## 3.2 Diagnostic plots<a id="32"></a>

The goodness-of-fit diagnostics combine all paroxetine observations in one set of plots. The plot does not split model-building and model-verification observations. Use the concentration-time profile sections for that comparison.

<a id="table-3-1"></a>

**Table 3-1: GMFE for Paroxetine goodness-of-fit diagnostics**

|Group      |GMFE |
|:----------|:----|
|Paroxetine |1.46 |

<br>
<br>

<a id="figure-3-1"></a>

![](images/006_section_3/008_section_32/2_gof_plot_predictedVsObserved.png)

**Figure 3-1: Paroxetine goodness-of-fit diagnostics**

<br>
<br>

<a id="figure-3-2"></a>

![](images/006_section_3/008_section_32/3_gof_plot_residualsOverTime.png)

**Figure 3-2: Paroxetine goodness-of-fit diagnostics**

<br>
<br>

## 3.3 Concentration-time profiles<a id="33"></a>

Simulated versus observed concentration-time profiles of all data listed in [Section 2.2.2](#22) are presented below.

### 3.3.1 Model building<a id="331"></a>

The concentration-time profiles in this section show the clinical study arms used for model building. These profiles support assessment of systemic disposition, oral absorption, repeated-dose behavior, and CYP2D6 activity-score-dependent paroxetine exposure.

<a id="figure-3-3"></a>

![](images/006_section_3/009_section_33/010_section_331/1_time_profile_plot_Paroxetine_Belle__2002____paroxetine_hydrochloride__20_mg__po__md__n_22__EM_.png)

**Figure 3-3: Belle 2002: paroxetine hydrochloride, 20 mg, po, md, n=22 (EM)**

<br>
<br>

<a id="figure-3-4"></a>

![](images/006_section_3/009_section_33/010_section_331/2_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__23_mg__iv__n_1__EM___D.png)

**Figure 3-4: Lund 1982: paroxetine hydrochloride, 23 mg, iv, n=1 (EM), D**

<br>
<br>

<a id="figure-3-5"></a>

![](images/006_section_3/009_section_33/010_section_331/3_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__28_mg__iv__n_1__EM___A.png)

**Figure 3-5: Lund 1982: paroxetine hydrochloride, 28 mg, iv, n=1 (EM), A**

<br>
<br>

<a id="figure-3-6"></a>

![](images/006_section_3/009_section_33/010_section_331/4_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__28_mg__iv__n_1__EM___B.png)

**Figure 3-6: Lund 1982: paroxetine hydrochloride, 28 mg, iv, n=1 (EM), B**

<br>
<br>

<a id="figure-3-7"></a>

![](images/006_section_3/009_section_33/010_section_331/5_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__28_mg__iv__n_1__EM___C.png)

**Figure 3-7: Lund 1982: paroxetine hydrochloride, 28 mg, iv, n=1 (EM), C**

<br>
<br>

<a id="figure-3-8"></a>

![](images/006_section_3/009_section_33/010_section_331/6_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__45_mg__po__n_1__EM___A.png)

**Figure 3-8: Lund 1982: paroxetine hydrochloride, 45 mg, po, n=1 (EM), A**

<br>
<br>

<a id="figure-3-9"></a>

![](images/006_section_3/009_section_33/010_section_331/7_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__45_mg__po__n_1__EM___B.png)

**Figure 3-9: Lund 1982: paroxetine hydrochloride, 45 mg, po, n=1 (EM), B**

<br>
<br>

<a id="figure-3-10"></a>

![](images/006_section_3/009_section_33/010_section_331/8_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__45_mg__po__n_1__EM___C.png)

**Figure 3-10: Lund 1982: paroxetine hydrochloride, 45 mg, po, n=1 (EM), C**

<br>
<br>

<a id="figure-3-11"></a>

![](images/006_section_3/009_section_33/010_section_331/9_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__45_mg__po__n_1__EM___D.png)

**Figure 3-11: Lund 1982: paroxetine hydrochloride, 45 mg, po, n=1 (EM), D**

<br>
<br>

<a id="figure-3-12"></a>

![](images/006_section_3/009_section_33/010_section_331/10_time_profile_plot_Paroxetine_Massaroti__2005____paroxetine_hydrochloride__20_mg__po__n_28__EM_.png)

**Figure 3-12: Massaroti 2005: paroxetine hydrochloride, 20 mg, po, n=28 (EM)**

<br>
<br>

<a id="figure-3-13"></a>

![](images/006_section_3/009_section_33/010_section_331/11_time_profile_plot_Paroxetine_Murdter__2016____paroxetine_hydrochloride__40_mg__po__md__n_3__AS_2_.png)

**Figure 3-13: Mürdter 2016: paroxetine hydrochloride, 40 mg, po, md, n=3 (AS=2)**

<br>
<br>

<a id="figure-3-14"></a>

![](images/006_section_3/009_section_33/010_section_331/12_time_profile_plot_Paroxetine_Sindrup__1992____paroxetine_hydrochloride__30_mg__po__md__n_9__EM_.png)

**Figure 3-14: Sindrup 1992: paroxetine hydrochloride, 30 mg, po, md, n=9 (EM)**

<br>
<br>

<a id="figure-3-15"></a>

![](images/006_section_3/009_section_33/010_section_331/13_time_profile_plot_Paroxetine_Sindrup__1992____paroxetine_hydrochloride__30_mg__po__md__n_8__PM_.png)

**Figure 3-15: Sindrup 1992: paroxetine hydrochloride, 30 mg, po, md, n=8 (PM)**

<br>
<br>

<a id="figure-3-16"></a>

![](images/006_section_3/009_section_33/010_section_331/14_time_profile_plot_Paroxetine_Yoon__2000____paroxetine_hydrochloride__40_mg__po__n_6__AS_2_.png)

**Figure 3-16: Yoon 2000: paroxetine hydrochloride, 40 mg, po, n=6 (AS=2)**

<br>
<br>

### 3.3.2 Model verification<a id="332"></a>

The concentration-time profiles in this section show independent clinical study arms used for model verification. These profiles support assessment of model performance across additional oral dosing regimens, formulations, and CYP2D6 activity-score groups.

<a id="figure-3-17"></a>

![](images/006_section_3/009_section_33/011_section_332/15_time_profile_plot_Paroxetine_Calvo__2004____paroxetine_hydrochloride__20_mg__po__md__n_25__EM_.png)

**Figure 3-17: Calvo 2004: paroxetine hydrochloride, 20 mg, po, md, n=25 (EM)**

<br>
<br>

<a id="figure-3-18"></a>

![](images/006_section_3/009_section_33/011_section_332/16_time_profile_plot_Paroxetine_Chen__2015____paroxetine_hydrochloride__25_mg__po__n_4__AS_0_5_.png)

**Figure 3-18: Chen 2015: paroxetine hydrochloride, 25 mg, po, n=4 (AS=0.5)**

<br>
<br>

<a id="figure-3-19"></a>

![](images/006_section_3/009_section_33/011_section_332/17_time_profile_plot_Paroxetine_Chen__2015____paroxetine_hydrochloride__25_mg__po__n_11__AS_1_.png)

**Figure 3-19: Chen 2015: paroxetine hydrochloride, 25 mg, po, n=11 (AS=1)**

<br>
<br>

<a id="figure-3-20"></a>

![](images/006_section_3/009_section_33/011_section_332/18_time_profile_plot_Paroxetine_Chen__2015____paroxetine_hydrochloride__25_mg__po__n_5__AS_1_5_.png)

**Figure 3-20: Chen 2015: paroxetine hydrochloride, 25 mg, po, n=5 (AS=1.5)**

<br>
<br>

<a id="figure-3-21"></a>

![](images/006_section_3/009_section_33/011_section_332/19_time_profile_plot_Paroxetine_Chen__2015____paroxetine_hydrochloride__25_mg__po__n_4__AS_2_.png)

**Figure 3-21: Chen 2015: paroxetine hydrochloride, 25 mg, po, n=4 (AS=2)**

<br>
<br>

<a id="figure-3-22"></a>

![](images/006_section_3/009_section_33/011_section_332/20_time_profile_plot_Paroxetine_McClelland__1984____paroxetine_hydrochloride__70_mg__po__n_5__EM_.png)

**Figure 3-22: McClelland 1984: paroxetine hydrochloride, 70 mg, po, n=5 (EM)**

<br>
<br>

<a id="figure-3-23"></a>

![](images/006_section_3/009_section_33/011_section_332/21_time_profile_plot_Paroxetine_Murdter__2016____paroxetine_hydrochloride__40_mg__po__md__n_3__AS_0_.png)

**Figure 3-23: Mürdter 2016: paroxetine hydrochloride, 40 mg, po, md, n=3 (AS=0)**

<br>
<br>

<a id="figure-3-24"></a>

![](images/006_section_3/009_section_33/011_section_332/22_time_profile_plot_Paroxetine_Murdter__2016____paroxetine_hydrochloride__40_mg__po__md__n_4__AS_0_5_.png)

**Figure 3-24: Mürdter 2016: paroxetine hydrochloride, 40 mg, po, md, n=4 (AS=0.5)**

<br>
<br>

<a id="figure-3-25"></a>

![](images/006_section_3/009_section_33/011_section_332/23_time_profile_plot_Paroxetine_Murdter__2016____paroxetine_hydrochloride__40_mg__po__md__n_1__AS_0_75_.png)

**Figure 3-25: Mürdter 2016: paroxetine hydrochloride, 40 mg, po, md, n=1 (AS=0.75)**

<br>
<br>

<a id="figure-3-26"></a>

![](images/006_section_3/009_section_33/011_section_332/24_time_profile_plot_Paroxetine_Murdter__2016____paroxetine_hydrochloride__40_mg__po__md__n_2__AS_1_.png)

**Figure 3-26: Mürdter 2016: paroxetine hydrochloride, 40 mg, po, md, n=2 (AS=1)**

<br>
<br>

<a id="figure-3-27"></a>

![](images/006_section_3/009_section_33/011_section_332/25_time_profile_plot_Paroxetine_Murdter__2016____paroxetine_hydrochloride__40_mg__po__md__n_3__AS_3_.png)

**Figure 3-27: Mürdter 2016: paroxetine hydrochloride, 40 mg, po, md, n=3 (AS=3)**

<br>
<br>

<a id="figure-3-28"></a>

![](images/006_section_3/009_section_33/011_section_332/26_time_profile_plot_Paroxetine_Schoedel__2012____paroxetine_hydrochloride__20_mg__po__md__n_14__EM_.png)

**Figure 3-28: Schoedel 2012: paroxetine hydrochloride, 20 mg, po, md, n=14 (EM)**

<br>
<br>

<a id="figure-3-29"></a>

![](images/006_section_3/009_section_33/011_section_332/27_time_profile_plot_Paroxetine_Segura__2005____paroxetine_hydrochloride__20_mg__po__md__n_7__EM_.png)

**Figure 3-29: Segura 2005: paroxetine hydrochloride, 20 mg, po, md, n=7 (EM)**

<br>
<br>

<a id="figure-3-30"></a>

![](images/006_section_3/009_section_33/011_section_332/28_time_profile_plot_Paroxetine_van_der_Lee__2007____paroxetine_hydrochloride__20_mg__po__md__n_26__EM_.png)

**Figure 3-30: van der Lee 2007: paroxetine hydrochloride, 20 mg, po, md, n=26 (EM)**

<br>
<br>

<a id="figure-3-31"></a>

![](images/006_section_3/009_section_33/011_section_332/29_time_profile_plot_Paroxetine_Yasui_Furukori__2006____paroxetine_hydrochloride__20_mg__po__n_12__AS_1_25_.png)

**Figure 3-31: Yasui-Furukori 2006: paroxetine hydrochloride, 20 mg, po, n=12 (AS=1.25)**

<br>
<br>

<a id="figure-3-32"></a>

![](images/006_section_3/009_section_33/011_section_332/30_time_profile_plot_Paroxetine_Yasui_Furukori__2007____paroxetine_hydrochloride__20_mg__po__n_13__EM_.png)

**Figure 3-32: Yasui-Furukori 2007: paroxetine hydrochloride, 20 mg, po, n=13 (EM)**

<br>
<br>

<a id="figure-3-33"></a>

![](images/006_section_3/009_section_33/011_section_332/31_time_profile_plot_Paroxetine_Yoon__2000____paroxetine_hydrochloride__40_mg__po__n_1__AS_0_.png)

**Figure 3-33: Yoon 2000: paroxetine hydrochloride, 40 mg, po, n=1 (AS=0)**

<br>
<br>

<a id="figure-3-34"></a>

![](images/006_section_3/009_section_33/011_section_332/32_time_profile_plot_Paroxetine_Yoon__2000____paroxetine_hydrochloride__40_mg__po__n_3__AS_0_5_.png)

**Figure 3-34: Yoon 2000: paroxetine hydrochloride, 40 mg, po, n=3 (AS=0.5)**

<br>
<br>

<a id="figure-3-35"></a>

![](images/006_section_3/009_section_33/011_section_332/33_time_profile_plot_Paroxetine_Yoon__2000____paroxetine_hydrochloride__40_mg__po__n_6__AS_1_25_.png)

**Figure 3-35: Yoon 2000: paroxetine hydrochloride, 40 mg, po, n=6 (AS=1.25)**

<br>
<br>

# 4 Conclusion<a id="4"></a>

The paroxetine PBPK model describes the evaluated plasma concentration-time data after intravenous doses of 23–28 mg and oral doses of 20–70 mg in adults. The evaluation includes single-dose and multiple-dose administration, immediate-release and controlled-release formulations, and CYP2D6 poor, intermediate, extensive, normal, and ultrarapid metabolizer groups represented by phenotype or activity score.

The model uses common absorption and distribution parameters across CYP2D6 groups. CYP2D6 provides the principal metabolic pathway, while CYP3A4, residual hepatic clearance, and passive glomerular filtration provide additional elimination pathways. Activity-score-specific CYP2D6 catalytic rates describe exposure differences across the evaluated CYP2D6 groups.

The concentration-time profiles and goodness-of-fit diagnostics characterize model performance within the evaluated dose, route, formulation, regimen, and CYP2D6 ranges. No formal acceptance criterion was applied. This compound report evaluates only paroxetine-only or control study arms.

The main limitations are the lumped representation of hepatic clearance and the absence of explicit metabolites and P-gp transport.

# 5 References<a id="5"></a>

[1] Rüdesheim S, Selzer D, Mürdter T, Igel S, Kerb R, Schwab M, Lehr T. Physiologically Based Pharmacokinetic Modeling to Describe the CYP2D6 Activity Score-Dependent Metabolism of Paroxetine, Atomoxetine and Risperidone. Pharmaceutics. 2022;14:1734. doi: [10.3390/pharmaceutics14081734](https://doi.org/10.3390/pharmaceutics14081734).

[2] Agrawal N. Determination of Paroxetine in Pharmaceutical Preparations Using HPLC with Electrochemical Detection. Open Anal Chem J. 2013;7:1-5. doi: [10.2174/1874065001307010001](https://doi.org/10.2174/1874065001307010001).

[3] Belle DJ, et al. Effect of potent CYP2D6 inhibition by paroxetine on atomoxetine pharmacokinetics. J Clin Pharmacol. 2002;42:1219-1227. doi: [10.1177/009127002762491307](https://doi.org/10.1177/009127002762491307).

[4] Bertelsen KM, Venkatakrishnan K, von Moltke LL, Obach RS, Greenblatt DJ. Apparent mechanism-based inhibition of human CYP2D6 in vitro by paroxetine. Drug Metab Dispos. 2003;31:289-293. doi: [10.1124/dmd.31.3.289](https://doi.org/10.1124/dmd.31.3.289).

[5] Calvo G, et al. Lack of pharmacologic interaction between paroxetine and alprazolam at steady state in healthy volunteers. J Clin Psychopharmacol. 2004;24:268-276. doi: [10.1097/01.jcp.0000125689.05091.c6](https://doi.org/10.1097/01.jcp.0000125689.05091.c6).

[6] Chen R, Wang H, Shi J, Shen K, Hu P. Cytochrome P450 2D6 genotype affects the pharmacokinetics of controlled-release paroxetine in healthy Chinese subjects: Comparison of traditional phenotype and activity score systems. Eur J Clin Pharmacol. 2015;71:835-841. doi: [10.1007/s00228-015-1855-6](https://doi.org/10.1007/s00228-015-1855-6).

[7] Jornil J, Jensen KG, Larsen F, Linnet K. Identification of cytochrome P450 isoforms involved in paroxetine metabolism. Drug Metab Dispos. 2010;38:376-385. doi: [10.1124/dmd.109.030551](https://doi.org/10.1124/dmd.109.030551).

[8] Kawai R, et al. Physiologically based pharmacokinetic study on a cyclosporin derivative, SDZ IMM 125. J Pharmacokinet Biopharm. 1994;22:327-365. doi: [10.1007/BF02353860](https://doi.org/10.1007/BF02353860).

[9] Kaye CM, et al. A review of the metabolism and pharmacokinetics of paroxetine in man. Acta Psychiatr Scand. 1989;80:60-75. doi: [10.1111/j.1600-0447.1989.tb07176.x](https://doi.org/10.1111/j.1600-0447.1989.tb07176.x).

[10] Khatavkar UN, Jayaram Kumar K, Shimpi SL. Novel approaches for development of oral controlled release compositions of galantamine hydrobromide and paroxetine hydrochloride hemihydrate. Int J Appl Pharm. 2016;8:1-6.

[11] Khatavkar UN, Shimpi SL, Jayaram Kumar K, Deo KD. Development and comparative evaluation of controlled release compositions of paroxetine hydrochloride hemihydrate. Drug Dev Ind Pharm. 2013;39:1175-1186. doi: [10.3109/03639045.2012.682222](https://doi.org/10.3109/03639045.2012.682222).

[12] Kuepfer L, Niederalt C, Wendl T, Schlender JF, Willmann S, Lippert J, Block M, Eissing T, Teutonico D. Applied Concepts in PBPK Modeling: How to Build a PBPK/PD Model. CPT Pharmacometrics Syst Pharmacol. 2016;5:516-531. doi: [10.1002/psp4.12134](https://doi.org/10.1002/psp4.12134).

[13] Lund J, et al. Paroxetine: Pharmacokinetics and Cardiovascular Effects after Oral and Intravenous Single Doses in Man. Acta Pharmacol Toxicol. 1982;51:351-357. doi: [10.1111/j.1600-0773.1982.tb01036.x](https://doi.org/10.1111/j.1600-0773.1982.tb01036.x).

[14] Massaroti P, et al. Validation of a selective method for determination of paroxetine in human plasma by LC-MS/MS. J Pharm Pharm Sci. 2005;8:340-347.

[15] McClelland GR, Raptopoulos P. EEG and blood level of the potential antidepressant paroxetine after a single oral dose to normal volunteers. Psychopharmacology. 1984;83:327-329. doi: [10.1007/BF00428539](https://doi.org/10.1007/BF00428539).

[16] Mürdter T, et al. Impact of CYP2D6 genotype and co-medication with paroxetine and clarithromycin on clomiphene metabolism in vivo. In: Abstracts of the 82nd Annual Meeting of the German Society for Experimental and Clinical Pharmacology and Toxicology. Naunyn-Schmiedeberg's Arch Pharmacol. 2016;389(Suppl 1):8. doi: [10.1007/s00210-016-1213-y](https://doi.org/10.1007/s00210-016-1213-y).

[17] Open Systems Pharmacology Suite Community. PK-Sim® Ontogeny Database Documentation version 7.3. 2018. https://github.com/Open-Systems-Pharmacology/OSPSuite.Documentation/blob/master/PK-Sim%20Ontogeny%20Database%20Version%207.3.pdf.

[18] Rodgers T, Rowland M. Mechanistic approaches to volume of distribution predictions. Pharm Res. 2007;24:918-933. doi: [10.1007/s11095-006-9210-3](https://doi.org/10.1007/s11095-006-9210-3).

[19] Schoedel KA, Pope LE, Sellers EM. Randomized open-label drug-drug interaction trial of dextromethorphan/quinidine and paroxetine in healthy volunteers. Clin Drug Investig. 2012;32:157-169. doi: [10.2165/11599870-000000000-00000](https://doi.org/10.2165/11599870-000000000-00000).

[20] Segura M, et al. Contribution of CYP2D6 to MDMA disposition in humans: use of paroxetine as metabolic inhibitor probe. Clin Pharmacokinet. 2005;44:649-660. doi: [10.2165/00003088-200544060-00006](https://doi.org/10.2165/00003088-200544060-00006).

[21] Sindrup SH, et al. The relationship between paroxetine and the sparteine oxidation polymorphism. Clin Pharmacol Ther. 1992;51:278-287. doi: [10.1038/clpt.1992.23](https://doi.org/10.1038/clpt.1992.23).

[22] Van der Lee MJ, et al. Interaction study of paroxetine and fosamprenavir-ritonavir in healthy subjects. Antimicrob Agents Chemother. 2007;51:4098-4104. doi: [10.1128/AAC.01243-06](https://doi.org/10.1128/AAC.01243-06).

[23] Venkatakrishnan K, Obach RS. In vitro-in vivo extrapolation of CYP2D6 inactivation by paroxetine. Drug Metab Dispos. 2005;33:845-852. doi: [10.1124/dmd.105.004077](https://doi.org/10.1124/dmd.105.004077).

[24] Willmann S, Höhn K, Edginton A, Sevestre M, Solodenko J, Weiss W, Lippert J, Schmitt W. Development of a physiology-based whole-body population model for assessing the influence of individual variability on the pharmacokinetics of drugs. J Pharmacokinet Pharmacodyn. 2007;34:401-431. doi: [10.1007/s10928-007-9053-5](https://doi.org/10.1007/s10928-007-9053-5).

[25] Yasui-Furukori N, et al. Effect of itraconazole on pharmacokinetics of paroxetine. Ther Drug Monit. 2007;29:45-48. doi: [10.1097/FTD.0b013e31802bb20d](https://doi.org/10.1097/FTD.0b013e31802bb20d).

[26] Yasui-Furukori N, et al. Terbinafine increases plasma concentration of paroxetine after single oral administration. Eur J Clin Pharmacol. 2006;63:51-56. doi: [10.1007/s00228-006-0217-9](https://doi.org/10.1007/s00228-006-0217-9).

[27] Yoon YR, et al. Relationship of paroxetine disposition to metoprolol metabolic ratio and CYP2D6*10 genotype. Clin Pharmacol Ther. 2000;67:567-576. doi: [10.1067/mcp.2000.106128](https://doi.org/10.1067/mcp.2000.106128).

[28] Zhong H, Mashinson V, Woolman T, Zha M. Understanding the Molecular Properties and Metabolism of Top Prescribed Drugs. Curr Top Med Chem. 2013;13:1290-1307. doi: [10.2174/15680266113139990034](https://doi.org/10.2174/15680266113139990034).

[29] Moore C, Bourque MS, Halman A, Agúndez JAG, Prows CA, Hikino K, et al. Clinical Pharmacogenetics Implementation Consortium (CPIC) Guideline for CYP2D6 Genotype and Use of 5-HT<sub>3</sub> Receptor Antagonists: 2026 Update. Clinical Pharmacology & Therapeutics. 2026;120:387-393. doi: [10.1002/cpt.70291](https://doi.org/10.1002/cpt.70291).

