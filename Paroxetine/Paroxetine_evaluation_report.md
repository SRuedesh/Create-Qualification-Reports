# Building and evaluation of a PBPK model for Paroxetine in adults

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
   * [3.2 Paroxetine diagnostics plots](#32)
   * [3.3 Concentration-Time Profiles](#33)
     * [3.3.1 Model Building](#331)
     * [3.3.2 Model Verification](#332)
 * [4 Conclusion](#4)
 * [5 References](#5)

# 1 Introduction<a id="1"></a>

Paroxetine is a selective serotonin reuptake inhibitor used for the treatment of depression and other psychiatric indications. Paroxetine is administered orally and undergoes nonlinear metabolism, mainly via CYP2D6, with additional CYP3A4 metabolism and CYP2D6-independent hepatic clearance represented in the model.

This paroxetine model is intended to describe plasma concentration-time profiles across CYP2D6 phenotype and activity-score groups and to support CYP2D6 drug-gene interaction simulations.

This whole-body PBPK model of paroxetine has been developed using published pharmacokinetic clinical data by [Lund 1982](#5-references), [Belle 2002](#5-references), [Massaroti 2005](#5-references), [Mürdter 2016](#5-references), [Sindrup 1992](#5-references), and [Yoon 2000](#5-references). The clinical data included intravenous infusion, immediate-release oral dosing, tablet dosing, controlled-release oral dosing, and repeated dosing across a dose range of 20 to 70 mg paroxetine. The model was then evaluated with clinical studies including [Calvo 2004](#5-references), [Chen 2015](#5-references), [McClelland 1984](#5-references), [Schoedel 2012](#5-references), [Segura 2005](#5-references), [van der Lee 2007](#5-references), [Yasui-Furukori 2007a](#5-references), [Yasui-Furukori 2007b](#5-references), [Mürdter 2016](#5-references), and [Yoon 2000](#5-references).

The presented model includes the following features:

- CYP2D6-mediated metabolism with activity-score specific k<sub>cat</sub> values,
- CYP3A4-mediated metabolism,
- unspecific hepatic clearance,
- renal filtration with a GFR fraction of 1,
- intravenous infusion, immediate-release oral, tablet, and controlled-release oral applications.

# 2 Methods<a id="2"></a>

## 2.1 Modeling strategy<a id="21"></a>

The general concept of building a PBPK model has previously been described by Kuepfer et al. ([Kuepfer 2016](#5-references)). Relevant information on anthropometric (height, weight) and physiological parameters (e.g. blood flows, organ volumes, binding protein concentrations, hematocrit, cardiac output) in adults was gathered from the literature and has been previously published ([Willmann 2007](#5-references)). The information was incorporated into PK-Sim® and was used as default values for the simulations in adults.

The applied activity and variability of plasma proteins and active processes that are integrated into PK-Sim® are described in the publicly available PK-Sim® Ontogeny Database Version 7.3 ([PK-Sim Ontogeny Database Version 7.3](#5-references)) or otherwise referenced for the specific process.

The paroxetine base model was developed sequentially. Model-building data from intravenous paroxetine administration in [Lund 1982](#5-references) supported the selection of partition-coefficient and cellular-permeability calculation methods. Oral single-dose and multiple-dose data from [Lund 1982](#5-references), [Belle 2002](#5-references), [Massaroti 2005](#5-references), [Sindrup 1992](#5-references), [Mürdter 2016](#5-references), and [Yoon 2000](#5-references) informed oral absorption, CYP2D6-independent metabolism, and CYP2D6-mediated metabolism.

Oral solution and tablet applications were used for immediate-release dosing, while controlled-release oral applications were represented with Weibull dissolution parameters based on controlled-release formulation data. The model contains CYP2D6 and CYP3A4 as active metabolic processes, an unspecific hepatic clearance process, renal filtration, and mechanism-based inhibition processes for CYP2D6 and CYP3A4.

For the CYP2D6 drug-gene interaction model, CYP2D6-dependent clearance was represented with Michaelis-Menten kinetics. CYP2D6 k<sub>cat</sub> values were optimized for activity score 2 and set to zero for poor metabolizers, while other activity-score k<sub>cat</sub> values were calculated from a polynomial regression derived from metoprolol and dextromethorphan models. CYP2D6 K<sub>m</sub> and CYP2D6 reference concentrations were kept constant over the modeled activity-score range.

Details about the input data are provided in Section 2.2. Details about the structural model and assumptions are provided in Section 2.3.

## 2.2 Data used<a id="22"></a>

### 2.2.1 In vitro and physicochemical data

The table below summarizes the drug-dependent inputs documented for the paroxetine model.

The Unspecific CL<sub>hep</sub> value reported by [Rüdesheim 2022](#5-references) in the publication and supplement is erroneous. The value implemented in the model is correct.

| Parameter | Unit | Value | Source | Description |
| --- | ---: | ---: | --- | --- |
| MW | g/mol | 329.37 | Literature; [Zhong 2013](#5-references) | Compound size used in concentration conversions. |
| pK<sub>a</sub> (base) | - | 9.9 | Literature; [Agrawal 2013](#5-references) | Basic ionization constant. |
| Solubility (pH 4.5) | mg/mL | 7.31 | Literature; [Khatavkar 2016](#5-references) | Solubility input. |
| logP | - | 3.95 | Literature; [Agrawal 2013](#5-references) | Distribution input. |
| f<sub>u</sub> | % | 4.873 | Optimized from literature; [Kaye 1989](#5-references) | Started at 5.00%; Table S2.1.1 reports the 5.00% starting value. |
| CYP3A4 K<sub>m</sub> | µmol/L | 4.7 | Literature; [Jornil 2010](#5-references) | CYP3A4 affinity parameter. |
| CYP3A4 k<sub>cat</sub> | 1/min | 1.01 | Optimized; [Jornil 2010](#5-references) | CYP3A4 metabolic capacity parameter. |
| CYP2D6 K<sub>m</sub> | µmol/L | 0.028 | Literature; [Jornil 2010](#5-references) | CYP2D6 affinity held constant across activity scores. |
| CYP2D6 k<sub>cat</sub> EM | 1/min | 1.3693020782 | Optimized; [Jornil 2010](#5-references) | activity-score-dependent CYP2D6 clearance. |
| CYP2D6 k<sub>cat</sub> PM | 1/min | 0 | Assumed; [Jornil 2010](#5-references) | CYP2D6 poor-metabolizer activity set to zero. |
| Unspecific CL<sub>hep</sub> | 1/min | 2.2538632474 | Optimized; [Jornil 2010](#5-references) | publication and supplement value is erroneous; model value retained |
| CYP2D6 K<sub>i</sub> | µmol/L | 0.16738 | Optimized; [Venkatakrishnan 2005](#5-references) | Mechanism-based CYP2D6 inhibition parameter. |
| CYP2D6 k<sub>inact</sub> | 1/min | 0.17 | Literature; [Venkatakrishnan 2005](#5-references) | Mechanism-based CYP2D6 inactivation parameter. |
| CYP3A4 K<sub>i</sub> | µmol/L | 4.48 | Literature; [Bertelsen 2003](#5-references) | Mechanism-based CYP3A4 inhibition parameter. |
| CYP3A4 k<sub>inact</sub> | 1/min | 0.011 | Literature; [Bertelsen 2003](#5-references) | Mechanism-based CYP3A4 inactivation parameter. |
| GFR fraction | - | 1 | Assumed | Passive glomerular filtration fraction. |
| CR Weibull shape | - | 7.17 | Optimized | Controlled-release formulation parameter. |
| CR Weibull time | min | 276.35 | Optimized; [Chen 2015](#5-references); [Khatavkar 2013](#5-references) | Controlled-release formulation parameter. |
| Partition coefficients | - | Diverse | Calculated; [Rodgers 2007](#5-references) | Partition coefficient method. |
| Cellular permeabilities | cm/min | 0.28 | Calculated; [Kawai 1994](#5-references) | Cellular permeability method. |
| Specific intestinal perm. | cm/min | 3.93E-05 | Calculated; [Kawai 1994](#5-references) | Oral absorption parameter. |

### 2.2.2 Clinical data

The evaluation uses 35 observed-data profiles for paroxetine in peripheral venous blood plasma. The evaluation plan assigns 14 simulations to model building and 19 simulations to model verification.

Model-building clinical data:

| Publication | Arm / Treatment / Information used for model building |
| --- | --- |
| [Lund 1982](#5-references) | Plasma PK profiles in adults after intravenous infusion, single dose and oral, single-dose administration of 28 mg, 23 mg, 45 mg doses paroxetine. |
| [Belle 2002](#5-references) | Plasma PK profiles in adults after oral tablet, once daily administration of 20 mg paroxetine with CYP2D6 g-EM status. |
| [Massaroti 2005](#5-references) | Plasma PK profiles in adults after oral tablet, single-dose administration of 20 mg paroxetine. |
| [Mürdter 2016](#5-references) | Plasma PK profiles in adults after oral tablet, single-dose administration of 40 mg paroxetine with CYP2D6 AS = 2 status. |
| [Sindrup 1992](#5-references) | Plasma PK profiles in adults after oral tablet, once daily administration of 30 mg paroxetine with CYP2D6 p-PM, p-EM status. |
| [Yoon 2000](#5-references) | Plasma PK profiles in adults after oral tablet, single-dose administration of 40 mg paroxetine with CYP2D6 AS = 2 status. |

Model-verification clinical data:

| Publication | Arm / Treatment / Information used for model verification |
| --- | --- |
| [Calvo 2004](#5-references) | Plasma PK profiles in adults after oral, once daily administration of 20 mg paroxetine. |
| [McClelland 1984](#5-references) | Plasma PK profiles in adults after oral, single-dose administration of 70 mg paroxetine. |
| [Schoedel 2012](#5-references) | Plasma PK profiles in adults after oral, once daily administration of 20 mg paroxetine. |
| [Segura 2005](#5-references) | Plasma PK profiles in adults after oral tablet, once daily administration of 20 mg paroxetine with CYP2D6 p-EM status. |
| [van der Lee 2007](#5-references) | Plasma PK profiles in adults after oral tablet, once daily administration of 20 mg paroxetine with CYP2D6 g-EM status. |
| [Yasui-Furukori 2006](#5-references) | Plasma PK profiles in adults after oral, single-dose administration of 20 mg paroxetine with CYP2D6 AS = 1.25 status. |
| [Yasui-Furukori 2007](#5-references) | Plasma PK profiles in adults after oral, single-dose administration of 20 mg paroxetine. |
| [Chen 2015](#5-references) | Plasma PK profiles in adults after oral controlled release, single-dose administration of 25 mg paroxetine with CYP2D6 AS = 0.5, AS = 1.0, AS = 1.5, AS = 2 status. |
| [Mürdter 2016](#5-references) | Plasma PK profiles in adults after oral tablet, single-dose administration of 40 mg paroxetine with CYP2D6 AS = 0, AS = 0.5, AS = 0.75, AS = 1, AS = 3 status. |
| [Yoon 2000](#5-references) | Plasma PK profiles in adults after oral tablet, single-dose administration of 40 mg paroxetine with CYP2D6 AS = 0, AS = 0.5, AS = 1.25 status. |

## 2.3 Model parameters and assumptions<a id="23"></a>

### 2.3.1 Absorption

The model includes intravenous infusion, immediate-release oral solution, oral tablet, and controlled-release oral applications. Intravenous simulations do not require an absorption process. Oral-solution and tablet simulations are represented with dissolved formulation input, while controlled-release simulations use a Weibull tablet formulation.

The value for `Specific intestinal permeability` and the solubility at pH 4.5 are summarized in Section 2.2.1. The controlled-release formulation is described by the `CR Weibull shape` and `CR Weibull time` parameters.

### 2.3.2 Distribution

Paroxetine is highly bound to plasma proteins. The literature starting value for `Fraction unbound (plasma, reference value)` was 5.00% [[9](#5-references)]. The value was optimized to 4.873% in the PBPK model. Table S2.1.1 in the supplement reports the 5.00% starting value.

An important parameter influencing the resulting volume of distribution is lipophilicity. A `Lipophilicity` value of 3.95 was used in the model as summarized in Section 2.2.1.

After testing the available organ-plasma partition coefficient and cell permeability calculation methods built in PK-Sim, observed clinical data was best described by choosing the partition coefficient calculation by `Rodgers and Rowland` and cellular permeability calculation in PK-Sim.

### 2.3.3 Metabolism and Elimination

Two metabolic pathways and one residual hepatic clearance process were implemented into the model.

* CYP2D6

CYP2D6 metabolism is represented by Michaelis-Menten kinetics. CYP2D6 activity score-dependent k<sub>cat</sub> values are implemented as separate CYP2D6 processes. CYP2D6 k<sub>cat</sub> for AS=2 was optimized, AS=0 was set to zero, and intermediate or higher activity-score k<sub>cat</sub> values were calculated from the activity-score regression described by [Rüdesheim 2022](#5-references).

* CYP3A4

CYP3A4 metabolism is represented by Michaelis-Menten kinetics using the K<sub>m</sub> and k<sub>cat</sub> values summarized in Section 2.2.1.

* Unspecific hepatic clearance

The model contains unspecific hepatic clearance. The Unspecific CL<sub>hep</sub> value reported by [Rüdesheim 2022](#5-references) in the publication and supplement is erroneous. The value implemented in the model is correct.

Additionally, renal filtration is represented with a `GFR fraction` of 1. Mechanism-based inhibition processes for CYP2D6 and CYP3A4 are included using the K<sub>i</sub> and k<sub>inact</sub> values summarized in Section 2.2.1.

# 3 Results and Discussion<a id="3"></a>

The PBPK model for paroxetine was developed and verified with clinical pharmacokinetic data after intravenous and oral administration. The evaluation covers immediate-release and controlled-release applications, single-dose and repeated-dose regimens, and a dose range of 20 to 70 mg. The clinical dataset also includes CYP2D6 poor-metabolizer, extensive-metabolizer, and activity-score stratified groups, which are central to the intended use of the model.

The model was built with data supporting distribution, oral absorption, CYP2D6-dependent clearance, CYP2D6-independent clearance, and controlled-release dissolution. Intravenous data from [Lund 1982](#5-references) supported systemic disposition independent of oral absorption. Oral data from [Belle 2002](#5-references), [Massaroti 2005](#5-references), [Mürdter 2016](#5-references), [Sindrup 1992](#5-references), and [Yoon 2000](#5-references) supported oral absorption, repeated-dose behavior, and CYP2D6 activity-score-dependent clearance. Verification used independent immediate-release and controlled-release oral studies, including [Chen 2015](#5-references), [McClelland 1984](#5-references), [Schoedel 2012](#5-references), [Segura 2005](#5-references), [van der Lee 2007](#5-references), and [Yasui-Furukori 2006](#5-references).

The model quantifies CYP2D6- and CYP3A4-mediated metabolism, unspecific hepatic clearance, passive renal filtration, and mechanism-based inhibition of CYP2D6 and CYP3A4. The CYP2D6 activity-score implementation is the major driver for differences between poor-, intermediate-, extensive-, and higher-activity groups. CYP3A4 metabolism and unspecific hepatic clearance provide additional clearance capacity and limit the extent to which paroxetine exposure is controlled by CYP2D6 alone.

The next sections show:

1. the final model input parameters for the building blocks: [Section 3.1](Input_table.md).
2. the overall goodness of fit: [Section 3.2](GOF_diagnostics.md).
3. simulated vs. observed concentration-time profiles for the clinical studies used for model building and for model verification: [Section 3.3](Concentration_time_profiles.md).

The merged GOF diagnostic over the included concentration observations gives GMFE values of 1.35 for model-building profiles, 1.59 for model-verification profiles, and 1.46 overall. The verification value is higher than the building value, which is expected for independent studies covering different formulations, repeated dosing, and CYP2D6 activity states. The overall value remains within a range consistent with a model intended to describe population-level paroxetine exposure rather than subject-specific concentrations.

The concentration-time profiles should be interpreted by study context. Intravenous profiles mainly test distribution and systemic clearance. Immediate-release oral profiles test the combined absorption and first-pass components. Controlled-release profiles additionally test the Weibull dissolution parameters. CYP2D6 poor-metabolizer and low-activity-score profiles are particularly informative because paroxetine exposure becomes more dependent on CYP2D6-independent clearance and the mechanism-based inhibition terms.

[Rüdesheim 2022](#5-references) reported good DGI ratio performance for paroxetine, with 10 of 12 AUClast ratios and 9 of 12 Cmax ratios within the prediction success limits. The corresponding reported GMFE values were 1.37 for AUClast ratios and 1.33 for Cmax ratios. These results support the use of the model for CYP2D6 drug-gene interaction simulations, while the concentration-time diagnostics in [Section 3.2](GOF_diagnostics.md) and [Section 3.3](Concentration_time_profiles.md) should remain the primary evidence for the specific simulations included in this report.

The model is adequate for adult paroxetine simulations within the represented intravenous and oral dose range, formulations, and CYP2D6 activity groups. Remaining interpretation should be cautious for unrepresented populations, untested controlled-release products, and scenarios that depend on extrapolating mechanism-based inhibition beyond the evaluated clinical settings.

## 3.1 Paroxetine final input parameters<a id="31"></a>

The compound parameter values of the final PBPK model are illustrated below.

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

## 3.2 Paroxetine diagnostics plots<a id="32"></a>

The goodness-of-fit diagnostics combine all modeled compounds in one set of plots. Colors and symbols identify compounds consistently with the concentration-time profiles. Administration route, formulation, and model-building or verification status are not used to split the diagnostics.

<a id="table-3-1"></a>

**Table 3-1: GMFE for Observed versus simulated concentration-time data for all modeled compounds**

|Group      |GMFE |
|:----------|:----|
|Paroxetine |1.46 |

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

## 3.3 Concentration-Time Profiles<a id="33"></a>

Simulated versus observed concentration-time profiles of all data listed in [Section 2.2.2](Section2.2_Data.md) are presented below.

### 3.3.1 Model Building<a id="331"></a>

The concentration-time profiles in this section show the clinical study arms used for model building. These profiles support assessment of systemic disposition, oral absorption, repeated-dose behavior, and CYP2D6 activity-score-dependent paroxetine exposure.

<a id="figure-3-3"></a>

![](images/006_section_3/009_section_33/010_section_331/1_time_profile_plot_Paroxetine_Sindrup__1992____paroxetine_hydrochloride__30_mg__po__md__n_8__PM_.png)

**Figure 3-3: Time Profile Analysis**

<br>
<br>

<a id="figure-3-4"></a>

![](images/006_section_3/009_section_33/010_section_331/2_time_profile_plot_Paroxetine_Sindrup__1992____paroxetine_hydrochloride__30_mg__po__md__n_9__EM_.png)

**Figure 3-4: Time Profile Analysis**

<br>
<br>

<a id="figure-3-5"></a>

![](images/006_section_3/009_section_33/010_section_331/3_time_profile_plot_Paroxetine_Massaroti__2005____paroxetine_hydrochloride__20_mg__po__n_28__EM_.png)

**Figure 3-5: Time Profile Analysis**

<br>
<br>

<a id="figure-3-6"></a>

![](images/006_section_3/009_section_33/010_section_331/6_time_profile_plot_Paroxetine_Belle__2002____paroxetine_hydrochloride__20_mg__po__md__n_22__EM_.png)

**Figure 3-6: Time Profile Analysis**

<br>
<br>

<a id="figure-3-7"></a>

![](images/006_section_3/009_section_33/010_section_331/16_time_profile_plot_Paroxetine_Murdter__2016____paroxetine_hydrochloride__40_mg__po__md__n_3__AS_2_.png)

**Figure 3-7: Time Profile Analysis**

<br>
<br>

<a id="figure-3-8"></a>

![](images/006_section_3/009_section_33/010_section_331/20_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__23_mg__iv__n_1__EM___D.png)

**Figure 3-8: Time Profile Analysis**

<br>
<br>

<a id="figure-3-9"></a>

![](images/006_section_3/009_section_33/010_section_331/21_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__28_mg__iv__n_1__EM___A.png)

**Figure 3-9: Time Profile Analysis**

<br>
<br>

<a id="figure-3-10"></a>

![](images/006_section_3/009_section_33/010_section_331/22_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__28_mg__iv__n_1__EM___B.png)

**Figure 3-10: Time Profile Analysis**

<br>
<br>

<a id="figure-3-11"></a>

![](images/006_section_3/009_section_33/010_section_331/23_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__28_mg__iv__n_1__EM___C.png)

**Figure 3-11: Time Profile Analysis**

<br>
<br>

<a id="figure-3-12"></a>

![](images/006_section_3/009_section_33/010_section_331/24_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__45_mg__po__n_1__EM___A.png)

**Figure 3-12: Time Profile Analysis**

<br>
<br>

<a id="figure-3-13"></a>

![](images/006_section_3/009_section_33/010_section_331/25_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__45_mg__po__n_1__EM___B.png)

**Figure 3-13: Time Profile Analysis**

<br>
<br>

<a id="figure-3-14"></a>

![](images/006_section_3/009_section_33/010_section_331/26_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__45_mg__po__n_1__EM___C.png)

**Figure 3-14: Time Profile Analysis**

<br>
<br>

<a id="figure-3-15"></a>

![](images/006_section_3/009_section_33/010_section_331/27_time_profile_plot_Paroxetine_Lund__1982____paroxetine_hydrochloride__45_mg__po__n_1__EM___D.png)

**Figure 3-15: Time Profile Analysis**

<br>
<br>

<a id="figure-3-16"></a>

![](images/006_section_3/009_section_33/010_section_331/28_time_profile_plot_Paroxetine_Yoon__2000____paroxetine_hydrochloride__40_mg__po__n_6__AS_2_.png)

**Figure 3-16: Time Profile Analysis**

<br>
<br>

### 3.3.2 Model Verification<a id="332"></a>

The concentration-time profiles in this section show independent clinical study arms used for model verification. These profiles support assessment of model performance across additional oral dosing regimens, formulations, and CYP2D6 activity-score groups.

<a id="figure-3-17"></a>

![](images/006_section_3/009_section_33/011_section_332/4_time_profile_plot_Paroxetine_Segura__2005____paroxetine_hydrochloride__20_mg__po__md__n_7__EM_.png)

**Figure 3-17: Time Profile Analysis**

<br>
<br>

<a id="figure-3-18"></a>

![](images/006_section_3/009_section_33/011_section_332/5_time_profile_plot_Paroxetine_Calvo__2004____paroxetine_hydrochloride__20_mg__po__md__n_25__EM_.png)

**Figure 3-18: Time Profile Analysis**

<br>
<br>

<a id="figure-3-19"></a>

![](images/006_section_3/009_section_33/011_section_332/7_time_profile_plot_Paroxetine_McClelland__1984____paroxetine_hydrochloride__70_mg__po__n_5__EM_.png)

**Figure 3-19: Time Profile Analysis**

<br>
<br>

<a id="figure-3-20"></a>

![](images/006_section_3/009_section_33/011_section_332/8_time_profile_plot_Paroxetine_Schoedel__2012____paroxetine_hydrochloride__20_mg__po__md__n_14__EM_.png)

**Figure 3-20: Time Profile Analysis**

<br>
<br>

<a id="figure-3-21"></a>

![](images/006_section_3/009_section_33/011_section_332/9_time_profile_plot_Paroxetine_Yasui_Furukori__2007____paroxetine_hydrochloride__20_mg__po__n_12__AS_1_25_.png)

**Figure 3-21: Time Profile Analysis**

<br>
<br>

<a id="figure-3-22"></a>

![](images/006_section_3/009_section_33/011_section_332/10_time_profile_plot_Paroxetine_Yasui_Furukori__2007____paroxetine_hydrochloride__20_mg__po__n_13__EM_.png)

**Figure 3-22: Time Profile Analysis**

<br>
<br>

<a id="figure-3-23"></a>

![](images/006_section_3/009_section_33/011_section_332/11_time_profile_plot_Paroxetine_Chen__2015____paroxetine_hydrochloride__25_mg__po__n_4__AS_0_5_.png)

**Figure 3-23: Time Profile Analysis**

<br>
<br>

<a id="figure-3-24"></a>

![](images/006_section_3/009_section_33/011_section_332/12_time_profile_plot_Paroxetine_Chen__2015____paroxetine_hydrochloride__25_mg__po__n_4__AS_2_.png)

**Figure 3-24: Time Profile Analysis**

<br>
<br>

<a id="figure-3-25"></a>

![](images/006_section_3/009_section_33/011_section_332/13_time_profile_plot_Paroxetine_Chen__2015____paroxetine_hydrochloride__25_mg__po__n_5__AS_1_5_.png)

**Figure 3-25: Time Profile Analysis**

<br>
<br>

<a id="figure-3-26"></a>

![](images/006_section_3/009_section_33/011_section_332/14_time_profile_plot_Paroxetine_Chen__2015____paroxetine_hydrochloride__25_mg__po__n_11__AS_1_.png)

**Figure 3-26: Time Profile Analysis**

<br>
<br>

<a id="figure-3-27"></a>

![](images/006_section_3/009_section_33/011_section_332/15_time_profile_plot_Paroxetine_Murdter__2016____paroxetine_hydrochloride__40_mg__po__md__n_3__AS_3_.png)

**Figure 3-27: Time Profile Analysis**

<br>
<br>

<a id="figure-3-28"></a>

![](images/006_section_3/009_section_33/011_section_332/17_time_profile_plot_Paroxetine_Murdter__2016____paroxetine_hydrochloride__40_mg__po__md__n_3__AS_0_.png)

**Figure 3-28: Time Profile Analysis**

<br>
<br>

<a id="figure-3-29"></a>

![](images/006_section_3/009_section_33/011_section_332/18_time_profile_plot_Paroxetine_Murdter__2016____paroxetine_hydrochloride__40_mg__po__md__n_2__AS_1_.png)

**Figure 3-29: Time Profile Analysis**

<br>
<br>

<a id="figure-3-30"></a>

![](images/006_section_3/009_section_33/011_section_332/19_time_profile_plot_Paroxetine_Murdter__2016____paroxetine_hydrochloride__40_mg__po__md__n_4__AS_0_5_.png)

**Figure 3-30: Time Profile Analysis**

<br>
<br>

<a id="figure-3-31"></a>

![](images/006_section_3/009_section_33/011_section_332/29_time_profile_plot_Paroxetine_Yoon__2000____paroxetine_hydrochloride__40_mg__po__n_1__AS_0_.png)

**Figure 3-31: Time Profile Analysis**

<br>
<br>

<a id="figure-3-32"></a>

![](images/006_section_3/009_section_33/011_section_332/30_time_profile_plot_Paroxetine_Yoon__2000____paroxetine_hydrochloride__40_mg__po__n_3__AS_0_5_.png)

**Figure 3-32: Time Profile Analysis**

<br>
<br>

<a id="figure-3-33"></a>

![](images/006_section_3/009_section_33/011_section_332/31_time_profile_plot_Paroxetine_Yoon__2000____paroxetine_hydrochloride__40_mg__po__n_6__AS_1_25_.png)

**Figure 3-33: Time Profile Analysis**

<br>
<br>

<a id="figure-3-34"></a>

![](images/006_section_3/009_section_33/011_section_332/32_time_profile_plot_Paroxetine_Murdter__2016____paroxetine_hydrochloride__40_mg__po__md__n_1__AS_0_75_.png)

**Figure 3-34: Time Profile Analysis**

<br>
<br>

<a id="figure-3-35"></a>

![](images/006_section_3/009_section_33/011_section_332/33_time_profile_plot_Paroxetine_van_der_Lee__2007____paroxetine_hydrochloride__20_mg__po__md__n_26__EM_.png)

**Figure 3-35: Time Profile Analysis**

<br>
<br>

# 4 Conclusion<a id="4"></a>

The presented PBPK model adequately describes paroxetine pharmacokinetics in the evaluated adult intravenous, oral immediate-release, controlled-release, and CYP2D6 activity-score settings. Interpretation should remain cautious for unrepresented populations, untested controlled-release products, and scenarios that extrapolate mechanism-based inhibition beyond the evaluated clinical settings.

# 5 References<a id="5"></a>

[1] Rüdesheim S, Selzer D, Mürdter T, Igel S, Kerb R, Schwab M, Lehr T. Physiologically Based Pharmacokinetic Modeling to Describe the CYP2D6 Activity Score-Dependent Metabolism of Paroxetine, Atomoxetine and Risperidone. Pharmaceutics. 2022;14:1734. doi: [10.3390/pharmaceutics14081734](https://doi.org/10.3390/pharmaceutics14081734).

[2] Agrawal N. Determination of Paroxetine in Pharmaceutical Preparations Using HPLC with Electrochemical Detection. Open Anal Chem J. 2013;7:1-5.

[3] Belle DJ, et al. Effect of potent CYP2D6 inhibition by paroxetine on atomoxetine pharmacokinetics. J Clin Pharmacol. 2002;42:1219-1227.

[4] Bertelsen KM, Venkatakrishnan K, von Moltke LL, Obach RS, Greenblatt DJ. Apparent mechanism-based inhibition of human CYP2D6 in vitro by paroxetine. Drug Metab Dispos. 2003;31:289-293.

[5] Calvo G, et al. Lack of pharmacologic interaction between paroxetine and alprazolam at steady state in healthy volunteers. J Clin Psychopharmacol. 2004;24:268-276.

[6] Chen R, Wang H, Shi J, Shen K, Hu P. CYP2D6 genotype affects controlled-release paroxetine pharmacokinetics in healthy Chinese subjects. Eur J Clin Pharmacol. 2015;71:835-841.

[7] Jornil J, Jensen KG, Larsen F, Linnet K. Identification of cytochrome P450 isoforms involved in paroxetine metabolism. Drug Metab Dispos. 2010;38:376-385.

[8] Kawai R, et al. Physiologically based pharmacokinetic study on a cyclosporin derivative, SDZ IMM 125. J Pharmacokinet Biopharm. 1994;22:327-365.

[9] Kaye CM, et al. A review of the metabolism and pharmacokinetics of paroxetine in man. Acta Psychiatr Scand. 1989;80:60-75.

[10] Khatavkar UN, Jayaram Kumar K, Shimpi SL. Novel approaches for development of oral controlled release compositions of galantamine hydrobromide and paroxetine hydrochloride hemihydrate. Int J Appl Pharm. 2016;8:1-6.

[11] Khatavkar UN, Shimpi SL, Jayaram Kumar K, Deo KD. Development and comparative evaluation of controlled release compositions of paroxetine hydrochloride hemihydrate. Drug Dev Ind Pharm. 2013;39:1175-1186.

[12] Kuepfer L, Niederalt C, Wendl T, Schlender JF, Willmann S, Lippert J, Block M, Eissing T, Teutonico D. Applied Concepts in PBPK Modeling: How to Build a PBPK/PD Model. CPT Pharmacometrics Syst Pharmacol. 2016;5:516-531.

[13] Lund J, et al. Paroxetine: Pharmacokinetics and Cardiovascular Effects after Oral and Intravenous Single Doses in Man. Acta Pharmacol Toxicol. 1982;51:351-357.

[14] Massaroti P, et al. Validation of a selective method for determination of paroxetine in human plasma by LC-MS/MS. J Pharm Pharm Sci. 2005;8:340-347.

[15] McClelland GR, Raptopoulos P. EEG and blood level of paroxetine after a single oral dose to normal volunteers. Psychopharmacology. 1984;83:327-329.

[16] Mürdter T, et al. Impact of CYP2D6 genotype and co-medication with paroxetine and clarithromycin on clomiphene metabolism in vivo. Naunyn-Schmiedeberg's Arch Pharmacol. 2016;389:8.

[17] Open Systems Pharmacology Suite Community. PK-Sim® Ontogeny Database Documentation version 7.3. 2018. https://github.com/Open-Systems-Pharmacology/OSPSuite.Documentation/blob/master/PK-Sim%20Ontogeny%20Database%20Version%207.3.pdf.

[18] Rodgers T, Rowland M. Mechanistic approaches to volume of distribution predictions. Pharm Res. 2007;24:918-933.

[19] Schoedel KA, Pope LE, Sellers EM. Randomized open-label drug-drug interaction trial of dextromethorphan/quinidine and paroxetine in healthy volunteers. Clin Drug Investig. 2012;32:157-169.

[20] Segura M, et al. Contribution of CYP2D6 to MDMA disposition in humans: use of paroxetine as metabolic inhibitor probe. Clin Pharmacokinet. 2005;44:649-660.

[21] Sindrup SH, et al. The relationship between paroxetine and the sparteine oxidation polymorphism. Clin Pharmacol Ther. 1992;51:278-287.

[22] Van der Lee MJ, et al. Interaction study of paroxetine and fosamprenavir-ritonavir in healthy subjects. Antimicrob Agents Chemother. 2007;51:4098-4104.

[23] Venkatakrishnan K, Obach RS. In vitro-in vivo extrapolation of CYP2D6 inactivation by paroxetine. Drug Metab Dispos. 2005;33:845-852.

[24] Willmann S, Höhn K, Edginton A, Sevestre M, Solodenko J, Weiss W, Lippert J, Schmitt W. Development of a physiology-based whole-body population model for assessing the influence of individual variability on the pharmacokinetics of drugs. J Pharmacokinet Pharmacodyn. 2007;34:401-431.

[25] Yasui-Furukori N, et al. Effect of itraconazole on pharmacokinetics of paroxetine. Ther Drug Monit. 2007;29:45-48.

[26] Yasui-Furukori N, et al. Terbinafine increases plasma concentration of paroxetine after single oral administration. Eur J Clin Pharmacol. 2006;63:51-56.

[27] Yoon YR, et al. Relationship of paroxetine disposition to metoprolol metabolic ratio and CYP2D6*10 genotype. Clin Pharmacol Ther. 2000;67:567-576.

[28] Zhong H, Mashinson V, Woolman T, Zha M. Understanding the Molecular Properties and Metabolism of Top Prescribed Drugs. Curr Top Med Chem. 2013;13:1290-1307.

