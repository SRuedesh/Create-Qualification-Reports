---
title: "Ketoconazole Evaluation Report"
subtitle: "Whole-body PBPK model of ketoconazole and metabolites"
author: "Open Systems Pharmacology"
date: "evaluation"
version: "vevaluation"
release: "12.2"
osp_version: "3.5"
---

# Table of Contents

 * [1 Introduction](#1)
 * [2 Methods](#2)
   * [2.1 Modeling strategy](#21)
   * [2.2 Data used](#22)
   * [2.3 Model parameters and assumptions](#23)
 * [3 Results and Discussion](#3)
   * [3.1 Ketoconazole final input parameters](#31)
   * [3.2 Diagnostic plots](#32)
     * [3.2.1 Ketoconazole goodness-of-fit diagnostics](#321)
     * [3.2.2 N-deacetylketoconazole goodness-of-fit diagnostics](#322)
   * [3.3 Concentration-time profiles](#33)
     * [3.3.1 Solution and capsule-as-solution studies](#331)
     * [3.3.2 Fasted tablet studies](#332)
     * [3.3.3 Fed tablet and food-effect studies](#333)
     * [3.3.4 Multiple-dose studies](#334)
 * [4 Conclusion](#4)
 * [5 References](#5)

# 1 Introduction<a id="1"></a>

Ketoconazole is an imidazole antifungal and a strong inhibitor of CYP3A4 and P-gp. Although oral ketoconazole use is restricted because of safety concerns, ketoconazole remains a clinically important reference perpetrator for CYP3A4-mediated and transporter-mediated drug-drug interaction assessments.

The model describes ketoconazole together with the circulating metabolites N-deacetylketoconazole and N-deacetyl-N-hydroxyketoconazole. The parent-metabolite structure was developed to capture ketoconazole pharmacokinetics after oral dosing and to quantify the contribution of parent and metabolites to CYP3A4 and P-gp inhibition [Marok 2023](References.md). The model is used here to evaluate the oral ketoconazole pharmacokinetic data included in the model publication and to document the mechanistic assumptions relevant for DFI and DDI applications.

# 2 Methods<a id="2"></a>

## 2.1 Modeling strategy<a id="21"></a>

The general strategy for model development was based on a middle-out PBPK workflow. Drug-dependent parameters were taken from experimental data or estimated using established in silico methods where possible. Parameters that could not be fixed from independent evidence were optimized against clinical concentration-time profiles and then evaluated using independent oral dosing scenarios.

The model was implemented as a parent-metabolite model for ketoconazole, N-deacetylketoconazole and N-deacetyl-N-hydroxyketoconazole. Ketoconazole plasma profiles from oral solution, capsule-as-solution and tablet studies were used to inform absorption, dissolution and disposition parameters, while the Weiss et al. clinical data provided the only plasma concentration-time profiles for N-deacetylketoconazole [Weiss 2022](References.md).

Ketoconazole absorption was evaluated across fasted and fed dosing conditions, including solution, capsule-as-solution and tablet formulations. The model includes CYP3A4-mediated metabolism, arylacetamide deacetylase-mediated N-deacetylketoconazole formation, UGT1A4-mediated metabolism, P-gp transport and reversible inhibition of CYP3A4 and P-gp by ketoconazole and metabolites. The resulting model structure supports both concentration-time profile evaluation and DFI or DDI perpetrator simulations [Marok 2023](References.md).

## 2.2 Data used<a id="22"></a>

Clinical plasma concentration-time profiles were taken from the published studies compiled for the model publication [Marok 2023](References.md). The dataset covers oral single-dose and multiple-dose ketoconazole administration in adults, fasted and fed states, and doses from 100 mg to 1200 mg.

| Publication | Data used |
| --- | --- |
| [Heel 1982](References.md) | Oral solution and tablet ketoconazole studies in adults under fasted conditions. |
| [Daneshmend 1981](References.md), [Daneshmend 1983](References.md), [Daneshmend 1984](References.md) | Oral ketoconazole studies in adults covering fasted, fed, single-dose and multiple-dose administration. |
| [Huang 1986](References.md) | Oral solution and tablet ketoconazole data in healthy adults. |
| [Polk 1999](References.md), [Boyce 2012](References.md), [Tiseo 1998](References.md), [Craven 1983](References.md), [Männistö 1982](References.md), [Greenblatt 1998](References.md) | Oral ketoconazole clinical data used to evaluate formulation, food-effect and multiple-dose performance. |
| [Weiss 2022](References.md) | Oral ketoconazole study in adults with plasma profiles for ketoconazole and N-deacetylketoconazole. |

Physicochemical, transporter and metabolic information was taken from experimental literature and in silico calculations. Ketoconazole and metabolite pK<sub>a</sub>, lipophilicity and solubility parameters were informed by Chemicalize and formulation-relevant dissolution data, while in vitro metabolism and inhibition data were taken from studies on AADAC, CYP3A4, P-gp and UGT pathways [Fukami 2016](References.md), [Fitch 2009](References.md), [Schwab 2003](References.md), [Bourcier 2010](References.md), [Weiss 2022](References.md).

The FMO3 K<sub>m</sub> value of 1.17 µmol/L implemented for N-deacetylketoconazole is correct. The corresponding value reported by [Marok 2023](References.md) is erroneous.

## 2.3 Model parameters and assumptions<a id="23"></a>

#### Absorption and formulations

The model includes oral solution, capsule-as-solution and tablet applications. Solution and capsule-as-solution scenarios were used to separate systemic disposition from dissolution-limited tablet absorption. Tablet absorption was described with formulation-specific dissolution and particle-size assumptions, with fed-state scenarios used to describe the reduced and delayed absorption observed for weak-base ketoconazole under altered gastrointestinal conditions [Marok 2023](References.md), Table 1.

#### Distribution

Ketoconazole is a weak base with high plasma protein binding and pH-dependent solubility. Distribution parameters were based on physicochemical properties and PBPK tissue partitioning methods, with optimized lipophilicity where required to reproduce systemic exposure. The metabolites were represented as separate compounds with their own physicochemical properties and protein-binding assumptions [Marok 2023](References.md), Table 1.

#### Metabolism, transport and inhibition

Ketoconazole metabolism includes formation of N-deacetylketoconazole by arylacetamide deacetylase and further metabolism through CYP3A4 and UGT pathways. Ketoconazole and metabolites were represented as CYP3A4 and P-gp inhibitors, which is required to describe the observed DDI perpetrator behavior more accurately than a parent-only inhibition model [Marok 2023](References.md), Table 1, and [Weiss 2022](References.md).

# 3 Results and Discussion<a id="3"></a>

The concentration-time profiles cover oral solution, capsule-as-solution and tablet administration under fasted and fed conditions. The model reproduced the broad exposure range across doses and formulations, including the delayed and reduced absorption observed in fed tablet scenarios.

The ketoconazole goodness-of-fit diagnostics summarize the parent plasma data across the full clinical dataset. N-deacetylketoconazole diagnostics are shown separately because metabolite observations are only available from the Weiss et al. study. This split avoids mixing parent and metabolite observations in a single legend and keeps analyte-specific performance interpretable.

In the model publication, the parent-metabolite model described 53 plasma concentration-time profiles, with 49/53 profiles, 50/53 AUC<sub>last</sub> values and 52/53 C<sub>max</sub> values within twofold [Marok 2023](References.md), Table 2. DFI performance was adequate across the evaluated food-effect ratios, with 7/7 AUC<sub>last</sub> and C<sub>max</sub> ratios within the reported acceptance limits [Marok 2023](References.md), Table 3. For DDI simulations, including ketoconazole and both metabolites as CYP3A4 and P-gp inhibitors improved perpetrator performance compared with parent-only inhibition [Marok 2023](References.md).

## 3.1 Ketoconazole final input parameters<a id="31"></a>

The following tables are generated from the model and summarize the final compound input parameters for ketoconazole, N-deacetylketoconazole and N-deacetyl-N-hydroxyketoconazole. Optimized parameters should be interpreted together with the source references and model assumptions described in Section 2.3.

### Compound: Ketoconazole

#### Parameters

Name                                             | Value                    | Value Origin                                                | Alternative | Default
------------------------------------------------ | ------------------------ | ----------------------------------------------------------- | ----------- | -------
Solubility table                                 | 12872590000000 mg/l      | Publication-In Vitro-Extrapolated from observed data        | Ghazal 2015 | True   
Lipophilicity                                    | 2.5243939623 Log Units   | Parameter Identification-Parameter Identification-Optimized | fit         | True   
Fraction unbound (plasma, reference value)       | 0.01                     | Publication-Other                                           | Heel 1982   | True   
Specific intestinal permeability (transcellular) | 1.5597039897E-05 cm/min  | Parameter Identification-Parameter Identification-Optimized | Fit fasted  | True   
Specific intestinal permeability (transcellular) | 9.9497068191E-06 cm/min  | Parameter Identification-Parameter Identification-Optimized | Fit fed     | False  
Cl                                               | 2                        | Internet-Other-Chemicalize                                  |             |        
Is small molecule                                | Yes                      |                                                             |             |        
Molecular weight                                 | 531.43 g/mol             | Internet-Other-Chemicalize                                  |             |        
Plasma protein binding partner                   | Albumin                  |                                                             |             |        
Treat precipitated drug as                       | Insoluble                | Unknown                                                     |             |        
Aqueous diffusion coefficient                    | 3.7482784124E-07 dm²/min | Parameter Identification-Parameter Identification-Optimized |             |        
Density (drug)                                   | 1.4 g/cm³                | Internet-Other-ChemSpider                                   |             |        
Enable supersaturation                           | Yes                      | Unknown                                                     |             |        

#### Calculation methods

Name                    | Value          
----------------------- | ---------------
Partition coefficients  | Berezhkovskiy  
Cellular permeabilities | PK-Sim Standard

#### Processes

##### Metabolizing Enzyme: CYP3A4-Assumed

Molecule: CYP3A4

###### Parameters

Name                               | Value                      | Value Origin                                               
---------------------------------- | -------------------------- | -----------------------------------------------------------
In vitro Vmax for liver microsomes | 0 pmol/min/mg mic. protein |                                                            
Km                                 | 0.008461538 µmol/l         | Other-Assumption-Assumed from Ki value from Weiss 2022     
kcat                               | 0.1020204084 1/min         | Parameter Identification-Parameter Identification-Optimized

##### Transport Protein: ABCB1-Assumed

Molecule: ABCB1

###### Parameters

Name                      | Value             | Value Origin                                               
------------------------- | ----------------- | -----------------------------------------------------------
Transporter concentration | 1 µmol/l          |                                                            
Vmax                      | 0 µmol/l/min      |                                                            
Km                        | 0.04 µmol/l       | Other-Assumption-Assumed from Ki value from Weiss 2022     
kcat                      | 0.326999715 1/min | Parameter Identification-Parameter Identification-Optimized

##### Systemic Process: Glomerular Filtration-GFR

Species: Human

###### Parameters

Name         | Value | Value Origin
------------ | -----:| ------------:
GFR fraction |     1 |             

##### Metabolizing Enzyme: UGT1A4-Bourcier 2010

Molecule: UGT1A4

###### Parameters

Name                             | Value                       | Value Origin                                               
-------------------------------- | --------------------------- | -----------------------------------------------------------
In vitro Vmax/recombinant enzyme | 0 nmol/min/pmol rec. enzyme |                                                            
Km                               | 7 µmol/l                    | Publication-In Vitro-recombinant enzymes                   
kcat                             | 0.3062809592 1/min          | Parameter Identification-Parameter Identification-Optimized

##### Inhibition: CYP3A4-Weiss 2022

Molecule: CYP3A4

###### Parameters

Name | Value              | Value Origin                                                     
---- | ------------------ | -----------------------------------------------------------------
Ki   | 0.008461538 µmol/l | Publication-In Vitro-Calculated from IC50 and corrected for fumic

##### Metabolizing Enzyme: AADAC-Fukami 2016

Molecule: AADAC

Metabolite: N-deacetylketoconazole

###### Parameters

Name                               | Value                         | Value Origin                                                      
---------------------------------- | ----------------------------- | ------------------------------------------------------------------
In vitro Vmax for liver microsomes | 28.3 pmol/min/mg mic. protein |                                                                   
Km                                 | 1.8797 µmol/l                 | Publication-In Vitro-Corrected with f<sub>u,mic</sub> (17.5*0.107)
kcat                               | 0.8694012741 1/min            | Parameter Identification-Parameter Identification-Optimized       

##### Inhibition: ABCB1-Weiss 2022

Molecule: ABCB1

###### Parameters

Name | Value              | Value Origin                                   
---- | ------------------ | -----------------------------------------------
Ki   | 0.035238095 µmol/l | Publication-In Vitro-Calculated from IC50 value

### Compound: N-deacetylketoconazole

#### Parameters

Name                                       | Value                  | Value Origin                                                | Alternative | Default
------------------------------------------ | ---------------------- | ----------------------------------------------------------- | ----------- | -------
Solubility at reference pH                 | 1.24 mg/ml             | Internet-Other-Chemicalize                                  | Chemicalize | True   
Reference pH                               | 6.5                    | Internet-Other-Chemicalize                                  | Chemicalize | True   
Lipophilicity                              | 3.7501327278 Log Units | Parameter Identification-Parameter Identification-Optimized | Fit         | True   
Fraction unbound (plasma, reference value) | 1 %                    | Other-Assumption-assumed from value for Ketoconazole        | Assumed     | True   
Cl                                         | 2                      | Internet-Other-Chemicalize                                  |             |        
Is small molecule                          | Yes                    |                                                             |             |        
Molecular weight                           | 489.4 g/mol            | Internet-Other-Chemicalize                                  |             |        
Plasma protein binding partner             | Albumin                |                                                             |             |        

#### Calculation methods

Name                    | Value                   
----------------------- | ------------------------
Partition coefficients  | Rodgers and Rowland     
Cellular permeabilities | Charge dependent Schmitt

#### Processes

##### Inhibition: CYP3A4-Weiss 2022

Molecule: CYP3A4

###### Parameters

Name | Value        | Value Origin                                                     
---- | ------------ | -----------------------------------------------------------------
Ki   | 0.022 µmol/l | Publication-In Vitro-Calculated from IC50 and corrected for fumic

##### Systemic Process: Glomerular Filtration-GFR

Species: Human

###### Parameters

Name         | Value | Value Origin
------------ | -----:| ------------:
GFR fraction |     1 |             

##### Metabolizing Enzyme: FMO3-Rodriguez 1997

Molecule: FMO3

###### Parameters

Name                               | Value                      | Value Origin                                                                                    
---------------------------------- | -------------------------- | ------------------------------------------------------------------------------------------------
In vitro Vmax for liver microsomes | 0 pmol/min/mg mic. protein |                                                                                                 
Km                                 | 1.167401215 µmol/l         | Publication-In Vitro-recombinant enzymes; model value is correct, publication value is erroneous
kcat                               | 378.6506200467 1/min       | Parameter Identification-Parameter Identification-Optimized                                     

##### Inhibition: ABCB1-Weiss 2022

Molecule: ABCB1

###### Parameters

Name | Value              | Value Origin                             
---- | ------------------ | -----------------------------------------
Ki   | 0.119047619 µmol/l | Publication-In Vitro-Calculated from IC50

### Compound: N-deacetyl-N-hydroxyketoconazole

#### Parameters

Name                                       | Value         | Value Origin                                               | Alternative | Default
------------------------------------------ | ------------- | ---------------------------------------------------------- | ----------- | -------
Solubility at reference pH                 | 0.0044 mg/ml  | Internet-Other-Chemicalize                                 | Chemicalize | True   
Reference pH                               | 6.5           | Internet-Other-Chemicalize                                 | Chemicalize | True   
Lipophilicity                              | 4.2 Log Units | Internet-Other-Chemicalize                                 | Chemicalize | True   
Fraction unbound (plasma, reference value) | 1 %           | Publication-Assumption-assumed from value for Ketoconazole | Assumed     | True   
Permeability                               | 0 cm/min      |                                                            | Assumed     | True   
Cl                                         | 2             | Internet-Other-Chemicalize                                 |             |        
Is small molecule                          | Yes           |                                                            |             |        
Molecular weight                           | 505.4 g/mol   | Internet-Other-Chemicalize                                 |             |        
Plasma protein binding partner             | Albumin       |                                                            |             |        

#### Calculation methods

Name                    | Value                   
----------------------- | ------------------------
Partition coefficients  | Berezhkovskiy           
Cellular permeabilities | Charge dependent Schmitt

#### Processes

##### Inhibition: CYP3A4-Weiss 2022

Molecule: CYP3A4

###### Parameters

Name | Value        | Value Origin                                                  
---- | ------------ | --------------------------------------------------------------
Ki   | 0.022 µmol/l | Other-Assumption-assumed from value for N-deacetylketoconazole

##### Systemic Process: Glomerular Filtration-GFR

Species: Human

###### Parameters

Name         | Value | Value Origin
------------ | -----:| ------------:
GFR fraction |     1 |             

##### Inhibition: ABCB1-Weiss 2022

Molecule: ABCB1

###### Parameters

Name | Value              | Value Origin                                                  
---- | ------------------ | --------------------------------------------------------------
Ki   | 0.119047619 µmol/l | Other-Assumption-assumed from value for N-deacetylketoconazole

##### Metabolizing Enzyme: FMO3-Clearance

Molecule: FMO3

###### Parameters

Name                           | Value                     | Value Origin                                               
------------------------------ | ------------------------- | -----------------------------------------------------------
In vitro CL/recombinant enzyme | 0 µl/min/pmol rec. enzyme |                                                            
CLspec/[Enzyme]                | 0.0893329451 l/µmol/min   | Parameter Identification-Parameter Identification-Optimized

## 3.2 Diagnostic plots<a id="32"></a>

Goodness-of-fit diagnostics are separated by analyte. Ketoconazole and N-deacetylketoconazole observations are evaluated in separate sections to preserve analyte-specific mappings, colors and residual diagnostics.

### 3.2.1 Ketoconazole goodness-of-fit diagnostics<a id="321"></a>

Ketoconazole parent plasma observations are mapped to the ketoconazole plasma output.

<a id="table-3-1"></a>

**Table 3-1: GMFE for Ketoconazole observed versus simulated plasma concentration-time data**

|Group        |GMFE |
|:------------|:----|
|Ketoconazole |1.69 |

<br>
<br>

<a id="figure-3-1"></a>

![](images/006_section_3/008_section_32/009_section_321/2_gof_plot_predictedVsObserved.png)

**Figure 3-1: Ketoconazole observed versus simulated plasma concentration-time data**

<br>
<br>

<a id="figure-3-2"></a>

![](images/006_section_3/008_section_32/009_section_321/3_gof_plot_residualsOverTime.png)

**Figure 3-2: Ketoconazole observed versus simulated plasma concentration-time data**

<br>
<br>

### 3.2.2 N-deacetylketoconazole goodness-of-fit diagnostics<a id="322"></a>

N-deacetylketoconazole plasma observations are mapped to the metabolite plasma output.

<a id="table-3-2"></a>

**Table 3-2: GMFE for N-deacetylketoconazole observed versus simulated plasma concentration-time data**

|Group                  |GMFE |
|:----------------------|:----|
|N-deacetylketoconazole |1.93 |

<br>
<br>

<a id="figure-3-3"></a>

![](images/006_section_3/008_section_32/010_section_322/5_gof_plot_predictedVsObserved.png)

**Figure 3-3: N-deacetylketoconazole observed versus simulated plasma concentration-time data**

<br>
<br>

<a id="figure-3-4"></a>

![](images/006_section_3/008_section_32/010_section_322/6_gof_plot_residualsOverTime.png)

**Figure 3-4: N-deacetylketoconazole observed versus simulated plasma concentration-time data**

<br>
<br>

## 3.3 Concentration-time profiles<a id="33"></a>

Concentration-time profiles are grouped by formulation and dosing context. Solution and capsule-as-solution scenarios are shown separately from tablet studies because they inform different absorption assumptions.

### 3.3.1 Solution and capsule-as-solution studies<a id="331"></a>

This section contains oral solution and capsule-as-solution studies used to evaluate absorption without tablet dissolution as the dominant limitation.

<a id="figure-3-5"></a>

![](images/006_section_3/011_section_33/012_section_331/1_time_profile_plot_Ketoconazole_Heel__1982___KTZ_200_mg_solution__fasted__114_.png)

**Figure 3-5: Time Profile Analysis**

<br>
<br>

<a id="figure-3-6"></a>

![](images/006_section_3/011_section_33/012_section_331/2_time_profile_plot_Ketoconazole_Huang__1986___KTZ_200_mg_solution__fasted__3_.png)

**Figure 3-6: Time Profile Analysis**

<br>
<br>

<a id="figure-3-7"></a>

![](images/006_section_3/011_section_33/012_section_331/3_time_profile_plot_Ketoconazole_Huang__1986___KTZ_200_mg_solution__fasted__4_.png)

**Figure 3-7: Time Profile Analysis**

<br>
<br>

<a id="figure-3-8"></a>

![](images/006_section_3/011_section_33/012_section_331/4_time_profile_plot_Ketoconazole_Tiseo__1998___KTZ_200_mg_solution__fasted__81_.png)

**Figure 3-8: Time Profile Analysis**

<br>
<br>

<a id="figure-3-9"></a>

![](images/006_section_3/011_section_33/012_section_331/5_time_profile_plot_Ketoconazole_Huang__1986___KTZ_400_mg_solution__fasted__5_.png)

**Figure 3-9: Time Profile Analysis**

<br>
<br>

<a id="figure-3-10"></a>

![](images/006_section_3/011_section_33/012_section_331/6_time_profile_plot_Ketoconazole_Sriwiriyajan__2007___KTZ_400_mg_solution__fasted__74_.png)

**Figure 3-10: Time Profile Analysis**

<br>
<br>

<a id="figure-3-11"></a>

![](images/006_section_3/011_section_33/012_section_331/7_time_profile_plot_Ketoconazole_Huang__1986___KTZ_800_mg_solution__fasted__6_.png)

**Figure 3-11: Time Profile Analysis**

<br>
<br>

### 3.3.2 Fasted tablet studies<a id="332"></a>

This section contains fasted oral tablet studies used to evaluate tablet absorption and systemic ketoconazole exposure.

<a id="figure-3-12"></a>

![](images/006_section_3/011_section_33/013_section_332/8_time_profile_plot_Ketoconazole_Heel__1982___KTZ_100_mg_tablet__fasted__111_.png)

**Figure 3-12: Time Profile Analysis**

<br>
<br>

<a id="figure-3-13"></a>

![](images/006_section_3/011_section_33/013_section_332/9_time_profile_plot_Ketoconazole_Boyce__2012___KTZ_200_mg_tablet__fasted__10_.png)

**Figure 3-13: Time Profile Analysis**

<br>
<br>

<a id="figure-3-14"></a>

![](images/006_section_3/011_section_33/013_section_332/10_time_profile_plot_Ketoconazole_Boyce__2012___KTZ_200_mg_tablet__fasted__9_.png)

**Figure 3-14: Time Profile Analysis**

<br>
<br>

<a id="figure-3-15"></a>

![](images/006_section_3/011_section_33/013_section_332/11_time_profile_plot_Ketoconazole_Chin__1995___KTZ_200_mg_tablet__fasted__15_.png)

**Figure 3-15: Time Profile Analysis**

<br>
<br>

<a id="figure-3-16"></a>

![](images/006_section_3/011_section_33/013_section_332/12_time_profile_plot_Ketoconazole_Daneshmend__1983___KTZ_200_mg_tablet__fasted__28_.png)

**Figure 3-16: Time Profile Analysis**

<br>
<br>

<a id="figure-3-17"></a>

![](images/006_section_3/011_section_33/013_section_332/13_time_profile_plot_Ketoconazole_Daneshmend__1983___KTZ_200_mg_tablet__fasted__29_.png)

**Figure 3-17: Time Profile Analysis**

<br>
<br>

<a id="figure-3-18"></a>

![](images/006_section_3/011_section_33/013_section_332/14_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_200_mg_tablet__fasted__20_.png)

**Figure 3-18: Time Profile Analysis**

<br>
<br>

<a id="figure-3-19"></a>

![](images/006_section_3/011_section_33/013_section_332/15_time_profile_plot_Ketoconazole_FDA__1998___KTZ_200_mg_tablet__fasted__85_.png)

**Figure 3-19: Time Profile Analysis**

<br>
<br>

<a id="figure-3-20"></a>

![](images/006_section_3/011_section_33/013_section_332/16_time_profile_plot_Ketoconazole_FDA__1998___KTZ_200_mg_tablet__fasted__86_.png)

**Figure 3-20: Time Profile Analysis**

<br>
<br>

<a id="figure-3-21"></a>

![](images/006_section_3/011_section_33/013_section_332/17_time_profile_plot_Ketoconazole_FDA__1998___KTZ_200_mg_tablet__fasted__89_.png)

**Figure 3-21: Time Profile Analysis**

<br>
<br>

<a id="figure-3-22"></a>

![](images/006_section_3/011_section_33/013_section_332/18_time_profile_plot_Ketoconazole_Heel__1982___KTZ_200_mg_tablet__fasted__112_.png)

**Figure 3-22: Time Profile Analysis**

<br>
<br>

<a id="figure-3-23"></a>

![](images/006_section_3/011_section_33/013_section_332/19_time_profile_plot_Ketoconazole_Huang__1986___KTZ_200_mg_tablet__fasted__1_.png)

**Figure 3-23: Time Profile Analysis**

<br>
<br>

<a id="figure-3-24"></a>

![](images/006_section_3/011_section_33/013_section_332/20_time_profile_plot_Ketoconazole_Knupp__1993___KTZ_200_mg_tablet__fasted__37_.png)

**Figure 3-24: Time Profile Analysis**

<br>
<br>

<a id="figure-3-25"></a>

![](images/006_section_3/011_section_33/013_section_332/21_time_profile_plot_Ketoconazole_Mannisto__1982___KTZ_200_mg_tablet_juice__fasted__44_.png)

**Figure 3-25: Time Profile Analysis**

<br>
<br>

<a id="figure-3-26"></a>

![](images/006_section_3/011_section_33/013_section_332/22_time_profile_plot_Ketoconazole_Mannisto__1982___KTZ_200_mg_tablet__fasted__40_.png)

**Figure 3-26: Time Profile Analysis**

<br>
<br>

<a id="figure-3-27"></a>

![](images/006_section_3/011_section_33/013_section_332/23_time_profile_plot_Ketoconazole_Mannisto__1982___KTZ_200_mg_tablet__fasted__41_.png)

**Figure 3-27: Time Profile Analysis**

<br>
<br>

<a id="figure-3-28"></a>

![](images/006_section_3/011_section_33/013_section_332/24_time_profile_plot_Ketoconazole_Mannisto__1982___KTZ_200_mg_tablet__fasted__42_.png)

**Figure 3-28: Time Profile Analysis**

<br>
<br>

<a id="figure-3-29"></a>

![](images/006_section_3/011_section_33/013_section_332/25_time_profile_plot_Ketoconazole_Patel__2011___KTZ_200_mg_tablet__fasted__65_.png)

**Figure 3-29: Time Profile Analysis**

<br>
<br>

<a id="figure-3-30"></a>

![](images/006_section_3/011_section_33/013_section_332/26_time_profile_plot_Ketoconazole_Sadeghina__2005___KTZ_200_mg_tablet__fasted__70_.png)

**Figure 3-30: Time Profile Analysis**

<br>
<br>

<a id="figure-3-31"></a>

![](images/006_section_3/011_section_33/013_section_332/27_time_profile_plot_Ketoconazole_Sadeghina__2005___KTZ_200_mg_tablet__fasted__71_.png)

**Figure 3-31: Time Profile Analysis**

<br>
<br>

<a id="figure-3-32"></a>

![](images/006_section_3/011_section_33/013_section_332/28_time_profile_plot_Ketoconazole_Van_der_Meer__1980___KTZ_200_mg_tablet__fasted_ctrl__90_.png)

**Figure 3-32: Time Profile Analysis**

<br>
<br>

<a id="figure-3-33"></a>

![](images/006_section_3/011_section_33/013_section_332/29_time_profile_plot_Ketoconazole_Wire__2007___KTZ_200_mg_tablet__fasted__94_.png)

**Figure 3-33: Time Profile Analysis**

<br>
<br>

<a id="figure-3-34"></a>

![](images/006_section_3/011_section_33/013_section_332/30_time_profile_plot_Ketoconazole_Yuen__1999___KTZ_200_mg_tablet__fasted__96_.png)

**Figure 3-34: Time Profile Analysis**

<br>
<br>

<a id="figure-3-35"></a>

![](images/006_section_3/011_section_33/013_section_332/31_time_profile_plot_Ketoconazole_Yuen__1999___KTZ_200_mg_tablet__fasted__97_.png)

**Figure 3-35: Time Profile Analysis**

<br>
<br>

<a id="figure-3-36"></a>

![](images/006_section_3/011_section_33/013_section_332/32_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_400_mg_tablet__fasted__21_.png)

**Figure 3-36: Time Profile Analysis**

<br>
<br>

<a id="figure-3-37"></a>

![](images/006_section_3/011_section_33/013_section_332/33_time_profile_plot_Ketoconazole_Heel__1982___KTZ_400_mg_tablet__fasted__113_.png)

**Figure 3-37: Time Profile Analysis**

<br>
<br>

<a id="figure-3-38"></a>

![](images/006_section_3/011_section_33/013_section_332/34_time_profile_plot_Ketoconazole_Piscitelli__1991___KTZ_400_mg_tablet__fasted__77_.png)

**Figure 3-38: Time Profile Analysis**

<br>
<br>

<a id="figure-3-39"></a>

![](images/006_section_3/011_section_33/013_section_332/35_time_profile_plot_Ketoconazole_Polk__1999___KTZ_400_mg_tablet__fasted__69_.png)

**Figure 3-39: Time Profile Analysis**

<br>
<br>

<a id="figure-3-40"></a>

![](images/006_section_3/011_section_33/013_section_332/36_time_profile_plot_Ketoconazole_Solomon__2007___KTZ_400_mg_tablet__fasted__72_.png)

**Figure 3-40: Time Profile Analysis**

<br>
<br>

<a id="figure-3-41"></a>

![](images/006_section_3/011_section_33/013_section_332/37_time_profile_plot_Ketoconazole_Solomon__2007___KTZ_400_mg_tablet__fasted__73_.png)

**Figure 3-41: Time Profile Analysis**

<br>
<br>

<a id="figure-3-42"></a>

![](images/006_section_3/011_section_33/013_section_332/38_time_profile_plot_Ketoconazole_Weiss__2022___KTZ_400_mg_tablet__fasted__168_.png)

**Figure 3-42: Time Profile Analysis**

<br>
<br>

<a id="figure-3-43"></a>

![](images/006_section_3/011_section_33/013_section_332/39_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_600_mg_tablet__fasted__22_.png)

**Figure 3-43: Time Profile Analysis**

<br>
<br>

<a id="figure-3-44"></a>

![](images/006_section_3/011_section_33/013_section_332/40_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_800_mg_tablet__fasted__23_.png)

**Figure 3-44: Time Profile Analysis**

<br>
<br>

### 3.3.3 Fed tablet and food-effect studies<a id="333"></a>

This section contains fed tablet and food-effect studies used to evaluate the influence of gastrointestinal conditions on ketoconazole absorption.

<a id="figure-3-45"></a>

![](images/006_section_3/011_section_33/014_section_333/41_time_profile_plot_Ketoconazole_Daneshmend__1981___KTZ_200_mg_tablet__fed__109_.png)

**Figure 3-45: Time Profile Analysis**

<br>
<br>

<a id="figure-3-46"></a>

![](images/006_section_3/011_section_33/014_section_333/42_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_200_mg_tablet__fed__24_.png)

**Figure 3-46: Time Profile Analysis**

<br>
<br>

<a id="figure-3-47"></a>

![](images/006_section_3/011_section_33/014_section_333/43_time_profile_plot_Ketoconazole_FDA__1998___KTZ_200_mg_tablet__fed__87_.png)

**Figure 3-47: Time Profile Analysis**

<br>
<br>

<a id="figure-3-48"></a>

![](images/006_section_3/011_section_33/014_section_333/44_time_profile_plot_Ketoconazole_FDA__1998___KTZ_200_mg_tablet__fed__88_.png)

**Figure 3-48: Time Profile Analysis**

<br>
<br>

<a id="figure-3-49"></a>

![](images/006_section_3/011_section_33/014_section_333/45_time_profile_plot_Ketoconazole_Mannisto__1982___KTZ_200_mg_tablet__fed__43_.png)

**Figure 3-49: Time Profile Analysis**

<br>
<br>

<a id="figure-3-50"></a>

![](images/006_section_3/011_section_33/014_section_333/46_time_profile_plot_Ketoconazole_Sekar__2008___KTZ_200_mg_tablet__fed__103_.png)

**Figure 3-50: Time Profile Analysis**

<br>
<br>

<a id="figure-3-51"></a>

![](images/006_section_3/011_section_33/014_section_333/47_time_profile_plot_Ketoconazole_Daneshmend__1981___KTZ_400_mg_tablet__fed__110_.png)

**Figure 3-51: Time Profile Analysis**

<br>
<br>

<a id="figure-3-52"></a>

![](images/006_section_3/011_section_33/014_section_333/48_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_400_mg_tablet__fed__25_.png)

**Figure 3-52: Time Profile Analysis**

<br>
<br>

<a id="figure-3-53"></a>

![](images/006_section_3/011_section_33/014_section_333/49_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_600_mg_tablet__fed__26_.png)

**Figure 3-53: Time Profile Analysis**

<br>
<br>

<a id="figure-3-54"></a>

![](images/006_section_3/011_section_33/014_section_333/50_time_profile_plot_Ketoconazole_Craven__1983___KTZ_800_mg_tablet__fed__127_.png)

**Figure 3-54: Time Profile Analysis**

<br>
<br>

<a id="figure-3-55"></a>

![](images/006_section_3/011_section_33/014_section_333/51_time_profile_plot_Ketoconazole_Daneshmend__1984___KTZ_800_mg_tablet__fed__27_.png)

**Figure 3-55: Time Profile Analysis**

<br>
<br>

<a id="figure-3-56"></a>

![](images/006_section_3/011_section_33/014_section_333/52_time_profile_plot_Ketoconazole_Craven__1983___KTZ_1200_mg_tablet__fed__128_.png)

**Figure 3-56: Time Profile Analysis**

<br>
<br>

### 3.3.4 Multiple-dose studies<a id="334"></a>

This section contains multiple-dose oral ketoconazole studies used to evaluate accumulation and time-dependent exposure under repeated dosing.

<a id="figure-3-57"></a>

![](images/006_section_3/011_section_33/015_section_334/53_time_profile_plot_Ketoconazole_Greenblatt__1998___KTZ_200_mg_tablet_b_i_d__5d__fed__165_.png)

**Figure 3-57: Time Profile Analysis**

<br>
<br>

# 4 Conclusion<a id="4"></a>

The ketoconazole parent-metabolite PBPK model provides a mechanistic description of oral ketoconazole pharmacokinetics across formulation, food-effect and multiple-dose scenarios. The model structure supports DFI and DDI perpetrator applications by representing ketoconazole and its metabolites as contributors to CYP3A4 and P-gp inhibition.

# 5 References<a id="5"></a>

[1] [F Z Marok, J-G Wojtyniak, L M Fuhr, D Selzer, M Schwab, J Weiss, W E Haefeli, T Lehr. A Physiologically Based Pharmacokinetic Model of Ketoconazole and Its Metabolites as Drug-Drug Interaction Perpetrators. Pharmaceutics, 2023;15:679.](https://doi.org/10.3390/pharmaceutics15020679)

[2] [J Weiss, K I Foerster, M Weber, J Burhenne, G Mikus, T Lehr, W E Haefeli. Does the circulating ketoconazole metabolite N-deacetyl ketoconazole contribute to the drug-drug interaction potential of the parent compound? Eur J Pharm Sci, 2022;169:106076.](https://doi.org/10.1016/j.ejps.2021.106076)

[3] [T Fukami, A Iida, K Konishi, M Nakajima. Human arylacetamide deacetylase hydrolyzes ketoconazole to trigger hepatocellular toxicity. Biochem Pharmacol, 2016;116:153-161.](https://doi.org/10.1016/j.bcp.2016.07.007)

[4] [W Fitch, T Tran, M Young, L Liu, Y Chen. Revisiting the Metabolism of Ketoconazole Using Accurate Mass. Drug Metab Lett, 2009;3:191-198.](https://doi.org/10.2174/187231209789352085)

[5] [D Schwab, H Fischer, A Tabatabaei, S Poli, J Huwyler. Comparison of in Vitro P-Glycoprotein Screening Assays: Recommendations for Their Use in Drug Discovery. J Med Chem, 2003;46:1716-1725.](https://doi.org/10.1021/jm021012t)

[6] [K Bourcier, R Hyland, S Kempshall, R Jones, J Maximilien, N Irvine, B Jones. Investigation into UDP-Glucuronosyltransferase enzyme kinetics of imidazole- and triazole-containing antifungal drugs in human liver microsomes and recombinant UGT enzymes. Drug Metab Dispos, 2010;38:923-929.](https://doi.org/10.1124/dmd.109.030676)

[7] [R C Heel, R N Brogden, A Carmine, P A Morley, T M Speight, G S Avery. Ketoconazole: A Review of its Therapeutic Efficacy in Superficial and Systemic Fungal Infections. Drugs, 1982;23:1-36.](https://doi.org/10.2165/00003495-198223010-00001)

[8] [T K Daneshmend, D W Warnock, A Turner, C J C Roberts. Pharmacokinetics of ketoconazole in normal subjects. J Antimicrob Chemother, 1981;8:299-304.](https://doi.org/10.1093/jac/8.4.299)

[9] [T K Daneshmend, D W Warnock. Clinical Pharmacokinetics of Ketoconazole. Clin Pharmacokinet, 1988;14:13-34.](https://doi.org/10.2165/00003088-198814010-00002)

[10] [T K Daneshmend, D W Warnock, E M Johnson, G Parker, M D Richardson, C J C Roberts. Multiple dose pharmacokinetics of ketoconazole and their effects on antipyrine kinetics in man. J Antimicrob Chemother, 1983;12:185-188.](https://doi.org/10.1093/jac/12.2.185)

[11] [T K Daneshmend, D W Warnock, M D Ene, E M Johnson, M R Potten, M D Richardson, P J Williamson. Influence of food on the pharmacokinetics of ketoconazole. Antimicrob Agents Chemother, 1984;25:1-3.](https://doi.org/10.1128/AAC.25.1.1)

[12] [Y-C Huang, J L Colaizzi, R H Bierman, R Woestenborghs, J J P Heykants. Pharmacokinetics and dose proportionality of ketoconazole in normal volunteers. Antimicrob Agents Chemother, 1986;30:206-210.](https://doi.org/10.1128/AAC.30.2.206)

[13] [R E Polk, M A Crouch, D S Israel, A Pastor, B M Sadler, G E Chittick, W T Symonds, W Gouldin, Y Lou. Pharmacokinetic interaction between ketoconazole and amprenavir after single doses in healthy men. Pharmacotherapy, 1999;19:1378-1384.](https://doi.org/10.1592/phco.19.18.1378.30905)

[14] [M J Boyce, K J Baisley, S J Warrington. Pharmacokinetic interaction between domperidone and ketoconazole leads to QT prolongation in healthy volunteers: A randomized, placebo-controlled, double-blind, crossover study. Br J Clin Pharmacol, 2012;73:411-421.](https://doi.org/10.1111/j.1365-2125.2011.04093.x)

[15] [P J Tiseo, C A Perdomo, L T Friedhoff. Concurrent administration of donepezil HCl and ketoconazole: Assessment of pharmacokinetic changes following single and multiple doses. Br J Clin Pharmacol, 1998;46 Suppl 1:30-34.](https://doi.org/10.1046/j.1365-2125.1998.0460s1030.x)

[16] [P C Craven, J R Graybill, J H Jorgensen, W E Dismukes, B E Levine. High-dose ketoconazole for treatment of fungal infections of the central nervous system. Ann Intern Med, 1983;98:160-167.](https://doi.org/10.7326/0003-4819-98-2-160)

[17] [P T Männistö, R Mäntylä, S Nykänen, U Lamminsivu, P Ottoila. Impairing effect of food on ketoconazole absorption. Antimicrob Agents Chemother, 1982;21:730-733.](https://doi.org/10.1128/AAC.21.5.730)

[18] [D J Greenblatt, C E Wright, L L von Moltke, J S Harmatz, B L Ehrenberg, L M Harrel, K Corbett, M Counihan, S Tobias, R I Shader. Ketoconazole inhibition of triazolam and alprazolam clearance: Differential kinetic and dynamic consequences. Clin Pharmacol Ther, 1998;64:237-247.](https://doi.org/10.1016/S0009-9236(98)90172-2)

