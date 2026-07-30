# Building and evaluation of a PBPK model for (E)-Clomiphene in CYP2D6 activity-score groups

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
     * [3.2.1 (E)-Clomiphene goodness-of-fit diagnostics](#321)
     * [3.2.2 (E)-4-Hydroxyclomiphene goodness-of-fit diagnostics](#322)
     * [3.2.3 (E)-N-desethylclomiphene goodness-of-fit diagnostics](#323)
     * [3.2.4 (E)-4-Hydroxy-N-desethylclomiphene goodness-of-fit diagnostics](#324)
   * [3.3 Concentration-time profiles](#33)
     * [3.3.1 Model Building](#331)
     * [3.3.2 Model Verification](#332)
 * [4 Conclusion](#4)
 * [5 References](#5)

# 1 Introduction<a id="1"></a>

(E)-Clomiphene is the trans-isomer of clomiphene and contributes to the clinical pharmacology of clomiphene citrate, a selective estrogen receptor modulator used in reproductive medicine. Its pharmacokinetics are complex because clomiphene is administered as an E/Z mixture, undergoes sequential oxidative metabolism, and shows clinically relevant variability linked to CYP2D6 activity [Kovar 2022](#5).

The model describes (E)-clomiphene as a whole-body parent-metabolite PBPK model with (E)-N-desethylclomiphene, (E)-4-hydroxyclomiphene and (E)-4-hydroxy-N-desethylclomiphene as measured metabolites. This structure supports evaluation of parent and metabolite plasma concentration-time data after oral clomiphene or enclomiphene administration and enables activity-score-dependent CYP2D6 simulations.

The clinical evaluation covers adult plasma pharmacokinetic data after single-dose and multiple-dose oral administration. The dataset includes a CYP2D6 activity-score-stratified panel study with parent and metabolite measurements and external literature studies reporting (E)-clomiphene concentration-time data. The model was published by [Kovar 2022](#5) and was subsequently integrated into the CYP2D6 interaction network by [Rüdesheim 2025](#5).

# 2 Methods<a id="2"></a>

## 2.1 Modeling strategy<a id="21"></a>

The PBPK model was developed using the Open Systems Pharmacology Suite. Distribution and elimination processes were implemented in a whole-body model structure using standard physiological organ compartments and compound-specific physicochemical and biochemical input parameters.

Model development followed an iterative workflow in which in vitro and physicochemical information was combined with clinical plasma concentration-time data. Parameters with direct literature support were used as fixed inputs where possible, while selected parameters controlling oral absorption, metabolism, residual clearance and activity-score-dependent CYP2D6 scaling were optimized against clinical data.

The model represents (E)-clomiphene and three metabolites as separate compounds. (E)-N-Desethylclomiphene is included as the main desethyl metabolite, while (E)-4-hydroxyclomiphene and (E)-4-hydroxy-N-desethylclomiphene are included as active hydroxylated metabolites. The four-compound structure is required because the available panel study reports parent and metabolite concentration-time data across CYP2D6 activity-score groups.

The clinical panel study by [Mürdter 2016](#5) informed activity-score-dependent parent-metabolite disposition after oral clomiphene citrate administration. Literature studies by [Mikkelson 1986](#5), [Ratiopharm GmbH 2016](#5), [Wiehle 2013](#5), and [Miller 2019](#5) provided additional single-dose and multiple-dose oral concentration-time data for (E)-clomiphene. The literature studies evaluate oral formulation behavior and the parent compound over a broader dose range.

The major proteins represented in the model are CYP2D6, CYP3A4 and CYP2B6. CYP2D6 accounts for activity-score-dependent formation and elimination pathways. CYP3A4 contributes to desethylation and metabolite turnover, while CYP2B6 contributes to (E)-4-hydroxyclomiphene formation. Renal filtration, enterohepatic recirculation and residual hepatic clearance are retained where required to describe parent and metabolite disposition.

## 2.2 Data used<a id="22"></a>

### In vitro and physicochemical data

Drug-dependent parameters for (E)-clomiphene and its metabolites were taken from the published PBPK model and its supplement ([Kovar 2022](#5)). [Table 1](#table-1) gives the physicochemical, distribution, absorption, metabolism, and elimination parameters used in the final model. The Source column identifies the original literature or database named in Supplement Tables S4-S7. It identifies model-fitted and assumed values directly.

| Parameter | Unit | Value | Source | Description |
| --- | ---: | ---: | --- | --- |
| **(E)-Clomiphene** |  |  |  |  |
| MW | g/mol | 405.96 | [Siramshetty 2022](#5) | Molecular weight. |
| pK<sub>a</sub> | - | 9.31<sup>a</sup> | [ChemAxon 2009](#5) | Acid dissociation constant. |
| Solubility | mg/mL | 0.0138 | [Das 2020](#5) | Aqueous solubility at pH 6.8. |
| logP | - | 5.67 | Optimized | Octanol-water partition coefficient of the neutral species. |
| f<sub>u</sub> | % | 0.08 | Optimized | Fraction unbound in plasma. |
| K<sub>m,CYP2D6</sub> | µmol/L | 0.13 | [Kröner 2018](#5) | Michaelis constant for formation of (E)-4-hydroxyclomiphene from (E)-clomiphene. |
| K<sub>m,CYP2D6</sub> | µmol/L | 0.03 | [Kröner 2018](#5) | Michaelis constant for formation of other metabolite from (E)-clomiphene. |
| K<sub>m,CYP2D6</sub> | µmol/L | 0.78 | [Mürdter 2012](#5); [Ganchev 2014](#5) | Michaelis constant for formation of (E)-N-desethylclomiphene from (E)-clomiphene. |
| K<sub>m,CYP3A4</sub> | µmol/L | 0.78 | [Mürdter 2012](#5); [Ganchev 2014](#5) | Michaelis constant for formation of (E)-N-desethylclomiphene from (E)-clomiphene. |
| k<sub>cat,CYP3A4</sub> | 1/min | 45.0 | Optimized | Catalytic rate constant for formation of (E)-N-desethylclomiphene from (E)-clomiphene. |
| K<sub>m,CYP2B6</sub> | µmol/L | 0.60 | [Mürdter 2012](#5); [Ganchev 2014](#5) | Michaelis constant for formation of (E)-4-hydroxyclomiphene from (E)-clomiphene. |
| k<sub>cat,CYP2B6</sub> | 1/min | 7.5 | Optimized | Catalytic rate constant for formation of (E)-4-hydroxyclomiphene from (E)-clomiphene. |
| GFR fraction | - | 0.92 | Optimized | Fraction used to scale passive glomerular filtration. |
| EHC fraction | - | 1.00 | Assumed | Fraction released continuously into bile. |
| Partition coefficients | - | Schmitt | [Schmitt 2008](#5) | Tissue-to-plasma partition coefficients calculated with the Schmitt method. |
| Cellular permeabilities | - | Charge-dependent Schmitt | [Kawai 1994](#5) | Cellular permeabilities calculated with the charge-dependent Schmitt method. |
| P<sub>int</sub> | cm/min | 0.08 | Optimized | Specific transcellular intestinal permeability. |
| t<sub>50</sub> | min | 6.80 | Assumed | Time to dissolve 50% of the dose. |
| Weibull shape | - | 0.47 | Assumed | Shape parameter of the Weibull dissolution function. |
| **(E)-N-desethylclomiphene** |  |  |  |  |
| MW | g/mol | 377.91 | [ChemAxon 2009](#5) | Molecular weight. |
| pK<sub>a</sub> | - | 8.14<sup>a</sup> | Optimized | Acid dissociation constant. |
| Solubility | mg/mL | 0.46 | [ChemAxon 2009](#5) | Aqueous solubility at pH 6.5. |
| logP | - | 4.17 | Optimized | Octanol-water partition coefficient of the neutral species. |
| f<sub>u</sub> | % | 0.86 | Optimized | Fraction unbound in plasma. |
| K<sub>m,CYP2D6</sub> | µmol/L | 0.49 | [Mürdter 2012](#5); [Ganchev 2014](#5) | Michaelis constant for formation of (E)-4-hydroxy-N-desethylclomiphene from (E)-N-desethylclomiphene. |
| K<sub>m,CYP2D6</sub> | µmol/L | 0.97 | [Mürdter 2012](#5); [Ganchev 2014](#5) | Michaelis constant for formation of other metabolite from (E)-N-desethylclomiphene. |
| K<sub>m,CYP3A4</sub> | µmol/L | 0.97 | [Mürdter 2012](#5); [Ganchev 2014](#5) | Michaelis constant for formation of other metabolite from (E)-N-desethylclomiphene. |
| k<sub>cat,CYP3A4</sub> | 1/min | 0.8 | Optimized | Catalytic rate constant for formation of other metabolite from (E)-N-desethylclomiphene. |
| GFR fraction | - | 0.10 | Optimized | Fraction used to scale passive glomerular filtration. |
| EHC fraction | - | 1.00 | Assumed | Fraction released continuously into bile. |
| Partition coefficients | - | Rodgers and Rowland | [Rodgers 2005](#5); [Rodgers 2006](#5) | Tissue-to-plasma partition coefficients calculated with the Rodgers and Rowland method. |
| Cellular permeabilities | - | Charge-dependent Schmitt | [Kawai 1994](#5) | Cellular permeabilities calculated with the charge-dependent Schmitt method. |
| **(E)-4-hydroxyclomiphene** |  |  |  |  |
| MW | g/mol | 421.97 | [ChemAxon 2009](#5) | Molecular weight. |
| pK<sub>a</sub> | - | 8.64<sup>b</sup> | [ChemAxon 2009](#5) | Acid dissociation constant. |
| pK<sub>a</sub> | - | 7.90<sup>a</sup> | Optimized | Acid dissociation constant. |
| Solubility | mg/mL | 0.06 | [ChemAxon 2009](#5) | Aqueous solubility at pH 6.5. |
| logP | - | 5.50 | Optimized | Octanol-water partition coefficient of the neutral species. |
| f<sub>u</sub> | % | 0.45 | Optimized | Fraction unbound in plasma. |
| K<sub>m,CYP2D6</sub> | µmol/L | 3.60 | [Kröner 2018](#5) | Michaelis constant for formation of other metabolite from (E)-4-hydroxyclomiphene. |
| K<sub>m,CYP3A4</sub> | µmol/L | 3.40 | [Mürdter 2012](#5); [Ganchev 2014](#5) | Michaelis constant for formation of (E)-4-hydroxy-N-desethylclomiphene from (E)-4-hydroxyclomiphene. |
| k<sub>cat,CYP3A4</sub> | 1/min | 19.5 | Optimized | Catalytic rate constant for formation of (E)-4-hydroxy-N-desethylclomiphene from (E)-4-hydroxyclomiphene. |
| CL<sub>hep</sub> | 1/min | 23.78 | Optimized | Unspecific hepatic clearance. |
| GFR fraction | - | 0.24 | Optimized | Fraction used to scale passive glomerular filtration. |
| EHC fraction | - | 1.00 | Assumed | Fraction released continuously into bile. |
| Partition coefficients | - | Berezhkovskiy | [Berezhkovskiy 2004](#5) | Tissue-to-plasma partition coefficients calculated with the Berezhkovskiy method. |
| Cellular permeabilities | cm/min | 2.23 | [OSP Suite Manual 2021](#5) | Calculated cellular permeability. |
| **(E)-4-hydroxy-N-desethylclomiphene** |  |  |  |  |
| MW | g/mol | 393.91 | [ChemAxon 2009](#5) | Molecular weight. |
| pK<sub>a</sub> | - | 8.69<sup>b</sup> | [ChemAxon 2009](#5) | Acid dissociation constant. |
| pK<sub>a</sub> | - | 9.65<sup>a</sup> | [ChemAxon 2009](#5) | Acid dissociation constant. |
| Solubility | mg/mL | 0.17 | [ChemAxon 2009](#5) | Aqueous solubility at pH 6.5. |
| logP | - | 3.71 | Optimized | Octanol-water partition coefficient of the neutral species. |
| f<sub>u</sub> | % | 1.32 | [Watanabe 2018](#5) | Fraction unbound in plasma. |
| K<sub>m,CYP2D6</sub> | µmol/L | 8.86 | Assumed | Michaelis constant for formation of other metabolite from (E)-4-hydroxy-N-desethylclomiphene. |
| CL<sub>hep</sub> | 1/min | 8.50 | Optimized | Unspecific hepatic clearance. |
| GFR fraction | - | 0.13 | Optimized | Fraction used to scale passive glomerular filtration. |
| EHC fraction | - | 1.00 | Assumed | Fraction released continuously into bile. |
| Partition coefficients | - | Schmitt | [Schmitt 2008](#5) | Tissue-to-plasma partition coefficients calculated with the Schmitt method. |
| Cellular permeabilities | - | Charge-dependent Schmitt | [Kawai 1994](#5) | Cellular permeabilities calculated with the charge-dependent Schmitt method. |

**Table 1:**<a name="table-1"></a> Drug-dependent parameters used in the final clomiphene model. Original sources are those assigned in Supplement Tables S4-S7 of [Kovar 2022](#5).

<sup>a</sup> Basic. <sup>b</sup> Acidic.

<sup>e</sup> Other metabolite: an undefined downstream product represented as an elimination pathway in the model.

The CYP2D6 activity-score-specific catalytic rates are listed in [Table 1a](#table-1a).

| Substrate | Product or pathway | AS = 0 | AS = 0.5 | AS = 0.75 | AS = 1 | AS = 2 | AS = 3 | Unit |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| (E)-Clomiphene | (E)-4-hydroxyclomiphene | 0 | 57.48 | 81.57 | 175.08 | 306.38 | 467.23 | 1/min |
| (E)-Clomiphene | (E)-N-desethylclomiphene | 0 | 21.12 | 27.78 | 61.56 | 121.36 | 171.54 | 1/min |
| (E)-Clomiphene | Other CYP2D6 hydroxylation | 0 | 22.68 | 29.84 | 66.13 | 130.35 | 184.25 | 1/min |
| (E)-N-desethylclomiphene | (E)-4-hydroxy-N-desethylclomiphene | 0 | 10.35 | 12.37 | 28.59 | 64.52 | 84.01 | 1/min |
| (E)-N-desethylclomiphene | Other CYP2D6 desethylation | 0 | 1.02 | 1.34 | 2.96 | 5.84 | 8.25 | 1/min |
| (E)-4-hydroxyclomiphene | Other CYP2D6 elimination | 0 | 148.80 | 195.78 | 433.82 | 855.17 | 1208.79 | 1/min |
| (E)-4-hydroxy-N-desethylclomiphene | Other CYP2D6 elimination | 0 | 36.84 | 48.47 | 107.40 | 211.71 | 299.26 | 1/min |

**Table 1a:**<a name="table-1a"></a> CYP2D6 activity-score-specific k<sub>cat</sub> values. AS = 2 values were optimized. AS = 0 values were assumed to be zero. Other values were calculated from AS = 2 with the pathway-specific *in vitro* scaling factors in Supplement Table S8 of [Kovar 2022](#5). AS: activity score.

External studies did not report CYP2D6 activity scores or phenotypes. The model used the study-specific optimized CYP2D6 catalytic rates in [Table 1b](#table-1b).

| Study profile | (E)-Clomiphene to (E)-4-hydroxyclomiphene | (E)-Clomiphene to other metabolite | (E)-Clomiphene to (E)-N-desethylclomiphene | Unit |
| --- | ---: | ---: | ---: | --- |
| Mikkelson 1986 | 213.0 | 90.6 | 84.4 | 1/min |
| Miller 2019 | 18.1 | 7.7 | 7.2 | 1/min |
| Ratiopharm GmbH 2016 | 283.1 | 120.5 | 112.1 | 1/min |
| Wiehle 2013, 6.25 mg | 87.7 | 37.3 | 34.8 | 1/min |
| Wiehle 2013, 12.5 mg | 124.1 | 52.8 | 49.1 | 1/min |
| Wiehle 2013, 25 mg | 43.3 | 18.4 | 17.1 | 1/min |

**Table 1b:**<a name="table-1b"></a> Study-specific optimized CYP2D6 k<sub>cat</sub> values for the external clinical profiles, as reported in Supplement Table S1 of [Kovar 2022](#5).

### Clinical data

The evaluation includes 12 plasma concentration-time profiles after oral clomiphene or enclomiphene administration ([Table 2](#table-2)). Six activity-score groups from the Mürdter 2016 panel were used for model building. Six external profiles were used for model verification.

| Source | Dose [mg] / schedule\* | Age [years] | Weight [kg] | Sex | N | Form. | CYP2D6 characterization |
| --- | --- | --- | --- | --- | ---: | --- | --- |
| [Mikkelson 1986](#5) | 50 clomiphene citrate (21 (E)-clomiphene model dose), oral | 32 | 62.4 | Female | 23 | Tablet | Study-specific CYP2D6 k<sub>cat</sub> |
| [Miller 2019](#5) | 50 clomiphene citrate (21 (E)-clomiphene model dose), oral, multiple dose | 31.5 ± 3.6 | 77.9 ± 8.2 | Male | 12 | Tablet | Study-specific CYP2D6 k<sub>cat</sub> |
| [Mürdter 2016](#5)<sup>+</sup> | 100 clomiphene citrate (42 (E)-clomiphene model dose), oral | 25.2 (22–29) | 62.3 (50–70) | Female | 6 | Tablet | AS = 0 (PM) |
| [Mürdter 2016](#5)<sup>+</sup> | 100 clomiphene citrate (42 (E)-clomiphene model dose), oral | 24.3 (21–30) | 59.3 (55.5–64) | Female | 4 | Tablet | AS = 0.5 (IM) |
| [Mürdter 2016](#5)<sup>+</sup> | 100 clomiphene citrate (42 (E)-clomiphene model dose), oral | 22 | 63 | Female | 1 | Tablet | AS = 0.75 (IM) |
| [Mürdter 2016](#5)<sup>+</sup> | 100 clomiphene citrate (42 (E)-clomiphene model dose), oral | 25.5 (23–28) | 68.8 (63.5–74) | Female | 2 | Tablet | AS = 1 (IM) |
| [Mürdter 2016](#5)<sup>+</sup> | 100 clomiphene citrate (42 (E)-clomiphene model dose), oral | 32.3 (26–43) | 56.5 (48–63.5) | Female | 3 | Tablet | AS = 2 (NM) |
| [Mürdter 2016](#5)<sup>+</sup> | 100 clomiphene citrate (42 (E)-clomiphene model dose), oral | 25.7 (22–28) | 61.7 (54–73) | Female | 3 | Tablet | AS = 3 (UM) |
| [Ratiopharm GmbH 2016](#5) | 50 clomiphene citrate (21 (E)-clomiphene model dose), oral | NR | NR | NR | 18 | Tablet | Study-specific CYP2D6 k<sub>cat</sub> |
| [Wiehle 2013](#5) | 6.25 enclomiphene citrate, oral, multiple dose | 53.3 ± 10.2 | NR | Male | 16 | Capsule | Study-specific CYP2D6 k<sub>cat</sub> |
| [Wiehle 2013](#5) | 12.5 enclomiphene citrate, oral, multiple dose | 53.3 ± 10.2 | NR | Male | 14 | Capsule | Study-specific CYP2D6 k<sub>cat</sub> |
| [Wiehle 2013](#5) | 25 enclomiphene citrate, oral, multiple dose | 53.3 ± 10.2 | NR | Male | 16 | Capsule | Study-specific CYP2D6 k<sub>cat</sub> |

**Table 2:**<a name="table-2"></a> Clinical (E)-clomiphene concentration-time profiles used for model building and verification. Data for the external studies are from Supplement Table S2 of [Kovar 2022](#5). The model-dose equivalents identify the evaluated simulation dose. \*: Single oral dose unless otherwise specified. AS: activity score. IM: intermediate metabolizer. NM: normal metabolizer. NR: not reported. PM: poor metabolizer. PT: predicted phenotype. UM: ultrarapid metabolizer. <sup>+</sup>: data used for model building. Parenthetical PTs for AS-coded rows use the CYP2D6 activity score-to-phenotype mapping from [Moore 2026](#5). Study-specific CYP2D6 k<sub>cat</sub>: activity score and phenotype were not reported, and the study-specific optimized values in Table 1b were used.

## 2.3 Model parameters and assumptions<a id="23"></a>

### Absorption

The model includes oral administration of (E)-clomiphene after clomiphene citrate or enclomiphene citrate dosing. The clinical panel study used clomiphene citrate tablets containing the E/Z isomer mixture, and the model evaluates the (E)-clomiphene fraction relevant to the measured parent-metabolite dataset ([Kovar 2022](#5)).

Oral absorption is represented with a tablet Weibull dissolution function and compound intestinal permeability. The tablet formulation parameters describe the oral input profile, while differences between CYP2D6 activity-score groups are assigned to metabolism rather than absorption.

The external literature studies include single-dose and multiple-dose oral dosing conditions. These data support evaluation of oral input behavior across lower single doses and repeated enclomiphene exposure, but they do not by themselves resolve individual CYP2D6 activity in the absence of genotype or phenotype information.

### Distribution

(E)-Clomiphene is represented as a highly lipophilic, highly protein-bound compound with logP of 5.67 and f<sub>u</sub> of 0.08% as summarized in [Section 2.2](#22). The metabolites are less lipophilic but remain substantially bound, with logP values of 4.17 for (E)-N-desethylclomiphene, 5.50 for (E)-4-hydroxyclomiphene, and 3.71 for (E)-4-hydroxy-N-desethylclomiphene ([Kovar 2022](#5)).

Partition coefficients were calculated with the Schmitt, Rodgers and Rowland, or Berezhkovskiy methods, depending on the compound ([Schmitt 2008](#5), [Rodgers 2005](#5), [Rodgers 2006](#5), [Berezhkovskiy 2004](#5)). Cellular permeabilities were calculated with the Charge-dependent Schmitt or PK-Sim Standard methods. The model therefore treats the parent and metabolites as separate distribution entities rather than as a single lumped active moiety.

The active hydroxylated metabolites are represented with their own molecular weight, pK<sub>a</sub>, lipophilicity, plasma binding and clearance parameters. This separation is required because metabolite exposure is controlled by both formation from upstream compounds and metabolite-specific elimination.

### Metabolism and elimination

Clomiphene elimination is represented by CYP2D6-dependent hydroxylation and desethylation, CYP3A4-dependent desethylation and metabolite turnover, CYP2B6-dependent hydroxylation, renal filtration, enterohepatic recirculation and residual hepatic clearance components.

* CYP2D6

CYP2D6 forms (E)-4-hydroxyclomiphene from (E)-clomiphene and contributes to desethylation and downstream metabolite elimination. Pathway-specific K<sub>m</sub> values are used, while k<sub>cat</sub> values depend on activity score ([Kovar 2022](#5), [Mürdter 2012](#5)).

The CYP2D6 activity-score implementation is the key determinant of simulated exposure differences across poor, intermediate, normal and ultrarapid metabolizer groups. Poor-metabolizer activity is set to zero, while non-zero activity-score groups use scaled k<sub>cat</sub> values.

* CYP3A4, CYP2B6 and residual clearance

CYP3A4 is implemented for (E)-N-desethylclomiphene formation and downstream metabolite turnover. CYP2B6 contributes to (E)-4-hydroxyclomiphene formation from (E)-clomiphene. These pathways support non-CYP2D6 clearance and metabolite formation where the *in vitro* data indicate additional enzymatic contribution ([Kovar 2022](#5), [Mazzarino 2013](#5)).

Residual hepatic clearance terms are empirical. They should be interpreted as structural model components required to describe total disposition rather than as direct measurements of a single biochemical pathway.

* Renal filtration and enterohepatic recirculation

Renal filtration is included with compound-specific GFR fractions for the parent and metabolites. Enterohepatic recirculation is represented with continuous bile release fractions where required by the model structure.

# 3 Results and Discussion<a id="3"></a>

The PBPK model for (E)-clomiphene was developed and evaluated with clinical pharmacokinetic data after oral clomiphene or enclomiphene administration. The evaluation covers single-dose and multiple-dose administration, (E)-clomiphene and three circulating metabolites, and CYP2D6 activity scores from 0 to 3.

Model-building data from [Mürdter 2016](#5) supported the parent-metabolite structure and the activity-score-dependent CYP2D6 pathways. Verification used independent (E)-clomiphene profiles from [Mikkelson 1986](#5), [Miller 2019](#5), [Ratiopharm GmbH 2016](#5), and [Wiehle 2013](#5). The external studies mainly assess parent-compound disposition, while the activity-score panel assesses parent-metabolite behavior across CYP2D6 groups.

The model includes CYP2D6-dependent hydroxylation and desethylation, CYP3A4- and CYP2B6-mediated metabolism, passive renal filtration, residual hepatic clearance, and enterohepatic recirculation. Goodness-of-fit diagnostics are separated for (E)-clomiphene, (E)-N-desethylclomiphene, (E)-4-hydroxyclomiphene, and (E)-4-hydroxy-N-desethylclomiphene to avoid ambiguous parent-metabolite legends.

The next sections show:

1. the final model input parameters for the building blocks in [Section 3.1](#31).
2. analyte-specific goodness-of-fit diagnostics in [Section 3.2](#32).
3. simulated vs. observed concentration-time profiles for model building and verification in [Section 3.3](#33).

Residual uncertainty concerns non-CYP2D6 clearance, protein-binding estimates, and individual variability within the same CYP2D6 activity-score group. Further genotype-specific refinement would require additional clinical data with paired parent-metabolite profiles.

## 3.1 Clomiphene final input parameters<a id="31"></a>

The following input-parameter tables summarize the final model parameterization for (E)-clomiphene and its metabolites. Parameter interpretation should be based on the source descriptions in [Section 2.2](#22) and the assumptions in [Section 2.3](#23).

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

##### Metabolizing Enzyme: CYP2D6-Kröner 2018 (Study Ratiopharm GmbH 2016) - (Z)-3-OH-clomiphene

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

##### Metabolizing Enzyme: CYP2D6-Mazzarino et al. 2013 (Study Ratiopharm GmbH 2016) - (E)-DE-clomiphene

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

##### Metabolizing Enzyme: CYP2D6-Mürdter et al. 2012 (Study Ratiopharm GmbH 2016) - (E)-4-OH-clomiphene

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

The goodness-of-fit diagnostics are separated by analyte. This keeps the parent and three metabolite legends and error measures distinct.

### 3.2.1 (E)-Clomiphene goodness-of-fit diagnostics<a id="321"></a>

(E)-Clomiphene GOF diagnostics include the external literature studies and the CYP2D6 activity-score panel study. These diagnostics assess parent-compound exposure across oral single-dose, oral multiple-dose, and CYP2D6-stratified conditions.

<a id="table-3-1"></a>

**Table 3-1: GMFE for (E)-Clomiphene goodness-of-fit diagnostics**

|Group          |GMFE |
|:--------------|:----|
|(E)-clomiphene |1.44 |

<br>
<br>

<a id="figure-3-1"></a>

![](images/006_section_3/008_section_32/009_section_321/2_gof_plot_predictedVsObserved.png)

**Figure 3-1: (E)-Clomiphene goodness-of-fit diagnostics**

<br>
<br>

<a id="figure-3-2"></a>

![](images/006_section_3/008_section_32/009_section_321/3_gof_plot_residualsOverTime.png)

**Figure 3-2: (E)-Clomiphene goodness-of-fit diagnostics**

<br>
<br>

### 3.2.2 (E)-4-Hydroxyclomiphene goodness-of-fit diagnostics<a id="322"></a>

(E)-4-Hydroxyclomiphene GOF diagnostics focus on the CYP2D6 activity-score panel study. This metabolite is directly informative for CYP2D6-dependent hydroxylation of (E)-clomiphene.

<a id="table-3-2"></a>

**Table 3-2: GMFE for (E)-4-Hydroxyclomiphene goodness-of-fit diagnostics**

|Group                   |GMFE |
|:-----------------------|:----|
|(E)-4-hydroxyclomiphene |1.64 |

<br>
<br>

<a id="figure-3-3"></a>

![](images/006_section_3/008_section_32/010_section_322/5_gof_plot_predictedVsObserved.png)

**Figure 3-3: (E)-4-Hydroxyclomiphene goodness-of-fit diagnostics**

<br>
<br>

<a id="figure-3-4"></a>

![](images/006_section_3/008_section_32/010_section_322/6_gof_plot_residualsOverTime.png)

**Figure 3-4: (E)-4-Hydroxyclomiphene goodness-of-fit diagnostics**

<br>
<br>

### 3.2.3 (E)-N-desethylclomiphene goodness-of-fit diagnostics<a id="323"></a>

(E)-N-Desethylclomiphene GOF diagnostics focus on the CYP2D6 activity-score panel study. This metabolite reflects desethylation contributions from CYP2D6 and CYP3A4 pathways.

<a id="table-3-3"></a>

**Table 3-3: GMFE for (E)-N-desethylclomiphene goodness-of-fit diagnostics**

|Group                    |GMFE |
|:------------------------|:----|
|(E)-N-desethylclomiphene |1.87 |

<br>
<br>

<a id="figure-3-5"></a>

![](images/006_section_3/008_section_32/011_section_323/8_gof_plot_predictedVsObserved.png)

**Figure 3-5: (E)-N-desethylclomiphene goodness-of-fit diagnostics**

<br>
<br>

<a id="figure-3-6"></a>

![](images/006_section_3/008_section_32/011_section_323/9_gof_plot_residualsOverTime.png)

**Figure 3-6: (E)-N-desethylclomiphene goodness-of-fit diagnostics**

<br>
<br>

### 3.2.4 (E)-4-Hydroxy-N-desethylclomiphene goodness-of-fit diagnostics<a id="324"></a>

(E)-4-Hydroxy-N-desethylclomiphene GOF diagnostics focus on the CYP2D6 activity-score panel study. This section supports evaluation of downstream metabolite formation and elimination.

<a id="table-3-4"></a>

**Table 3-4: GMFE for (E)-4-Hydroxy-N-desethylclomiphene goodness-of-fit diagnostics**

|Group                              |GMFE |
|:----------------------------------|:----|
|(E)-4-hydroxy-N-desethylclomiphene |1.56 |

<br>
<br>

<a id="figure-3-7"></a>

![](images/006_section_3/008_section_32/012_section_324/11_gof_plot_predictedVsObserved.png)

**Figure 3-7: (E)-4-Hydroxy-N-desethylclomiphene goodness-of-fit diagnostics**

<br>
<br>

<a id="figure-3-8"></a>

![](images/006_section_3/008_section_32/012_section_324/12_gof_plot_residualsOverTime.png)

**Figure 3-8: (E)-4-Hydroxy-N-desethylclomiphene goodness-of-fit diagnostics**

<br>
<br>

## 3.3 Concentration-time profiles<a id="33"></a>

The concentration-time profile sections show observed and simulated plasma concentrations for the CYP2D6 activity-score panel study and the external literature studies. Lines show simulated concentrations. Symbols show mean observed data. Error bars show the corresponding standard deviations, where available ([Kovar 2022](#5), Supplement Figures S1-S8). The section split follows the scientific role of the data rather than the analyte split used for GOF diagnostics.

### 3.3.1 Model Building<a id="331"></a>

The model-building profiles comprise the CYP2D6 activity-score panel with paired parent and metabolite observations.

<a id="figure-3-9"></a>

![](images/006_section_3/013_section_33/014_section_331/1_time_profile_plot_Clomiphene_Murdter__2016_____E__clomiphene__42_mg__po__n_6__AS_0_.png)

**Figure 3-9: Mürdter 2016: (E)-clomiphene, 42 mg, po, n=6 (AS=0)**

<br>
<br>

<a id="figure-3-10"></a>

![](images/006_section_3/013_section_33/014_section_331/2_time_profile_plot_Clomiphene_Murdter__2016_____E__clomiphene__42_mg__po__n_4__AS_0_5_.png)

**Figure 3-10: Mürdter 2016: (E)-clomiphene, 42 mg, po, n=4 (AS=0.5)**

<br>
<br>

<a id="figure-3-11"></a>

![](images/006_section_3/013_section_33/014_section_331/3_time_profile_plot_Clomiphene_Murdter__2016_____E__clomiphene__42_mg__po__n_1__AS_0_75_.png)

**Figure 3-11: Mürdter 2016: (E)-clomiphene, 42 mg, po, n=1 (AS=0.75)**

<br>
<br>

<a id="figure-3-12"></a>

![](images/006_section_3/013_section_33/014_section_331/4_time_profile_plot_Clomiphene_Murdter__2016_____E__clomiphene__42_mg__po__n_2__AS_1_.png)

**Figure 3-12: Mürdter 2016: (E)-clomiphene, 42 mg, po, n=2 (AS=1)**

<br>
<br>

<a id="figure-3-13"></a>

![](images/006_section_3/013_section_33/014_section_331/5_time_profile_plot_Clomiphene_Murdter__2016_____E__clomiphene__42_mg__po__n_3__AS_2_.png)

**Figure 3-13: Mürdter 2016: (E)-clomiphene, 42 mg, po, n=3 (AS=2)**

<br>
<br>

<a id="figure-3-14"></a>

![](images/006_section_3/013_section_33/014_section_331/6_time_profile_plot_Clomiphene_Murdter__2016_____E__clomiphene__42_mg__po__n_3__AS_3_.png)

**Figure 3-14: Mürdter 2016: (E)-clomiphene, 42 mg, po, n=3 (AS=3)**

<br>
<br>

### 3.3.2 Model Verification<a id="332"></a>

The model-verification profiles comprise independent literature studies after single-dose and multiple-dose oral administration.

<a id="figure-3-15"></a>

![](images/006_section_3/013_section_33/015_section_332/7_time_profile_plot_Clomiphene_Mikkelson__1986_____E__clomiphene__21_mg__po__n_23.png)

**Figure 3-15: Mikkelson 1986: (E)-clomiphene, 21 mg, po, n=23**

<br>
<br>

<a id="figure-3-16"></a>

![](images/006_section_3/013_section_33/015_section_332/8_time_profile_plot_Clomiphene_Miller__2019_____E__clomiphene__21_mg__po__md__n_12.png)

**Figure 3-16: Miller 2019: (E)-clomiphene, 21 mg, po, md, n=12**

<br>
<br>

<a id="figure-3-17"></a>

![](images/006_section_3/013_section_33/015_section_332/9_time_profile_plot_Clomiphene_Ratiopharm_GmbH__2016_____E__clomiphene__21_mg__po__n_18.png)

**Figure 3-17: Ratiopharm GmbH 2016: (E)-clomiphene, 21 mg, po, n=18**

<br>
<br>

<a id="figure-3-18"></a>

![](images/006_section_3/013_section_33/015_section_332/10_time_profile_plot_Clomiphene_Wiehle__2013____enclomiphene_citrate__12_5_mg__po__md__n_14.png)

**Figure 3-18: Wiehle 2013: enclomiphene citrate, 12.5 mg, po, md, n=14**

<br>
<br>

<a id="figure-3-19"></a>

![](images/006_section_3/013_section_33/015_section_332/11_time_profile_plot_Clomiphene_Wiehle__2013____enclomiphene_citrate__25_mg__po__md__n_16.png)

**Figure 3-19: Wiehle 2013: enclomiphene citrate, 25 mg, po, md, n=16**

<br>
<br>

<a id="figure-3-20"></a>

![](images/006_section_3/013_section_33/015_section_332/12_time_profile_plot_Clomiphene_Wiehle__2013____enclomiphene_citrate__6_25_mg__po__md__n_16.png)

**Figure 3-20: Wiehle 2013: enclomiphene citrate, 6.25 mg, po, md, n=16**

<br>
<br>

# 4 Conclusion<a id="4"></a>

The clomiphene PBPK model describes the evaluated plasma concentration-time data for (E)-clomiphene, (E)-N-desethylclomiphene, (E)-4-hydroxyclomiphene, and (E)-4-hydroxy-N-desethylclomiphene after oral administration in adults. The evaluation covers single-dose and multiple-dose applications and CYP2D6 activity scores from 0 to 3.

The model uses common absorption and distribution assumptions across CYP2D6 groups. Activity-score-dependent CYP2D6 catalytic rates govern hydroxylation, desethylation, and downstream metabolite elimination. CYP3A4, CYP2B6, passive renal filtration, residual hepatic clearance, and enterohepatic recirculation provide additional disposition pathways.

The concentration-time profiles and goodness-of-fit diagnostics characterize model performance within the evaluated dose, regimen, analyte, population, and CYP2D6 ranges. No formal acceptance criterion was applied.

The main limitations are the small intermediate-metabolizer groups, extrapolated CYP2D6 catalytic rates, and limited paired parent-metabolite data outside the activity-score panel.

# 5 References<a id="5"></a>

[1] C Kovar, L Kovar, S Rüdesheim, D Selzer, B Ganchev, P Kröner, S Igel, R Kerb, E Schaeffeler, T E Mürdter, M Schwab, T Lehr. Prediction of Drug-Drug-Gene Interaction Scenarios of (E)-Clomiphene and Its Metabolites Using Physiologically Based Pharmacokinetic Modeling. Pharmaceutics, 2022;14:2604. doi: [10.3390/pharmaceutics14122604](https://doi.org/10.3390/pharmaceutics14122604).

[2] S Rüdesheim, H L H Loer, D Feick, F Z Marok, L M Fuhr, D Selzer, D Teutonico, A R P Schneider, J Solodenko, S Frechen, M van der Lee, D J A R Moes, J J Swen, M Schwab, T Lehr. A Comprehensive CYP2D6 Drug-Drug-Gene Interaction Network for Application in Precision Dosing and Drug Development. Clin Pharmacol Ther, 2025;117:1719-1731. doi: [10.1002/cpt.3604](https://doi.org/10.1002/cpt.3604).

[3] T J Mikkelson, P D Kroboth, W J Cameron, L W Dittert, V Chungi, P J Manberg. Single-dose pharmacokinetics of clomiphene citrate in normal volunteers. Fertil Steril, 1986;46:392-396. doi: [10.1016/S0015-0282(16)49574-9](https://doi.org/10.1016/S0015-0282(16)49574-9).

[4] Ratiopharm GmbH. Clomifen-ratiopharm 50 mg Tabletten, Fachinformation, 2016.

[5] R Wiehle, G R Cunningham, N Pitteloud, J Wike, K Hsu, G K Fontenot, M Rosner, A Dwyer, J Podolski. Testosterone restoration using enclomiphene citrate in men with secondary hypogonadism: a pharmacodynamic and pharmacokinetic study. BJU Int, 2013;112:1188-1200. doi: [10.1111/bju.12363](https://doi.org/10.1111/bju.12363).

[6] G D Miller, C Moore, V Nair, B Hill, S E Willick, A D Rogol, D Eichner. Hypothalamic-Pituitary-Testicular Axis Effects and Urinary Detection Following Clomiphene Administration in Males. J Clin Endocrinol Metab, 2019;104:906-914. doi: [10.1210/jc.2018-01159](https://doi.org/10.1210/jc.2018-01159).

[7] T E Mürdter, R Kerb, M Turpeinen, W Schroth, B Ganchev, G M Böhmer, S Igel, E Schaeffeler, U Zanger, H Brauch, M Schwab. Genetic polymorphism of cytochrome P450 2D6 determines oestrogen receptor activity of the major infertility drug clomiphene via its active metabolites. Hum Mol Genet, 2012;21:1145-1154. doi: [10.1093/hmg/ddr543](https://doi.org/10.1093/hmg/ddr543).

[8] T Mürdter. Impact of CYP2D6 genotype and co-medication with paroxetine and clarithromycin on clomiphene metabolism in vivo. Abstracts of the 82nd Annual Meeting of the German Society for Experimental and Clinical Pharmacology and Toxicology (DGPT) in Naunyn-Schmiedeberg's Archives of Pharmacology, 2016.

[9] M Mazzarino, M Biava, X de la Torre, I Fiacco, F Botrè. Characterization of biotransformation pathways of clomiphene, tamoxifen and toremifene as assessed by LC-MS/(MS) following in vitro and excretion studies. Anal Bioanal Chem, 2013;405:5467-5487. doi: [10.1007/s00216-013-6961-7](https://doi.org/10.1007/s00216-013-6961-7).

[10] R Watanabe, T Esaki, H Kawashima, Y Natsume-Kitatani, C Nagao, R Ohashi, K Mizuguchi. Predicting Fraction Unbound in Human Plasma from Chemical Structure: Improved Accuracy in the Low Value Ranges. Mol Pharm, 2018;15:5302-5311. doi: [10.1021/acs.molpharmaceut.8b00785](https://doi.org/10.1021/acs.molpharmaceut.8b00785).

[11] W Schmitt. General approach for the calculation of tissue to plasma partition coefficients. Toxicol In Vitro, 2008;22:457-467. doi: [10.1016/j.tiv.2007.09.010](https://doi.org/10.1016/j.tiv.2007.09.010).

[12] T Rodgers, D Leahy, M Rowland. Physiologically based pharmacokinetic modeling 1: predicting the tissue distribution of moderate-to-strong bases. J Pharm Sci, 2005;94:1259-1276. doi: [10.1002/jps.20322](https://doi.org/10.1002/jps.20322).

[13] T Rodgers, M Rowland. Physiologically based pharmacokinetic modelling 2: predicting the tissue distribution of acids, very weak bases, neutrals and zwitterions. J Pharm Sci, 2006;95:1238-1257. doi: [10.1002/jps.20502](https://doi.org/10.1002/jps.20502).

[14] L M Berezhkovskiy. Volume of distribution at steady state for a linear pharmacokinetic system with peripheral elimination. J Pharm Sci, 2004;93:1628-1640. doi: [10.1002/jps.20073](https://doi.org/10.1002/jps.20073).

[15] Moore C, Bourque MS, Halman A, Agúndez JAG, Prows CA, Hikino K, et al. Clinical Pharmacogenetics Implementation Consortium (CPIC) Guideline for CYP2D6 Genotype and Use of 5-HT<sub>3</sub> Receptor Antagonists: 2026 Update. Clinical Pharmacology & Therapeutics. 2026;120:387-393. doi: [10.1002/cpt.70291](https://doi.org/10.1002/cpt.70291).

[16] V B Siramshetty, I Grishagin, C T Nguyen, T Peryea, Y Skovpen, O Stroganov, D Katzel, T Sheils, A Jadhav, E A Mathé, N T Southall. NCATS Inxight Drugs: a comprehensive and curated portal for translational research. Nucleic Acids Res, 2022;50:D1307-D1316. doi: [10.1093/nar/gkab918](https://doi.org/10.1093/nar/gkab918).

[17] ChemAxon. Chemicalize property predictions, 2009. [https://chemicalize.com/](https://chemicalize.com/). Accessed 2021-08-09.

[18] P Das, M Prajapati, A Maity. Study of equilibrium solubility of Clomiphene Citrate as model compound by Saturation orbital shake flask method. J Pharm Adv Res, 2020;3:843-847.

[19] B Ganchev. Charakterisierung der metabolischen Bioaktivierung des Clomifens unter besonderer Berücksichtigung genetischer Polymorphismen. PhD thesis, Eberhard Karls University Tübingen, 2014.

[20] P Kröner. Hydroxylierte Metaboliten des Clomifens: in vitro und in vivo Untersuchungen zur Bildung, Aktivität und Konjugation. PhD thesis, Eberhard Karls University Tübingen, 2018.

[21] R Kawai, M Lemaire, J L Steimer, A Bruelisauer, W Niederberger, M Rowland. Physiologically based pharmacokinetic study on a cyclosporin derivative, SDZ IMM 125. J Pharmacokinet Biopharm, 1994;22:327-365. doi: [10.1007/BF02353860](https://doi.org/10.1007/BF02353860).

[22] Open Systems Pharmacology Suite Community. Open Systems Pharmacology Suite Manual, 2021. [Open Systems Pharmacology Suite documentation](https://github.com/Open-Systems-Pharmacology/OSPSuite.Documentation). Accessed 2022-02-19.

