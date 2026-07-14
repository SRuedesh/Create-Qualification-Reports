# Building and evaluation of a PBPK model for Risperidone in adults

| Version                                         | evaluation-OSP12.2                                                   |
| ----------------------------------------------- | ------------------------------------------------------------ |
| based on *Model Snapshot* and *Evaluation Plan* | https://github.com/Open-Systems-Pharmacology/Risperidone-Model/releases/tag/vevaluation |
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
   * [3.1 Risperidone final input parameters](#31)
   * [3.2 Diagnostic plots](#32)
     * [3.2.1 Risperidone goodness-of-fit diagnostics](#321)
     * [3.2.2 9-Hydroxyrisperidone goodness-of-fit diagnostics](#322)
   * [3.3 Concentration-time profiles](#33)
     * [3.3.1 Model Building](#331)
     * [3.3.2 Model Verification](#332)
 * [4 Conclusion](#4)
 * [5 References](#5)

# 1 Introduction<a id="1"></a>

Risperidone is an atypical antipsychotic used for schizophrenia and other psychiatric indications. It is administered orally and is converted to the active metabolite 9-hydroxyrisperidone, also known as paliperidone. CYP2D6 is an important metabolic pathway for risperidone, while CYP3A4 and transporter processes contribute to parent and metabolite disposition.

This risperidone model is intended to describe plasma concentration-time profiles of risperidone, 9-hydroxyrisperidone, and active moiety across CYP2D6 phenotype and activity-score groups. It supports evaluation of CYP2D6 drug-gene interactions and interacting-drug scenarios where risperidone or 9-hydroxyrisperidone exposure is clinically relevant.

The risperidone parent-metabolite PBPK model was originally developed by [Kneller 2020](References.md). The model was subsequently used in the CYP2D6 activity-score framework by [Rüdesheim 2022](References.md) and in the CYP2D6 drug-drug-gene interaction network by [Rüdesheim 2025](References.md). The clinical data include oral single-dose and multiple-dose administration of risperidone, CYP2D6 phenotype or activity-score stratified groups, and studies with CYP3A or P-gp modulators.

The presented model includes the following features:

- risperidone and 9-hydroxyrisperidone as parent and metabolite compounds,
- CYP2D6-mediated risperidone metabolism with activity-score dependent k<sub>cat</sub> values,
- CYP3A4-mediated metabolism and residual sink pathways,
- P-gp transport for risperidone and 9-hydroxyrisperidone,
- renal filtration for parent and metabolite,
- oral tablet administration in the evaluated clinical studies.

# 2 Methods<a id="2"></a>

## 2.1 Modeling strategy<a id="21"></a>

The general concept of building a PBPK model has previously been described by Kuepfer et al. ([Kuepfer 2016](References.md)). Relevant information on anthropometric and physiological parameters in adults was gathered from the literature and incorporated into PK-Sim as default values for adult simulations ([Willmann 2007](References.md)).

The applied activity and variability of plasma proteins and active processes integrated into PK-Sim are described in the publicly available PK-Sim Ontogeny Database or otherwise referenced for the specific process.

The risperidone model was developed as a parent-metabolite model for risperidone and 9-hydroxyrisperidone. The original model by [Kneller 2020](References.md) described oral risperidone pharmacokinetics by CYP2D6 phenotype. [Rüdesheim 2022](References.md) then used the model in a CYP2D6 activity-score framework, where CYP2D6 metabolic capacity is represented by activity-score dependent k<sub>cat</sub> values.

Clinical studies used for model building covered oral risperidone administration and included data for risperidone and 9-hydroxyrisperidone where available. Model verification used independent oral study arms, including CYP2D6 poor-, normal-, and higher-activity groups and interacting-drug scenarios. Because the active moiety is the sum of parent and metabolite exposure, model performance has to be interpreted separately for risperidone, 9-hydroxyrisperidone, and active moiety.

The model-building workflow first established the parent disposition and the formation of 9-hydroxyrisperidone. CYP2D6-related parameters were then used to describe the shift from parent exposure toward metabolite exposure across phenotype and activity-score groups. Verification focused on whether the final parameter set described independent study arms without additional study-specific adjustment.

The model contains CYP2D6 and CYP3A4 metabolism, P-gp transport, renal filtration, and residual clearance processes. CYP2D6 poor-metabolizer activity is represented by setting CYP2D6 k<sub>cat</sub> to zero, while non-zero activity-score groups use fitted or scaled CYP2D6 k<sub>cat</sub> values.

The evaluated applications are oral risperidone applications with risperidone, 9-hydroxyrisperidone, and active-moiety observations. The major proteins and processes represented explicitly are CYP2D6, CYP3A4, P-gp, plasma protein binding, passive renal filtration, and unspecific hepatic clearance for the metabolite. The parent-metabolite structure is central to the evaluation because a model can describe active moiety while still showing bias in the parent or metabolite alone.

The report therefore presents model diagnostics for the parent and metabolite concentrations and links the clinical-data table to model-building and verification profiles. The intended interpretation is the plausibility of risperidone and 9-hydroxyrisperidone exposure across CYP2D6 status, not a separate reoptimization for each clinical study.

Details about input data are provided in [Section 2.2](#22). Details about the structural model and assumptions are provided in [Section 2.3](#23).

## 2.2 Data used<a id="22"></a>

### 2.2.1 In vitro and physicochemical data

The table below summarizes the drug-dependent inputs documented for the risperidone model. Parameter values are listed for the parent compound and 9-hydroxyrisperidone where they are relevant for interpreting the parent-metabolite simulations.

| Parameter | Unit | Value | Source | Description |
| --- | ---: | ---: | --- | --- |
| Risperidone MW | g/mol | 410.48 | [Kneller 2020](References.md) | Parent compound size used in concentration conversions. |
| Risperidone pK<sub>a</sub> | - | 8.76, 3.11 | [Kneller 2020](References.md) | Basic and acidic ionization constants. |
| Risperidone f<sub>u</sub> | % | 17.50 | [Kneller 2020](References.md) | Plasma binding input for parent drug. |
| Risperidone CYP2D6 K<sub>m</sub> to 9-hydroxyrisperidone | µmol/L | 1.10 | [Kneller 2020](References.md) | CYP2D6 affinity parameter for metabolite formation. |
| Risperidone CYP2D6 k<sub>cat</sub> EM to 9-hydroxyrisperidone | 1/min | 1.07 | Optimized | CYP2D6 metabolic capacity in extensive metabolizers. |
| Risperidone P-gp K<sub>m</sub> | µmol/L | 26.30 | [Kneller 2020](References.md) | P-gp affinity parameter. |
| Risperidone P-gp k<sub>cat</sub> | 1/min | 12.72 | Optimized | P-gp transport capacity. |
| 9-Hydroxyrisperidone f<sub>u</sub> | % | 29.00 | [Kneller 2020](References.md) | Plasma binding input for the active metabolite. |
| 9-Hydroxyrisperidone P-gp K<sub>m</sub> | µmol/L | 149.60 | [Rüdesheim 2022](References.md) | P-gp affinity parameter for the active metabolite. |
| 9-Hydroxyrisperidone unspecific CL<sub>hep</sub> | 1/min | 0.08 | Optimized | Residual metabolite elimination. |
| GFR fraction | - | 1.00 | Assumed | Passive glomerular filtration fraction for parent and metabolite. |

The 9-hydroxyrisperidone P-gp K<sub>m</sub> reported in the publication and supplement by [Rüdesheim 2022](References.md) is erroneous. The model retains the correct value of 149.6 µmol/L.

### 2.2.2 Clinical data

The evaluation uses 19 observed-data records for risperidone and 9-hydroxyrisperidone in peripheral venous blood plasma. The evaluation plan assigns 6 simulations to model building and 6 simulations to model verification.

Model-building clinical data:

| Publication | Arm / Treatment / Information used for model building |
| --- | --- |
| [Novalbos 2010](References.md) | Plasma PK profiles in adults after oral, single dose administration of 1 mg risperidone with CYP2D6 AS = 2 status. |
| [Bondolfi 2002](References.md) | Plasma PK profiles in adults after oral, multiple dose administration of 2 mg risperidone with CYP2D6 poor- and extensive-metabolizer status. |
| [Markowitz 2002](References.md) | Plasma PK profiles in adults after oral, single dose administration of 1 mg risperidone with CYP2D6 extensive-metabolizer status. |
| [Darwish 2015](References.md) | Plasma PK profiles in adults after oral, single dose administration of 2 mg risperidone with CYP2D6 extensive-metabolizer status. |
| [Mahatthanatrakul 2012](References.md) | Plasma PK profiles in adults after oral, single dose administration of 2 mg risperidone with risperidone and 9-hydroxyrisperidone measurements. |

Model-verification clinical data:

| Publication | Arm / Treatment / Information used for model verification |
| --- | --- |
| [Novalbos 2010](References.md) | Plasma PK profiles in adults after oral, single dose administration of 1 mg risperidone with CYP2D6 AS = 0, AS = 1, and AS = 3 status. |
| [Nakagami 2005](References.md) | Plasma PK profiles in adults after oral, single dose administration of 1 mg risperidone with risperidone and 9-hydroxyrisperidone measurements. |
| [Mahatthanatrakul 2007](References.md) | Plasma PK profiles in adults after oral, single dose administration of 4 mg risperidone. |
| [Kim 2008](References.md) | Plasma PK profiles in adults after oral risperidone administration with rifampin pretreatment. |

## 2.3 Model parameters and assumptions<a id="23"></a>

### 2.3.1 Absorption

The model includes oral administration of risperidone. Oral absorption is represented with compound-specific intestinal permeability and formulation settings. The risperidone intestinal permeability was optimized, while the 9-hydroxyrisperidone intestinal permeability was calculated.

The clinical studies used for model building and verification are oral tablet studies, so the evaluation focuses on oral risperidone absorption and subsequent parent-metabolite disposition.

No intravenous risperidone data are included in the evaluation, so oral absorption and first-pass metabolism are coupled in the clinical concentration-time profiles. The `Specific intestinal permeability` parameter is therefore interpreted together with the metabolic parameters that determine parent and metabolite exposure after oral dosing.

The same oral absorption assumptions are used across CYP2D6 status groups. Phenotype and activity-score differences are assigned to metabolic capacity rather than to study-specific changes in absorption.

### 2.3.2 Distribution

Risperidone and 9-hydroxyrisperidone are represented with compound-specific plasma protein binding. Fraction unbound values of 17.50% for risperidone and 29.00% for 9-hydroxyrisperidone were used as summarized in [Section 2.2.1](#221-in-vitro-and-physicochemical-data).

Partition coefficients were calculated with the Rodgers and Rowland method. The parent-metabolite structure means that distribution affects both the parent concentration-time profile and the active-moiety profile.

The model uses separate physicochemical and distribution properties for risperidone and 9-hydroxyrisperidone. This is important because active moiety is a composite endpoint, while tissue distribution and plasma binding are compound-specific. The active-moiety comparison should therefore be read together with the individual parent and metabolite profiles.

Distribution was not fitted separately by phenotype. CYP2D6 status affects the rate of risperidone conversion to 9-hydroxyrisperidone, while the same adult physiology and compound-specific binding assumptions are retained across simulations.

### 2.3.3 Metabolism and Elimination

Two CYP-mediated pathways, transporter processes, renal filtration, and residual clearance pathways are represented in the model.

* CYP2D6

CYP2D6 converts risperidone to 9-hydroxyrisperidone. CYP2D6 activity is activity-score dependent. Poor-metabolizer activity is set to zero, while non-zero activity-score groups use fitted or scaled k<sub>cat</sub> values based on the CYP2D6 activity-score framework.

The CYP2D6 pathway controls both parent depletion and metabolite formation. For this reason, CYP2D6 parameterization affects risperidone, 9-hydroxyrisperidone, and active-moiety profiles in different directions. Parent-only diagnostics are not sufficient to evaluate this model.

* CYP3A4 and sink pathways

CYP3A4 contributes to risperidone metabolism. Additional sink pathways are included to capture clearance not explicitly assigned to CYP2D6-mediated 9-hydroxyrisperidone formation.

These pathways provide CYP2D6-independent clearance and prevent poor-metabolizer simulations from depending solely on renal elimination. Their interpretation is structural and empirical, because they represent clearance components not resolved as individual measured metabolites in the clinical evaluation.

* P-gp and renal elimination

P-gp transport is implemented for risperidone and 9-hydroxyrisperidone. Both compounds include passive renal filtration with a `GFR fraction` of 1. The metabolite also includes unspecific hepatic clearance as summarized in [Section 2.2.1](#221-in-vitro-and-physicochemical-data).

P-gp transport was retained for both parent and metabolite because it can affect intestinal and renal handling. Passive renal filtration uses the compound-specific fraction unbound and adult renal physiology. The additional metabolite clearance pathway captures elimination of 9-hydroxyrisperidone not represented by filtration alone.

### 2.3.4 Automated Parameter Identification

The following parameters were optimized by fitting the model to the data:

| Model Parameter |
| --- |
| CYP2D6 k<sub>cat</sub> values |
| CYP3A4 sink-related rates |
| P-gp transport k<sub>cat</sub> values |
| 9-hydroxyrisperidone unspecific CL<sub>hep</sub> |
| `Specific intestinal permeability` |

The optimized parameters were selected to describe oral absorption, parent-to-metabolite conversion, transporter contribution, and residual metabolite clearance. Physicochemical values and plasma protein binding values were kept as sourced inputs. This distinction is important for interpreting CYP2D6 activity-score simulations, because the exposure shift is driven by metabolic-capacity terms rather than by repeated adjustment of distribution or binding.

# 3 Results and Discussion<a id="3"></a>

The PBPK model for risperidone was developed and evaluated with clinical pharmacokinetic data after oral administration. The evaluation covers single-dose and multiple-dose oral administration, risperidone and 9-hydroxyrisperidone plasma concentration-time profiles, CYP2D6 poor-, extensive-, and activity-score stratified groups, and interaction settings relevant to CYP3A and P-gp.

The model-building data supported the parent-metabolite structure, CYP2D6-mediated 9-hydroxylation, CYP3A4 metabolism, P-gp transport, renal filtration, and residual metabolite clearance. Model-building studies included CYP2D6 activity-score or phenotype data from [Novalbos 2010](References.md), [Bondolfi 2002](References.md), and [Markowitz 2002](References.md), as well as studies with parent and metabolite measurements from [Darwish 2015](References.md) and [Mahatthanatrakul 2012](References.md). Verification included independent activity-score and interaction studies from [Novalbos 2010](References.md), [Nakagami 2005](References.md), [Mahatthanatrakul 2007](References.md), and [Kim 2008](References.md).

The model quantifies CYP2D6-mediated formation of 9-hydroxyrisperidone, CYP3A4-mediated metabolism, P-gp transport, passive renal filtration, and residual clearance of the active metabolite. The interpretation of model performance requires separate consideration of parent, metabolite, and active-moiety behavior. Parent risperidone profiles mainly test absorption, P-gp transport, and formation clearance. 9-hydroxyrisperidone profiles additionally test metabolite distribution, renal filtration, and residual hepatic clearance.

The next sections show:

1. the final model input parameters for the building blocks: [Section 3.1](#31).
2. the overall goodness of fit: [Section 3.2](#32).
3. simulated vs. observed concentration-time profiles for the clinical studies used for model building and for model verification: [Section 3.3](#33).

The merged GOF diagnostic over the included concentration observations gives GMFE values of 1.60 for risperidone, 1.71 for 9-hydroxyrisperidone, and 1.64 for all observations. These values show acceptable population-level agreement but are less tight than for some single-analyte CYP2D6 substrate models. The difference between parent and metabolite GMFE values should be considered when interpreting active-moiety predictions, because compensation between risperidone and 9-hydroxyrisperidone can mask analyte-specific bias.

[Rüdesheim 2022](References.md) reported strong DGI ratio performance for risperidone, with 7 of 7 AUClast ratios and 7 of 7 Cmax ratios within the prediction success limits. The reported GMFE values were 1.11 for AUClast ratios and 1.16 for Cmax ratios. These DGI ratio metrics support the activity-score implementation, while the concentration-time diagnostics below remain necessary for evaluating the full parent-metabolite model.

The concentration-time profiles should be reviewed by CYP2D6 activity group and analyte. CYP2D6 poor-metabolizer profiles test whether CYP3A4 metabolism and residual processes can describe parent clearance when CYP2D6 activity is absent. Higher activity-score groups test whether increased CYP2D6 k<sub>cat</sub> values improve parent-to-metabolite conversion without overpredicting 9-hydroxyrisperidone. Interaction studies involving rifampin or other modulators additionally test whether CYP3A and P-gp assumptions remain plausible beyond the base oral dosing studies.

The model is adequate for adult oral risperidone simulations within the represented doses, CYP2D6 groups, and measured analytes. Remaining interpretation should be cautious for unrepresented formulations, pediatric populations, and scenarios where the active moiety is used without checking parent and metabolite profiles separately.

## 3.1 Risperidone final input parameters<a id="31"></a>

The compound parameter values of the final PBPK model are illustrated below.

### Compound: Risperidone

#### Parameters

Name                                             | Value                   | Value Origin                                                | Alternative | Default
------------------------------------------------ | ----------------------- | ----------------------------------------------------------- | ----------- | -------
Solubility at reference pH                       | 0.171 mg/ml             | Publication-Other-Kneller et al. 2020                       | Measurement | True   
Reference pH                                     | 7.3                     | Publication-Other-Kneller et al. 2020                       | Measurement | True   
Lipophilicity                                    | 2.4 Log Units           | Publication-Other-Kneller et al. 2020                       | LogP        | True   
Fraction unbound (plasma, reference value)       | 17.5 %                  | Publication-Other-Kneller et al. 2020                       | Measurement | True   
Specific intestinal permeability (transcellular) | 8.0437234696E-06 cm/min | Parameter Identification-Parameter Identification-Optimized | Optimized   | True   
F                                                | 1                       |                                                             |             |        
Is small molecule                                | Yes                     |                                                             |             |        
Molecular weight                                 | 410.48 g/mol            |                                                             |             |        
Plasma protein binding partner                   | α1-acid glycoprotein    |                                                             |             |        

#### Calculation methods

Name                    | Value              
----------------------- | -------------------
Partition coefficients  | Rodgers and Rowland
Cellular permeabilities | PK-Sim Standard    

#### Processes

##### Metabolizing Enzyme: CYP2D6-AS=2 (9-hydroxylation)

Molecule: CYP2D6

Metabolite: 9-Hydroxyrisperidone

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 1.1 µmol/l                 | Other-Manual Fit                                           
kcat                                        | 3.1902307094 1/min         | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=2 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 1.1 µmol/l                 | Other-Manual Fit                                           
kcat                                        | 1.9418795623 1/min         | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP3A4-Okubo 2016 (9-hydroxylation)

Molecule: CYP3A4

Metabolite: 9-Hydroxyrisperidone

###### Parameters

Name                               | Value                      | Value Origin                         
---------------------------------- | -------------------------- | -------------------------------------
In vitro Vmax for liver microsomes | 0 pmol/min/mg mic. protein |                                      
Km                                 | 61 µmol/l                  | Publication-Other-Kneller et al. 2020
kcat                               | 0.7 1/min                  | Publication-Other-Kneller et al. 2020

##### Metabolizing Enzyme: CYP3A4-Okubo 2016 (sink)

Molecule: CYP3A4

###### Parameters

Name                               | Value                      | Value Origin                         
---------------------------------- | -------------------------- | -------------------------------------
In vitro Vmax for liver microsomes | 0 pmol/min/mg mic. protein |                                      
Km                                 | 61 µmol/l                  | Publication-Other-Kneller et al. 2020
kcat                               | 0.15 1/min                 | Publication-Other-Kneller et al. 2020

##### Transport Protein: ABCB1-Ejsing 2005

Molecule: ABCB1

###### Parameters

Name                      | Value              | Value Origin                                               
------------------------- | ------------------ | -----------------------------------------------------------
Transporter concentration | 1 µmol/l           |                                                            
Vmax                      | 0 µmol/l/min       |                                                            
Km                        | 26.3 µmol/l        |                                                            
kcat                      | 12.715199036 1/min | Parameter Identification-Parameter Identification-Optimized

##### Systemic Process: Glomerular Filtration-Assumed

Species: Human

###### Parameters

Name         | Value | Value Origin
------------ | -----:| ------------:
GFR fraction |     1 |             

##### Metabolizing Enzyme: CYP2D6-AS=0 (9-hydroxylation)

Molecule: CYP2D6

Metabolite: 9-Hydroxyrisperidone

###### Parameters

Name                                        | Value                      | Value Origin
------------------------------------------- | -------------------------- | ------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |             
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown     
Km                                          | 1.1 µmol/l                 |             

##### Metabolizing Enzyme: CYP2D6-AS=0 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin
------------------------------------------- | -------------------------- | ------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |             
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown     
Km                                          | 1.1 µmol/l                 |             

##### Metabolizing Enzyme: CYP2D6-AS=1 (9-hydroxylation)

Molecule: CYP2D6

Metabolite: 9-Hydroxyrisperidone

###### Parameters

Name                                        | Value                      | Value Origin    
------------------------------------------- | -------------------------- | ----------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                 
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown         
Km                                          | 1.1 µmol/l                 | Other-Manual Fit
kcat                                        | 1.2197940948 1/min         | Other-Manual Fit

##### Metabolizing Enzyme: CYP2D6-AS=1 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin    
------------------------------------------- | -------------------------- | ----------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                 
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown         
Km                                          | 1.1 µmol/l                 | Other-Manual Fit
kcat                                        | 0.742483362 1/min          | Other-Manual Fit

##### Metabolizing Enzyme: CYP2D6-AS=3 (9-hydroxylation)

Molecule: CYP2D6

Metabolite: 9-Hydroxyrisperidone

###### Parameters

Name                                        | Value                      | Value Origin    
------------------------------------------- | -------------------------- | ----------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                 
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown         
Km                                          | 1.1 µmol/l                 | Other-Manual Fit
kcat                                        | 5.911309844 1/min          | Other-Manual Fit

##### Metabolizing Enzyme: CYP2D6-AS=3 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin    
------------------------------------------- | -------------------------- | ----------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                 
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown         
Km                                          | 1.1 µmol/l                 | Other-Manual Fit
kcat                                        | 3.5981886007 1/min         | Other-Manual Fit

##### Metabolizing Enzyme: CYP2D6-Okubo 2016 (9-hydroxylation)

Molecule: CYP2D6

Metabolite: 9-Hydroxyrisperidone

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 1.1 µmol/l                 |                                                            
kcat                                        | 1.07 1/min                 | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-Okubo 2016 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin                                               
------------------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                                                            
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown                                                    
Km                                          | 1.1 µmol/l                 |                                                            
kcat                                        | 0.67 1/min                 | Parameter Identification-Parameter Identification-Optimized

##### Metabolizing Enzyme: CYP2D6-AS=1.25 (9-hydroxylation)

Molecule: CYP2D6

Metabolite: 9-Hydroxyrisperidone

###### Parameters

Name                                        | Value                      | Value Origin    
------------------------------------------- | -------------------------- | ----------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                 
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown         
Km                                          | 1.1 µmol/l                 |                 
kcat                                        | 1.66 1/min                 | Other-Manual Fit

##### Metabolizing Enzyme: CYP2D6-AS=1.25 (sink)

Molecule: CYP2D6

###### Parameters

Name                                        | Value                      | Value Origin    
------------------------------------------- | -------------------------- | ----------------
In vitro Vmax for liver microsomes          | 0 pmol/min/mg mic. protein |                 
Content of CYP proteins in liver microsomes | 10 pmol/mg mic. protein    | Unknown         
Km                                          | 1.1 µmol/l                 |                 
kcat                                        | 1.01 1/min                 | Other-Manual Fit

### Compound: 9-Hydroxyrisperidone

#### Parameters

Name                                       | Value                | Value Origin                          | Alternative | Default
------------------------------------------ | -------------------- | ------------------------------------- | ----------- | -------
Solubility at reference pH                 | 0.171 mg/ml          | Publication-Other-Kneller et al. 2020 | Measurement | True   
Reference pH                               | 7.3                  | Publication-Other-Kneller et al. 2020 | Measurement | True   
Lipophilicity                              | 2.1 Log Units        | Publication-Other-Kneller et al. 2020 | LogP        | True   
Fraction unbound (plasma, reference value) | 29 %                 | Publication-Other-Kneller et al. 2020 | Measurement | True   
F                                          | 1                    |                                       |             |        
Is small molecule                          | Yes                  |                                       |             |        
Molecular weight                           | 426.48 g/mol         |                                       |             |        
Plasma protein binding partner             | α1-acid glycoprotein |                                       |             |        

#### Calculation methods

Name                    | Value              
----------------------- | -------------------
Partition coefficients  | Rodgers and Rowland
Cellular permeabilities | PK-Sim Standard    

#### Processes

##### Systemic Process: Total Hepatic Clearance-Assumption

Species: Human

###### Parameters

Name                          | Value              | Value Origin                                               
----------------------------- | ------------------ | -----------------------------------------------------------
Fraction unbound (experiment) | 0.26               |                                                            
Lipophilicity (experiment)    | 1.76 Log Units     |                                                            
Plasma clearance              | 0 ml/min/kg        |                                                            
Specific clearance            | 0.0821152637 1/min | Parameter Identification-Parameter Identification-Optimized

##### Systemic Process: Glomerular Filtration-Assumption

Species: Human

###### Parameters

Name         | Value | Value Origin
------------ | -----:| ------------:
GFR fraction |     1 |             

##### Transport Protein: ABCB1-Ejsing 2005

Molecule: ABCB1

###### Parameters

Name                      | Value                 | Value Origin                                               
------------------------- | --------------------- | -----------------------------------------------------------
Transporter concentration | 1 µmol/l              |                                                            
Vmax                      | 0 µmol/l/min          |                                                            
Km                        | 149.6 µmol/l          |                                                            
kcat                      | 0.0057047043998 1/min | Parameter Identification-Parameter Identification-Optimized

## 3.2 Diagnostic plots<a id="32"></a>

Below you find the goodness-of-fit visual diagnostic plots for PBPK model performance of all data used, as presented in Section 2.2.2 (Clinical data).

The first plot shows observed versus simulated plasma concentration, the second weighted residuals versus time.

### 3.2.1 Risperidone goodness-of-fit diagnostics<a id="321"></a>

Below you find the goodness-of-fit visual diagnostic plots for risperidone plasma concentration data used in the model evaluation.

The first plot shows observed versus simulated plasma concentration, the second weighted residuals versus time.

<a id="table-3-1"></a>

**Table 3-1: GMFE for Risperidone observed versus simulated plasma concentration-time data**

|Group       |GMFE |
|:-----------|:----|
|Risperidone |1.30 |

<br>
<br>

<a id="figure-3-1"></a>

![](images/006_section_3/008_section_32/009_section_321/2_gof_plot_predictedVsObserved.png)

**Figure 3-1: Risperidone observed versus simulated plasma concentration-time data**

<br>
<br>

<a id="figure-3-2"></a>

![](images/006_section_3/008_section_32/009_section_321/3_gof_plot_residualsOverTime.png)

**Figure 3-2: Risperidone observed versus simulated plasma concentration-time data**

<br>
<br>

### 3.2.2 9-Hydroxyrisperidone goodness-of-fit diagnostics<a id="322"></a>

Below you find the goodness-of-fit visual diagnostic plots for 9-hydroxyrisperidone plasma concentration data used in the model evaluation.

The first plot shows observed versus simulated plasma concentration, the second weighted residuals versus time.

<a id="table-3-2"></a>

**Table 3-2: GMFE for 9-Hydroxyrisperidone observed versus simulated plasma concentration-time data**

|Group                |GMFE |
|:--------------------|:----|
|9-Hydroxyrisperidone |1.31 |

<br>
<br>

<a id="figure-3-3"></a>

![](images/006_section_3/008_section_32/010_section_322/5_gof_plot_predictedVsObserved.png)

**Figure 3-3: 9-Hydroxyrisperidone observed versus simulated plasma concentration-time data**

<br>
<br>

<a id="figure-3-4"></a>

![](images/006_section_3/008_section_32/010_section_322/6_gof_plot_residualsOverTime.png)

**Figure 3-4: 9-Hydroxyrisperidone observed versus simulated plasma concentration-time data**

<br>
<br>

## 3.3 Concentration-time profiles<a id="33"></a>

Simulated versus observed concentration-time profiles of all data listed in Section 2.2.2 (Clinical data) are presented below.

### 3.3.1 Model Building<a id="331"></a>

<a id="figure-3-5"></a>

![](images/006_section_3/011_section_33/012_section_331/2_time_profile_plot_Risperidone_Novalbos__2010____risperidone__1_mg__po__n_33__AS_2_.png)

**Figure 3-5: Time Profile Analysis**

<br>
<br>

<a id="figure-3-6"></a>

![](images/006_section_3/011_section_33/012_section_331/5_time_profile_plot_Risperidone_Bondolfi__2001____risperidone__2_mg__po__md__n_2__PM_.png)

**Figure 3-6: Time Profile Analysis**

<br>
<br>

<a id="figure-3-7"></a>

![](images/006_section_3/011_section_33/012_section_331/6_time_profile_plot_Risperidone_Bondolfi__2001____risperidone__2_mg__po__md__n_8__EM_.png)

**Figure 3-7: Time Profile Analysis**

<br>
<br>

<a id="figure-3-8"></a>

![](images/006_section_3/011_section_33/012_section_331/8_time_profile_plot_Risperidone_Markowitz__2002____risperidone__1_mg__po__n_14__EM_.png)

**Figure 3-8: Time Profile Analysis**

<br>
<br>

<a id="figure-3-9"></a>

![](images/006_section_3/011_section_33/012_section_331/10_time_profile_plot_Risperidone_Darwish__2015____risperidone__2_mg__po__n_36__EM_.png)

**Figure 3-9: Time Profile Analysis**

<br>
<br>

<a id="figure-3-10"></a>

![](images/006_section_3/011_section_33/012_section_331/11_time_profile_plot_Risperidone_Mahatthanatrakul__2012____risperidone__2_mg__po__n_10__EM_.png)

**Figure 3-10: Time Profile Analysis**

<br>
<br>

### 3.3.2 Model Verification<a id="332"></a>

<a id="figure-3-11"></a>

![](images/006_section_3/011_section_33/013_section_332/1_time_profile_plot_Risperidone_Novalbos__2010____risperidone__1_mg__po__n_26__AS_1_.png)

**Figure 3-11: Time Profile Analysis**

<br>
<br>

<a id="figure-3-12"></a>

![](images/006_section_3/011_section_33/013_section_332/3_time_profile_plot_Risperidone_Novalbos__2010____risperidone__1_mg__po__n_6__AS_0_.png)

**Figure 3-12: Time Profile Analysis**

<br>
<br>

<a id="figure-3-13"></a>

![](images/006_section_3/011_section_33/013_section_332/4_time_profile_plot_Risperidone_Novalbos__2010____risperidone__1_mg__po__n_6__AS_3_.png)

**Figure 3-13: Time Profile Analysis**

<br>
<br>

<a id="figure-3-14"></a>

![](images/006_section_3/011_section_33/013_section_332/7_time_profile_plot_Risperidone_Nakagami__2005___risperidone__1_mg__po__n_12__AS_1_.png)

**Figure 3-14: Time Profile Analysis**

<br>
<br>

<a id="figure-3-15"></a>

![](images/006_section_3/011_section_33/013_section_332/9_time_profile_plot_Risperidone_Mahatthanatrakul__2007____risperidone__4_mg__po___n_10__EM_.png)

**Figure 3-15: Time Profile Analysis**

<br>
<br>

<a id="figure-3-16"></a>

![](images/006_section_3/011_section_33/013_section_332/12_time_profile_plot_Risperidone_Kim__2018____risperidone__1_mg__po__n___10__AS___1_25_.png)

**Figure 3-16: Time Profile Analysis**

<br>
<br>

# 4 Conclusion<a id="4"></a>

The presented PBPK model adequately describes the oral pharmacokinetics of risperidone and 9-hydroxyrisperidone in the evaluated adult CYP2D6 phenotype and activity-score groups.

# 5 References<a id="5"></a>

1. Rüdesheim S, Selzer D, Mürdter T, Igel S, Kerb R, Schwab M, Lehr T. Physiologically Based Pharmacokinetic Modeling to Describe the CYP2D6 Activity Score-Dependent Metabolism of Paroxetine, Atomoxetine and Risperidone. Pharmaceutics. 2022;14:1734. doi:10.3390/pharmaceutics14081734.
2. Rüdesheim S, Loer HLH, Feick D, Marok FZ, Fuhr LM, Selzer D, et al. A Comprehensive CYP2D6 Drug-Drug-Gene Interaction Network for Application in Precision Dosing and Drug Development. Clin Pharmacol Ther. 2025.
3. Kneller LA, Abad-Santos F, Hempel G. Physiologically Based Pharmacokinetic Modelling to Describe the Pharmacokinetics of Risperidone and 9-Hydroxyrisperidone According to Cytochrome P450 2D6 Phenotypes. Clin Pharmacokinet. 2020;59:51-65. doi:10.1007/s40262-019-00793-x.
4. Novalbos J, López-Rodríguez R, Román M, Gallego-Sadín S, Ochoa D, Abad-Santos F. Effects of CYP2D6 genotype on the pharmacokinetics, pharmacodynamics, and safety of risperidone in healthy volunteers. J Clin Psychopharmacol. 2010;30:504-511. doi:10.1097/JCP.0b013e3181ee84c7.
5. Bondolfi G, Eap CB, Bertschy G, Zullino D, Vermeulen A, Baumann P. The effect of fluoxetine on the pharmacokinetics and safety of risperidone in psychotic patients. Pharmacopsychiatry. 2002;35:50-56. doi:10.1055/s-2002-25026.
6. Markowitz JS, DeVane CL, Liston HL, Boulton DW, Risch SC. The effects of probenecid on the disposition of risperidone and olanzapine in healthy volunteers. Clin Pharmacol Ther. 2002;71:30-38. doi:10.1067/mcp.2002.119815.
7. Darwish M, Bond M, Yang R, Hellriegel ET, Robertson P. Evaluation of Potential Pharmacokinetic Drug-Drug Interaction Between Armodafinil and Risperidone in Healthy Adults. Clin Drug Investig. 2015;35:725-733. doi:10.1007/s40261-015-0330-6.
8. Mahatthanatrakul W, Sriwiriyajan S, Ridtitid W, Boonleang J, Wongnawa M, Rujimamahasan N, Pipatrattanaseree W. Effect of cytochrome P450 3A4 inhibitor ketoconazole on risperidone pharmacokinetics in healthy volunteers. J Clin Pharm Ther. 2012;37:221-225. doi:10.1111/j.1365-2710.2011.01271.x.
9. Nakagami T, Yasui-Furukori N, Saito M, Tateishi T, Kaneo S. Effect of verapamil on pharmacokinetics and pharmacodynamics of risperidone. Clin Pharmacol Ther. 2005;78:43-51. doi:10.1016/j.clpt.2005.03.009.
10. Kim KA, Park PW, Liu KH, Kim KB, Kim HJ, Shin JG, Park JY. Effect of rifampin, an inducer of CYP3A and P-glycoprotein, on the pharmacokinetics of risperidone. J Clin Pharmacol. 2008;48:66-72. doi:10.1177/0091270007309888.
11. Mahatthanatrakul W, Nontaput T, Ridtitid W, Wongnawa M, Sunbhanich M. Rifampin decreases plasma concentrations of risperidone in healthy volunteers. J Clin Pharm Ther. 2007;32:161-167. doi:10.1111/j.1365-2710.2007.00811.x.

12. Kuepfer L, Niederalt C, Wendl T, Schlender JF, Willmann S, Lippert J, Block M, Eissing T, Teutonico D. Applied Concepts in PBPK Modeling: How to Build a PBPK/PD Model. CPT Pharmacometrics Syst Pharmacol. 2016;5:516-531.

13. Willmann S, Höhn K, Edginton A, Sevestre M, Solodenko J, Weiss W, Lippert J, Schmitt W. Development of a physiology-based whole-body population model for assessing the influence of individual variability on the pharmacokinetics of drugs. J Pharmacokinet Pharmacodyn. 2007;34:401-431.

