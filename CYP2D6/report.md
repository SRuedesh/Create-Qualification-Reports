# CYP2D6 DDGI Qualification

| Version                         | main-OSP12.2                                                 |
| ------------------------------- | ------------------------------------------------------------ |
| Qualification Plan Release      | https://github.com/Open-Systems-Pharmacology/DDGI-CYP2D6     |
| OSP Version                     | 12.2                                                         |
| Qualification Framework Version | 3.5                                                          |

This qualification report is filed at:

https://github.com/Open-Systems-Pharmacology/OSP-Qualification-Reports

# Table of Contents

 * [1 Introduction](#introduction)
   * [1.1 Objective](#objective)
 * [2 DDI Evaluations](#ddi-evaluations)
   * [2.1 DDI Network Evaluations](#ddi-network-evaluations)
     * [2.1.1 Paroxetine - Alprazolam DDI](#paroxetine-alprazolam-ddi)
     * [2.1.2 Fluvoxamine - Atomoxetine DDI](#fluvoxamine-atomoxetine-ddi)
     * [2.1.3 Atomoxetine - Desipramine DDI](#atomoxetine-desipramine-ddi)
     * [2.1.4 Quinidine - Desipramine DDI](#quinidine-desipramine-ddi)
     * [2.1.5 Quinidine - Dextromethorphan DDI](#quinidine-dextromethorphan-ddi)
     * [2.1.6 Quinidine - Digoxin DDI](#quinidine-digoxin-ddi)
     * [2.1.7 Cimetidine - Metoprolol DDI](#cimetidine-metoprolol-ddi)
     * [2.1.8 Paroxetine - Metoprolol DDI](#paroxetine-metoprolol-ddi)
     * [2.1.9 Rifampicin - Metoprolol DDI](#rifampicin-metoprolol-ddi)
     * [2.1.10 Atomoxetine - Midazolam DDI](#atomoxetine-midazolam-ddi)
     * [2.1.11 Itraconazole - Paroxetine DDI](#itraconazole-paroxetine-ddi)
     * [2.1.12 Quinidine - Paroxetine DDI](#quinidine-paroxetine-ddi)
     * [2.1.13 Carbamazepine - Quinidine DDI](#carbamazepine-quinidine-ddi)
     * [2.1.14 Cimetidine - Quinidine DDI](#cimetidine-quinidine-ddi)
     * [2.1.15 Erythromycin - Quinidine DDI](#erythromycin-quinidine-ddi)
     * [2.1.16 Fluvoxamine - Quinidine DDI](#fluvoxamine-quinidine-ddi)
     * [2.1.17 Itraconazole - Quinidine DDI](#itraconazole-quinidine-ddi)
     * [2.1.18 Omeprazole - Quinidine DDI](#omeprazole-quinidine-ddi)
     * [2.1.19 Rifampicin - Quinidine DDI](#rifampicin-quinidine-ddi)
     * [2.1.20 Verapamil - Quinidine DDI](#verapamil-quinidine-ddi)
     * [2.1.21 Ketoconazole - Risperidone DDI](#ketoconazole-risperidone-ddi)
     * [2.1.22 Rifampicin - Risperidone DDI](#rifampicin-risperidone-ddi)
     * [2.1.23 Verapamil - Risperidone DDI](#verapamil-risperidone-ddi)
   * [2.2 DDI Concentration-Time Profiles](#ddi-concentration-time-profiles)
     * [2.2.1 Paroxetine - Alprazolam DDI](#paroxetine-alprazolam-ddi-timeprofile)
     * [2.2.2 Fluvoxamine - Atomoxetine DDI](#fluvoxamine-atomoxetine-ddi-timeprofile)
     * [2.2.3 Atomoxetine - Desipramine DDI](#atomoxetine-desipramine-ddi-timeprofile)
     * [2.2.4 Quinidine - Desipramine DDI](#quinidine-desipramine-ddi-timeprofile)
     * [2.2.5 Quinidine - Dextromethorphan DDI](#quinidine-dextromethorphan-ddi-timeprofile)
     * [2.2.6 Quinidine - Digoxin DDI](#quinidine-digoxin-ddi-timeprofile)
     * [2.2.7 Cimetidine - Metoprolol DDI](#cimetidine-metoprolol-ddi-timeprofile)
     * [2.2.8 Paroxetine - Metoprolol DDI](#paroxetine-metoprolol-ddi-timeprofile)
     * [2.2.9 Rifampicin - Metoprolol DDI](#rifampicin-metoprolol-ddi-timeprofile)
     * [2.2.10 Atomoxetine - Midazolam DDI](#atomoxetine-midazolam-ddi-timeprofile)
     * [2.2.11 Itraconazole - Paroxetine DDI](#itraconazole-paroxetine-ddi-timeprofile)
     * [2.2.12 Quinidine - Paroxetine DDI](#quinidine-paroxetine-ddi-timeprofile)
     * [2.2.13 Carbamazepine - Quinidine DDI](#carbamazepine-quinidine-ddi-timeprofile)
     * [2.2.14 Cimetidine - Quinidine DDI](#cimetidine-quinidine-ddi-timeprofile)
     * [2.2.15 Erythromycin - Quinidine DDI](#erythromycin-quinidine-ddi-timeprofile)
     * [2.2.16 Fluvoxamine - Quinidine DDI](#fluvoxamine-quinidine-ddi-timeprofile)
     * [2.2.17 Itraconazole - Quinidine DDI](#itraconazole-quinidine-ddi-timeprofile)
     * [2.2.18 Omeprazole - Quinidine DDI](#omeprazole-quinidine-ddi-timeprofile)
     * [2.2.19 Rifampicin - Quinidine DDI](#rifampicin-quinidine-ddi-timeprofile)
     * [2.2.20 Verapamil - Quinidine DDI](#verapamil-quinidine-ddi-timeprofile)
     * [2.2.21 Ketoconazole - Risperidone DDI](#ketoconazole-risperidone-ddi-timeprofile)
     * [2.2.22 Rifampicin - Risperidone DDI](#rifampicin-risperidone-ddi-timeprofile)
     * [2.2.23 Verapamil - Risperidone DDI](#verapamil-risperidone-ddi-timeprofile)
 * [3 DGI Evaluations](#dgi-evaluations)
   * [3.1 DGI Parent-Model Evaluations](#dgi-parent-model-evaluations)
     * [3.1.1 Clomiphene DGI](#clomiphene-dgi)
     * [3.1.2 Atomoxetine DGI](#atomoxetine-dgi)
     * [3.1.3 Risperidone DGI](#risperidone-dgi)
   * [3.2 DGI Ratio Plots](#dgi-ratio-plots)
   * [3.3 DGI Concentration-Time Profiles](#dgi-concentration-time-profiles)
     * [3.3.1 Clomiphene DGI](#clomiphene-dgi-timeprofile)
     * [3.3.2 Atomoxetine DGI](#atomoxetine-dgi-timeprofile)
     * [3.3.3 Risperidone DGI](#risperidone-dgi-timeprofile)
 * [4 DDGI Evaluations](#ddgi-evaluations)
   * [4.1 DDGI Network Evaluations](#ddgi-network-evaluations)
     * [4.1.1 Paroxetine - Atomoxetine DDGI](#paroxetine-atomoxetine-ddgi)
     * [4.1.2 Clarithromycin - Clomiphene DDGI](#clarithromycin-clomiphene-ddgi)
     * [4.1.3 Paroxetine - Clomiphene DDGI](#paroxetine-clomiphene-ddgi)
     * [4.1.4 Paroxetine - Desipramine DDGI](#paroxetine-desipramine-ddgi)
     * [4.1.5 Paroxetine - Dextromethorphan DDGI](#paroxetine-dextromethorphan-ddgi)
     * [4.1.6 Quinidine - Metoprolol DDGI](#quinidine-metoprolol-ddgi)
     * [4.1.7 Quinidine - Mexiletine DDGI](#quinidine-mexiletine-ddgi)
   * [4.2 DDGI Concentration-Time Profiles](#ddgi-concentration-time-profiles)
     * [4.2.1 Paroxetine - Atomoxetine DDGI](#paroxetine-atomoxetine-ddgi-timeprofile)
     * [4.2.2 Clarithromycin - Clomiphene DDGI](#clarithromycin-clomiphene-ddgi-timeprofile)
     * [4.2.3 Paroxetine - Clomiphene DDGI](#paroxetine-clomiphene-ddgi-timeprofile)
     * [4.2.4 Paroxetine - Desipramine DDGI](#paroxetine-desipramine-ddgi-timeprofile)
     * [4.2.5 Paroxetine - Dextromethorphan DDGI](#paroxetine-dextromethorphan-ddgi-timeprofile)
     * [4.2.6 Quinidine - Metoprolol DDGI](#quinidine-metoprolol-ddgi-timeprofile)
     * [4.2.7 Quinidine - Mexiletine DDGI](#quinidine-mexiletine-ddgi-timeprofile)
 * [5 Conclusion](#conclusion)
 * [6 References](#references)
 * [7 Appendix](#appendix)
   * [7.1 Open Systems Pharmacology Suite (OSPS) Introduction](#osp-introduction)
   * [7.2 Mathematical Implementation of Drug-Drug Interactions](#mathematical-implementation-of-ddi)
   * [7.3 Automatic (re)-qualification workflow](#automatic-requalification-workflow)
 * [8 Glossary](#glossary)

# 1 Introduction<a id="introduction"></a>

## 1.1 Objective<a id="objective"></a>

This qualification report evaluates the developed physiologically based pharmacokinetic (PBPK) drug-drug-gene interaction (DDGI) network for the ability to perform simulations with the intended purpose to predict cytochrome P450 2D6 (**CYP2D6**)-mediated drug-drug interactions (DDIs) and DDGIs.

To demonstrate the level of confidence, the predictive performance is assessed using a network of PBPK models for selected CYP2D6 perpetrators, victims, and genotype-dependent interaction scenarios together with clinical DD(G)I data from published studies. The models are whole-body PBPK models and allow dynamic interaction simulations in tissues expressing the relevant enzymes or transporters.

The respective *qualification plan* to produce this *qualification report* is transparently documented and provided open-source (https://github.com/Open-Systems-Pharmacology/DDGI-CYP2D6). The same applies for all presented PBPK models including *evaluation reports* on model building and evaluation of each model (https://github.com/Open-Systems-Pharmacology/OSP-PBPK-Model-Library).

*Evaluation reports* including descriptions on model building and detailed evaluations of the included models are documented separately (see [Section 1.2](#12-cyp2d6-ddgi-network)).

Please refer to the [Appendix](#5-appendix) to learn more details:

- An overview over the Open Systems Pharmacology (OSP) Suite is given in chapter [Section 5.1](#51-open-systems-pharmacology-suite-osps-introduction)

- [Section 5.2](#52-mathematical-implementation-of-drug-drug-interactions) shows the implementation of the underlying mathematical equations for DDIs in the OSP suite.

- A detailed general description of the performed qualification workflow (*qualification plan*, *qualification report*, etc.) can be found in chapter [Section 5.3](#53-automatic-re-qualification-workflow).

# 2 DDI Evaluations<a id="ddi-evaluations"></a>

The following section shows the correlations between observed and model-predicted AUC<sub>last</sub> and C<sub>max</sub> ratios, respectively.

Specifically, the PBPK model performance for the PK parameters **AUC ratio (AUCR)** and **C<sub>max</sub> ratio (CmaxR)** is assessed via:

- predicted (*Pred*) vs. observed (*Obs*) plots

- *Pred*/*Obs* vs. *Obs* plots

- geometric mean fold error (GMFE):
  
  ![GMFE equation](images/GFME_equation.PNG)
  
- number of AUCR and CMAXR falling within 2-fold error range and within the limits suggested by [Guest et al. 2011](#references)
  
- detailed table of results for each study

In the plots,

- the dotted lines denote 0.50–2.00 (2-fold) criterion,

- the solid lines denote the limits suggested by [Guest et al. 2011](#references),

- the bold solid line denotes the unity line,

- each color represents one combination of perpetrator and victim (parent drug or metabolite)

***

<a id="figure-2-1"></a>

![](images/003_section_ddi-evaluations/DDIRatio_1_ddi_ratio_plot_AUC_predictedVsObserved.png)

**Figure 2-1: CYP2D6 DDIs.  Predicted vs. Observed AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-2-2"></a>

![](images/003_section_ddi-evaluations/DDIRatio_1_ddi_ratio_plot_AUC_residualsVsObserved.png)

**Figure 2-2: CYP2D6 DDIs.  Predicted/Observed vs. Observed AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-2-3"></a>

![](images/003_section_ddi-evaluations/DDIRatio_1_ddi_ratio_plot_CMAX_predictedVsObserved.png)

**Figure 2-3: CYP2D6 DDIs.  Predicted vs. Observed CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-2-4"></a>

![](images/003_section_ddi-evaluations/DDIRatio_1_ddi_ratio_plot_CMAX_residualsVsObserved.png)

**Figure 2-4: CYP2D6 DDIs.  Predicted/Observed vs. Observed CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="table-2-1"></a>

**Table 2-1: GMFE for CYP2D6 DDIs Ratio**

|PK parameter |GMFE |
|:------------|:----|
|AUC          |1.32 |
|CMAX         |1.28 |

<br>
<br>

<a id="table-2-2"></a>

**Table 2-2: Summary table for CYP2D6 DDIs - AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

|AUC                          |Number |Ratio [%] |
|:----------------------------|:------|:---------|
|Points total                 |49     |-        |
|Points within Guest *et al.* |27     |55.10     |
|Points within 2 fold         |46     |93.88     |

<br>
<br>

<a id="table-2-3"></a>

**Table 2-3: Summary table for CYP2D6 DDIs - CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

|CMAX                         |Number |Ratio [%] |
|:----------------------------|:------|:---------|
|Points total                 |48     |-        |
|Points within Guest *et al.* |28     |58.33     |
|Points within 2 fold         |45     |93.75     |

<br>
<br>

<a id="table-2-4"></a>

**Table 2-4: Summary table for CYP2D6 DDIs**

|DataID |Perpetrator                               |Victim                   |Predicted AUC Ratio |Observed AUC Ratio |Pred/Obs AUC Ratio |Predicted CMAX Ratio |Observed CMAX Ratio |Pred/Obs CMAX Ratio |Reference             |
|:------|:-----------------------------------------|:------------------------|:-------------------|:------------------|:------------------|:--------------------|:-------------------|:-------------------|:---------------------|
|16940  |Quinidine, 50 mg, PO, SD: 1h before DEX   |Dextromethorphan, PO     |2.93                |6.84               |0.43               |2.32                 |6.07                |0.38                |Capon 1996            |
|16942  |Quinidine, 50 mg, PO, SD: 1h before DEX   |Total dextrorphan, PO    |1.15                |0.99               |1.16               |0.44                 |0.24                |1.84                |Capon 1996            |
|16946  |Quinidine, 200 mg, PO, BID                |Digoxin, IV              |1.13                |0.96               |1.18               |0.68                 |-                  |-                  |Steiness 1980         |
|16948  |Quinidine, 200 mg, PO, QID                |Digoxin, IV              |2.04                |2.05               |1.00               |1.03                 |1.65                |0.62                |Ochs 1981             |
|16954  |Quinidine, 30 mg, PO, BID                 |Paroxetine, PO           |1.93                |1.29               |1.50               |1.04                 |1.14                |0.92                |Schoedel 2012         |
|16956  |Carbamazepine, 200/400 mg, PO, BID        |Quinidine, PO            |0.43                |0.41               |1.06               |0.63                 |0.50                |1.26                |Andreasen 2007        |
|16958  |Carbamazepine, 200/400 mg, PO, BID        |3-Hydroxyquinidine, PO   |0.77                |0.90               |0.85               |1.32                 |1.48                |0.89                |Andreasen 2007        |
|16960  |Cimetidine, 300 mg, PO, QD                |Quinidine, PO            |1.00                |1.13               |0.89               |1.01                 |0.90                |1.12                |Kolb 1984             |
|16962  |Cimetidine, 300 mg, PO, QID               |Quinidine, PO            |1.00                |1.28               |0.78               |1.01                 |1.26                |0.80                |Hardy 1983            |
|16964  |Fluvoxamine, 100 mg, PO, QD               |Quinidine, PO            |1.17                |1.66               |0.70               |1.00                 |1.32                |0.76                |Damkier 1999a         |
|16966  |Fluvoxamine, 100 mg, PO, QD               |3-Hydroxyquinidine, PO   |1.12                |1.23               |0.91               |0.91                 |0.96                |0.95                |Damkier 1999a         |
|16968  |Omeprazole, 40 mg, PO, QD                 |Quinidine, PO            |1.00                |1.15               |0.87               |1.00                 |1.12                |0.89                |Ching 1991            |
|16970  |Omeprazole, 40 mg, PO, QD                 |3-Hydroxyquinidine, PO   |1.00                |0.90               |1.11               |1.00                 |0.85                |1.17                |Ching 1991            |
|16972  |Rifampicin, 600 mg, PO, QD                |Quinidine, PO            |0.19                |0.12               |1.58               |0.43                 |0.34                |1.27                |Damkier 1999          |
|16974  |Rifampicin, 600 mg, PO, QD                |3-Hydroxyquinidine, PO   |0.39                |0.78               |0.50               |0.98                 |2.90                |0.34                |Damkier 1999          |
|16976  |Verapamil, 80 mg, PO, TID                 |Quinidine, PO            |1.48                |1.21               |1.22               |1.19                 |0.96                |1.24                |Edwards 1987          |
|16978  |Verapamil, 120 mg, PO, TID                |Quinidine, PO            |1.72                |1.25               |1.38               |1.27                 |0.96                |1.32                |Edwards 1987          |
|16980  |Paroxetine, 20 mg, PO, QD                 |Alprazolam, PO           |1.02                |0.94               |1.09               |1.02                 |0.97                |1.05                |Calvo 2004            |
|16986  |Fluvoxamine, 50/100 mg, PO, QD/QD         |Atomoxetine, PO          |1.34                |1.30               |1.03               |1.16                 |1.36                |0.85                |Todor 2017            |
|17078  |Atomoxetine, 60 mg, PO, BID               |Desipramine, PO          |1.07                |1.17               |0.91               |1.00                 |1.06                |0.95                |Sauer 2004            |
|17096  |Quinidine, 200 mg, PO, QD                 |Desipramine, PO          |4.10                |6.52               |0.63               |1.34                 |1.59                |0.85                |Brøsen 1989           |
|17108  |Cimetidine, 800 mg, PO, QD                |Metoprolol, PO           |1.22                |0.91               |1.34               |1.24                 |1.56                |0.80                |Chellingworth 1988    |
|17110  |Cimetidine, 800 mg, PO, QD                |Metoprolol, PO           |1.15                |1.34               |0.86               |1.19                 |1.62                |0.73                |Chellingworth 1988    |
|17112  |Cimetidine, 800 mg, PO, QD                |Metoprolol, PO           |1.11                |1.44               |0.77               |1.13                 |1.23                |0.92                |Toon 1988             |
|17114  |Cimetidine, 200/200/200/400 mg, PO, QD    |Metoprolol, PO           |1.09                |1.64               |0.66               |1.06                 |1.56                |0.68                |Kirch 1982            |
|17116  |Paroxetine, 10.10.2010 mg, PO, QD/BID     |Metoprolol, PO           |4.20                |4.33               |0.97               |2.07                 |2.51                |0.83                |Stout 2011            |
|17118  |Paroxetine, 10.10.2010 mg, PO, QD/BID     |Metoprolol, PO           |6.28                |3.62               |1.73               |2.84                 |3.65                |0.78                |Stout 2011            |
|17120  |Paroxetine, 20 mg, PO, QD                 |R-Metoprolol, PO         |3.70                |2.96               |1.25               |3.18                 |2.74                |1.16                |Parker 2011           |
|17122  |Paroxetine, 20 mg, PO, QD                 |S-Metoprolol, PO         |3.59                |2.91               |1.23               |3.11                 |2.64                |1.18                |Parker 2011           |
|17124  |Paroxetine, 20 mg, PO, QD                 |R-Metoprolol, PO         |3.92                |3.06               |1.28               |2.69                 |2.11                |1.27                |Parker 2011           |
|17126  |Paroxetine, 20 mg, PO, QD                 |S-Metoprolol, PO         |3.87                |2.50               |1.55               |2.66                 |1.87                |1.42                |Parker 2011           |
|17128  |Paroxetine, 20 mg, PO, QD                 |R-Metoprolol, PO         |3.65                |4.06               |0.90               |3.13                 |3.74                |0.84                |Parker 2011           |
|17130  |Paroxetine, 20 mg, PO, QD                 |S-Metoprolol, PO         |3.54                |3.09               |1.14               |3.06                 |2.88                |1.06                |Parker 2011           |
|17132  |Paroxetine, 10 mg, PO, BID                |R-Metoprolol, PO         |4.22                |9.88               |0.43               |2.30                 |2.55                |0.90                |Hemeryck 2000         |
|17134  |Paroxetine, 10 mg, PO, BID                |S-Metoprolol, PO         |3.77                |7.01               |0.54               |2.04                 |1.71                |1.19                |Hemeryck 2000         |
|17152  |Rifampicin, 600 mg, PO, QD                |Metoprolol, PO           |0.84                |0.74               |1.14               |1.00                 |0.66                |1.52                |Bennett 1982          |
|17154  |Atomoxetine, 60 mg, PO, BID               |Midazolam, PO            |1.08                |1.32               |0.82               |1.01                 |1.01                |1.00                |Sauer 2004            |
|17156  |Atomoxetine, 60 mg, PO, BID               |Midazolam, PO            |0.98                |1.51               |0.65               |1.01                 |1.52                |0.66                |Sauer 2004            |
|17158  |Paroxetine, 100 mg, PO, BID               |Paroxetine, PO           |1.17                |1.65               |0.71               |1.03                 |1.40                |0.74                |Yasui-Furukori 2007   |
|17160  |Erythromycin, 250/250/250/250 mg, PO, QID |Quinidine, PO            |1.34                |1.19               |1.13               |1.09                 |1.39                |0.78                |Damkier 1999b         |
|17162  |Itraconazole, 200 mg, PO, QD              |Quinidine, PO            |1.72                |2.05               |0.84               |1.42                 |1.61                |0.88                |Kaukonen 1997         |
|17164  |Itraconazole, 100 mg, PO, QD              |Quinidine, PO            |1.67                |2.58               |0.65               |1.13                 |1.32                |0.86                |Damkier 1999b         |
|17166  |Ketoconazole, 200 mg, PO, QD              |Risperidone, PO          |1.28                |1.49               |0.86               |1.55                 |1.30                |1.19                |Mahatthanatrakul 2012 |
|17168  |Ketoconazole, 200 mg, PO, QD              |9-Hydroxyrisperidone, PO |1.06                |0.54               |1.97               |1.22                 |0.54                |2.27                |Mahatthanatrakul 2012 |
|17170  |Rifampicin, 600 mg, PO, QD                |Risperidone, PO          |0.55                |0.51               |1.08               |0.52                 |0.76                |0.68                |Kim 2018              |
|17172  |Rifampicin, 600 mg, PO, QD                |9-Hydroxyrisperidone, PO |0.79                |0.60               |1.32               |0.81                 |0.67                |1.21                |Kim 2018              |
|17174  |Rifampicin, 600 mg, PO, QD                |Risperidone, PO          |0.49                |0.29               |1.68               |0.50                 |0.50                |1.00                |Mahatthanatrakul 2007 |
|17176  |Verapamil, 80/80/80 mg, PO, TID           |Risperidone, PO          |1.32                |1.58               |0.84               |1.58                 |1.59                |0.99                |Nakagami 2005         |
|17178  |Verapamil, 80/80/80 mg, PO, TID           |9-Hydroxyrisperidone, PO |1.23                |1.58               |0.78               |1.27                 |1.59                |0.80                |Nakagami 2005         |

<br>
<br>

## 2.1 DDI Network Evaluations<a id="ddi-network-evaluations"></a>

**Figure 1** shows the developed CYP2D6 DDGI network of interacting perpetrator and victim drugs. (a) Schematic illustration of the modeled interactions of CYP2D6 perpetrator and victim drugs. Black arrows indicate metabolism or transport, green arrows indicate induction, red solid lines indicate competitive inhibition, red dashed lines down-regulation (bupropion), noncompetitive inhibition (verapamil P-gp inhibition) or mechanism-based inactivation (others). (b-c) Drug-drug-(gene) interaction matrix for modeled interactions mediated by (a) CYP2D6 and (b) CYP3A4 and P-gp. Colors indicate categories according to the FDA Examples of Drugs that Interact with CYP Enzymes and Transporter Systems.42 Height of the grey ribbons indicates the number of clinical studies for the respective interaction covered by the network, numbers in brackets indicate the number of clinical interaction studies for the corresponding compound. CYP: cytochrome P450, P-gp: P-glycoprotein.

**Figure** **1: CYP2D6 DDGI modeling network**
<a id="figure-2-5"></a>

![CYP2D6 DDGI network](images/Figure_1_DDGI_Network.pdf)

The following victim and/or perpetrator PBPK models were applied: 

- **Alprazolam**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Alprazolam-Model/blob/master/Alprazolam-Model.json
- **Atomoxetine**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Atomoxetine-Model/blob/main/atomoxetine-model.json 
- **Bupropion**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Bupropion-Model/blob/main/Bupropion-Model.json 
- **Carbamazepine**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Carbamazepine-Model/blob/main/Carbamazepine-Model.json
- **Cimetidine**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Cimetidine-Model/blob/master/Cimetidine-Model.json
- **Clarithromycin**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Clarithromycin-Model/blob/master/Clarithromycin-Model.json
- **(E)-Clomiphene** 
  Model snapshot:https://github.com/Open-Systems-Pharmacology/Clomiphene-Model/blob/main/(E)-clomiphene-DGI-Model.json 
- **Desipramine** 
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Desipramine-Model/blob/main/Desipramine-Model.json
- **Dextromethorphan** 
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Dextromethorphan-Model/blob/main/dextromethorphan_aggregated_simulations.json
- **Digoxin** 
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Digoxin-Model/blob/master/Digoxin.json
- **Erythromycin** 
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Erythromycin-Model/blob/master/Erythromycin-Model.json
- **Fluvoxamine**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Fluvoxamine-Model/blob/master/Fluvoxamine-Model.json
- **Itraconazole**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Itraconazole-Model/blob/master/Itraconazole-Model.json
- **Ketoconazole**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Ketoconazole-Model/blob/main/Ketoconazole-Model.json
- **Metoprolol**
  Model file: https://github.com/Open-Systems-Pharmacology/Metoprolol-Model/blob/main/Metoprolol-Model.pksim5
- **Mexiletine** 
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Mexiletine-Model/blob/main/Mexiletine-Model.json
- **Omeprazole**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Omeprazole-Model/blob/main/Omeprazole-Model.json
- **Paroxetine** 
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Paroxetine-Model/blob/main/paroxetine-model.json
- **Quinidine** 
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Quinidine-Model/blob/main/Quinidine-Model.json
- **Rifampicin**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Rifampicin-Model/blob/master/Rifampicin-Model.json
- **Risperidone**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Risperidone-Model/blob/main/risperidone-model.json
- **Verapamil**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Verapamil-Model/blob/master/Verapamil-Model.json

The following interaction scenarios were predicted and used to qualify the final DDGI network:

- Alprazolam as victim:
  - Paroxetine-alprazolam-DDI

- Atomoxetine as victim:
  - Bupropion-atomoxetine-DDGI
  - Fluvoxamine-atomoxetine-DDI
  - Paroxetine-atomoxetine-DDGI

- (E)-Clomiphene as victim:
  - Clarithromycin-clomiphene-DDGI
  - Paroxetine-clomiphene-DDGI

- Desipramine as victim:
  - Atomoxetine-desipramine-DDI
  - Bupropion-desipramine-DDI
  - Paroxetine-desipramine-DDGI
  - Quinidine-desipramine-DDI

- Dextromethorphan as victim:
  - Paroxetine-dextromethorphan-DDGI
  - Quinidine-dextromethorphan-DDI

- Digoxin as victim: 
  - Quinidine-digoxin-DDI

- Metoprolol as victim:
  - Cimetidine-metoprolol-DDI
  - Paroxetine-metoprolol-DDI
  - Quinidine-metoprolol-DDGI
  - Rifampicin-metoprolol-DDI

- Mexiletine as victim: 
  - Quinidine-mexiletine-DDGI

- Midazolam as victim: 
  - Atomoxetine-midazolam-DDI

- Paroxetine as victim:
  - Itraconazole-paroxetine-DDI
  - Quinidine-paroxetine-DDI

- Quinidine as victim: 
  - Carbamazepine-quinidine-DDI
  - Cimetidine-quinidine-DDI
  - Erythromycin-quinidine-DDI
  - Fluvoxamine-quinidine-DDI
  - Itraconazole-quinidine-DDI
  - Omeprazole-quinidine-DDI
  - Rifampicin-quinidine-DDI
  - Verapamil-quinidine-DDI

- Risperidone as victim:
  - Ketoconazole-risperidone-DDI
  - Rifampicin-risperidone-DDI
  - Verapamil-risperidone-DDI

The published DD(G)I studies between the respective perpetrators and victim drugs were simulated and compared to observed data. The following sections give an overview of the clinical studies being part of this qualification report.

### 2.1.1 Paroxetine - Alprazolam DDI<a id="paroxetine-alprazolam-ddi"></a>

The paroxetine-alprazolam interaction was evaluated using clinical DDI studies listed in [Table 1](#table-1).

| **Source**                    | **Route** | **Schedule** | **Pop.** | **Sex** | **N** | **Perpetrator**         |
| ----------------------------- | --------- | ------------ | -------- | ------- | ----- | ----------------------- |
| [Calvo 2004](#references)   | po        | 1 mg q.d.    | European | f       | 22    | +/- PAR, 20 mg q.d. po  |

**Table 1:**<a name="table-1"></a> f: female, N: number of study participants, PAR: paroxetine, po: oral, pop.: population used in simulations, q.d.: once daily. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.2 Fluvoxamine - Atomoxetine DDI<a id="fluvoxamine-atomoxetine-ddi"></a>

The fluvoxamine-atomoxetine interaction was evaluated using clinical DDI studies listed in [Table 3](#table-3).

| **Source**                    | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**              |
| ----------------------------- | --------- | ------------- | -------- | ------- | ----- | ---------------------------- |
| [Todor 2017](#references)   | po        | 25 mg s.d.    | European | m       | 18    | +/- FLV, 50/100 mg q.d. po   |

**Table 3:**<a name="table-3"></a> FLV: fluvoxamine, m: male, N: number of study participants, po: oral, pop.: population used in simulations, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.3 Atomoxetine - Desipramine DDI<a id="atomoxetine-desipramine-ddi"></a>

The atomoxetine-desipramine interaction was evaluated using clinical DDI studies listed in [Table 7](#table-7).

| **Source**                    | **Route** | **Schedule** | **Pop.** | **Sex** | **N** | **Perpetrator**          |
| ----------------------------- | --------- | ------------ | -------- | ------- | ----- | ------------------------ |
| [Sauer 2004](#references)   | po        | 50 mg s.d.   | American | m       | 22    | +/- ATO, 60 mg b.i.d. po |

**Table 7:**<a name="table-7"></a> ATO: atomoxetine, b.i.d.: twice daily, m: male, N: number of study participants, po: oral, pop.: population used in simulations, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.4 Quinidine - Desipramine DDI<a id="quinidine-desipramine-ddi"></a>

The quinidine-desipramine interaction was evaluated using clinical DDI studies listed in [Table 10](#table-10).

| **Source**                    | **Route** | **Schedule** | **Pop.** | **Sex** | **N** | **Perpetrator**           |
| ----------------------------- | --------- | ------------ | -------- | ------- | ----- | ----------------------- |
| [Brøsen 1989](#references)  | po        | 100 mg s.d.  | European | m       | 6     | +/- QUI, 200 mg q.d. po |

**Table 10:**<a name="table-10"></a> m: male, N: number of study participants, po: oral, pop.: population used in simulations, q.d.: once daily, QUI: quinidine, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.5 Quinidine - Dextromethorphan DDI<a id="quinidine-dextromethorphan-ddi"></a>

The quinidine-dextromethorphan interaction was evaluated using clinical DDI studies listed in [Table 12](#table-12).

| **Source**                    | **Route** | **Schedule** | **Pop.** | **Sex** | **N** | **Perpetrator**         |
| ----------------------------- | --------- | ------------ | -------- | ------- | ----- | ----------------------- |
| [Capon 1996](#references)   | po        | 30 mg s.d.   | European | m       | 6 NM  | +/- QUI, 50 mg s.d. po  |
| [Schadel 1995](#references) | po        | 30 mg s.d.   | American | f       | 5 NM  | +/- QUI, 100 mg s.d. po |

**Table 12:**<a name="table-12"></a> f: female, m: male, N: number of study participants, NM: CYP2D6 normal metabolizer, po: oral, pop.: population used in simulations, QUI: quinidine, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.6 Quinidine - Digoxin DDI<a id="quinidine-digoxin-ddi"></a>

The quinidine-digoxin interaction was evaluated using clinical DDI studies listed in [Table 13](#table-13).

| **Source**                    | **Route** | **Schedule** | **Pop.** | **Sex** | **N** | **Perpetrator**           |
| ----------------------------- | --------- | ------------ | -------- | ------- | ----- | ------------------------- |
| [Steiness 1980](#references)| iv        | 10 µg/kg s.d.| European | m       | 6     | +/- QUI, 200 mg b.i.d. po |
| [Ochs 1981](#references)    | iv        | 1 mg s.d.    | European | m       | 7     | +/- QUI, 200 mg q.i.d. po |

**Table 13:**<a name="table-13"></a> b.i.d.: twice daily, m: male, iv: intravenous, N: number of study participants, po: oral, pop.: population used in simulations, q.i.d.: four times daily, QUI: quinidine, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.7 Cimetidine - Metoprolol DDI<a id="cimetidine-metoprolol-ddi"></a>

The cimetidine-metoprolol interaction was evaluated using clinical DDI studies listed in [Table 14](#table-14).

| **Source**                           | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**               |
| ------------------------------------ | --------- | ------------- | -------- | ------- | ----- | ----------------------------- |
| [Chellingsworth 1988](#references) | po        | 100 mg s.d.   | European | m       | 12    | +/- CIM, 800 mg q.d. po       |
| [Chellingsworth 1988](#references) | po        | 100 mg b.i.d. | European | m       | 12    | +/- CIM, 800 mg q.d. po       |
| [Toon 1988](#references)           | po        | 100 mg b.i.d. | European | m       | 12    | +/- CIM, 800 mg q.d. po       |
| [Kirch 1982](#references)          | po        | 100 mg b.i.d. | European | m       | 6     | +/- CIM, 200/400 mg q.i.d. po |

**Table 14:**<a name="table-14"></a> b.i.d.: twice daily, CIM: cimetidine, m: male, N: number of study participants, po: oral, pop.: population used in simulations, q.d.: once daily, q.i.d.: four times daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.8 Paroxetine - Metoprolol DDI<a id="paroxetine-metoprolol-ddi"></a>

The paroxetine-metoprolol interaction was evaluated using clinical DDI studies listed in [Table 15](#table-15).

| **Source**                     | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**          |
| ------------------------------ | --------- | ------------- | -------- | ------- | ----- | ------------------------ |
| [Stout 2011](#references)    | po        | 50 mg s.d.    | American | m       | 10    | +/- PAR, 10 mg b.i.d. po |
| [Stout 2011](#references)    | po        | 100 mg s.d.   | American | m       | 10    | +/- PAR, 10 mg b.i.d. po |
| [Parker 2011](#references)   | po        | 100 mg s.d.   | American | m       | 12    | +/- PAR, 20 mg q.d. po   |
| [Parker 2011](#references)   | po        | 100 mg b.i.d. | American | m       | 12    | +/- PAR, 20 mg q.d. po   |
| [Parker 2011](#references)   | po        | 200 mg s.d.   | American | m       | 12    | +/- PAR, 20 mg q.d. po   |
| [Hemeryck 2000](#references) | po        | 100 mg s.d.   | European | m       | 8     | +/- PAR, 10 mg b.i.d. po |

**Table 15:**<a name="table-15"></a> b.i.d.: twice daily, m: male, N: number of study participants, PAR: paroxetine, po: oral, pop.: population used in simulations, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.9 Rifampicin - Metoprolol DDI<a id="rifampicin-metoprolol-ddi"></a>

The rifampicin-metoprolol interaction was evaluated using clinical DDI studies listed in [Table 17](#table-17).

| **Source**                     | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**           |
| ------------------------------ | --------- | ------------- | -------- | ------- | ----- | ------------------------- |
| [Bennett 1982](#references)  | po        | 100 mg s.d.   | European | m       | 12    | +/- RIF, 600 mg q.d. po   |

**Table 17:**<a name="table-17"></a> m: male, N: number of study participants, po: oral, pop.: population used in simulations, q.d.: once daily, RIF: rifampicin, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.10 Atomoxetine - Midazolam DDI<a id="atomoxetine-midazolam-ddi"></a>

The atomoxetine-midazolam interaction was evaluated using clinical DDI studies listed in [Table 19](#table-19).

| **Source**                     | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**           |
| ------------------------------ | --------- | ------------- | -------- | ------- | ----- | ------------------------- |
| [Sauer 2004](#references)  | po        | 5 mg s.d.     | American | f       | 8     | +/- ATO, 60 mg b.i.d. po  |

**Table 19:**<a name="table-19"></a> ATO: atomoxetine, b.i.d.: twice daily, f: female, N: number of study participants, po: oral, pop.: population used in simulations, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.11 Itraconazole - Paroxetine DDI<a id="itraconazole-paroxetine-ddi"></a>

The itraconazole-paroxetine interaction was evaluated using clinical DDI studies listed in [Table 20](#table-20).

| **Source**                            | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**           |
| ------------------------------------- | --------- | ------------- | -------- | ------- | ----- | ------------------------- |
| [Yasui-Furukori 2007](#references)  | po        | 20 mg s.d.    | Japanese | f       | 13    | +/- ITR, 100 mg b.i.d. po |

**Table 20:**<a name="table-20"></a> b.i.d.: twice daily, f: female, ITR: itraconazole, N: number of study participants, po: oral, pop.: population used in simulations, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.12 Quinidine - Paroxetine DDI<a id="quinidine-paroxetine-ddi"></a>

The quinidine-paroxetine interaction was evaluated using clinical DDI studies listed in [Table 21](#table-21).

| **Source**                    | **Route** | **Schedule** | **Pop.** | **Sex** | **N** | **Perpetrator**          |
| ----------------------------- | --------- | ------------ | -------- | ------- | ----- | ------------------------ |
| [Schoedel 2012](#references)| po        | 20 mg q.d.   | American | m       | 14 NM | +/- QUI, 30 mg b.i.d. po |

**Table 21:**<a name="table-21"></a> m: male, N: number of study participants, NM: CYP2D6 normal metabolizer, po: oral, pop.: population used in simulations, q.d.: once daily, QUI: quinidine. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.13 Carbamazepine - Quinidine DDI<a id="carbamazepine-quinidine-ddi"></a>

The carbamazepine-quinidine interaction was evaluated using clinical DDI studies listed in [Table 22](#table-22).

| **Source**                     | **Route** | **Schedule** | **Pop.** | **Sex** | **N** | **Perpetrator**              |
| ------------------------------ | --------- | ------------ | -------- | ------- | ----- | ---------------------------- |
| [Andreasen 2007](#references)| po        | 200 mg s.d.  | European | m       | 10    | +/- CBZ, 200/400 mg b.i.d. po|

**Table 22:**<a name="table-22"></a> b.i.d.: twice daily, CBZ: carbamazepine, m: male, N: number of study participants, po: oral, pop.: population used in simulations, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.14 Cimetidine - Quinidine DDI<a id="cimetidine-quinidine-ddi"></a>

The cimetidine-quinidine interaction was evaluated using clinical DDI studies listed in [Table 23](#table-23).

| **Source**                    | **Route** | **Schedule** | **Pop.** | **Sex** | **N** | **Perpetrator**           |
| ----------------------------- | --------- | ------------ | -------- | ------- | ----- | ------------------------- |
| [Kolb 1984](#references)    | po        | 400 mg s.d.  | American | m       | 9     | +/- CIM, 300 mg q.d. po   |
| [Hardy 1988](#references)   | po        | 400 mg s.d.  | American | m       | 9     | +/- CIM, 300 mg q.i.d. po |

**Table 23:**<a name="table-23"></a> CIM: cimetidine, m: male, N: number of study participants, po: oral, pop.: population used in simulations, q.d.: once daily, q.i.d.: four times daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.15 Erythromycin - Quinidine DDI<a id="erythromycin-quinidine-ddi"></a>

The erythromycin-quinidine interaction was evaluated using clinical DDI studies listed in [Table 24](#table-24).

| **Source**                            | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**           |
| ------------------------------------- | --------- | ------------- | -------- | ------- | ----- | ------------------------- |
| [Damkier 1999b](#references)  | po        | 200 mg s.d.    | European | m       | 6     | +/- ERY, 250 mg q.i.d. po |

**Table 24:**<a name="table-24"></a> ERY: erythromycin, m: male, N: number of study participants, po: oral, pop.: population used in simulations, q.i.d.: four times daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.16 Fluvoxamine - Quinidine DDI<a id="fluvoxamine-quinidine-ddi"></a>

The fluvoxamine-quinidine interaction was evaluated using clinical DDI studies listed in [Table 25](#table-25).

| **Source**                    | **Route** | **Schedule** | **Pop.** | **Sex** | **N** | **Perpetrator**         |
| ----------------------------- | --------- | ------------ | -------- | ------- | ----- | ----------------------- |
| [Damkier 1999a](#references)| po        | 200 mg s.d.  | American | m       | 6     | +/- FLV, 100 mg q.d. po |

**Table 25:**<a name="table-25"></a> FLV: fluvoxamine, m: male, N: number of study participants, po: oral, pop.: population used in simulations, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.17 Itraconazole - Quinidine DDI<a id="itraconazole-quinidine-ddi"></a>

The itraconazole-quinidine interaction was evaluated using clinical DDI studies listed in [Table 26](#table-26).

| **Source**                      | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**           |
| ------------------------------- | --------- | ------------- | -------- | ------- | ----- | ------------------------- |
| [Kaukonen 1997](#references)  | po        | 100 mg s.d.   | European | f       | 9     | +/- ITR, 200 mg q.d. po   |
| [Damkier 1999b](#references)  | po        | 200 mg s.d.   | European | m       | 6     | +/- ITR, 100 mg q.d. po   |

**Table 26:**<a name="table-26"></a> f: female, ITR: itraconazole, m: male, N: number of study participants, po: oral, pop.: population used in simulations, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.18 Omeprazole - Quinidine DDI<a id="omeprazole-quinidine-ddi"></a>

The omeprazole-quinidine interaction was evaluated using clinical DDI studies listed in [Table 27](#table-27).

| **Source**                    | **Route** | **Schedule** | **Pop.** | **Sex** | **N** | **Perpetrator**         |
| ----------------------------- | --------- | ------------ | -------- | ------- | ----- | ----------------------- |
| [Ching 1991](#references)   | po        | 400 mg s.d.  | European | m       | 8     | +/- OME, 40 mg q.d. po  |

**Table 27:**<a name="table-27"></a> m: male, N: number of study participants, OME: omeprazole, po: oral, pop.: population used in simulations, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.19 Rifampicin - Quinidine DDI<a id="rifampicin-quinidine-ddi"></a>

The rifampicin-quinidine interaction was evaluated using clinical DDI studies listed in [Table 28](#table-28).

| **Source**                    | **Route** | **Schedule** | **Pop.** | **Sex** | **N** | **Perpetrator**         |
| ----------------------------- | --------- | ------------ | -------- | ------- | ----- | ----------------------- |
| [Damkier 1999](#references) | po        | 200 mg s.d.  | European | m       | 6     | +/- RIF, 600 mg q.d. po |

**Table 28:**<a name="table-28"></a> m: male, N: number of study participants, po: oral, pop.: population used in simulations, q.d.: once daily, RIF: rifampicin, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.20 Verapamil - Quinidine DDI<a id="verapamil-quinidine-ddi"></a>

The verapamil-quinidine interaction was evaluated using clinical DDI studies listed in [Table 29](#table-29).

| **Source**                    | **Route** | **Schedule** | **Pop.** | **Sex** | **N** | **Perpetrator**          |
| ----------------------------- | --------- | ------------ | -------- | ------- | ----- | ------------------------ |
| [Edwards 1987](#references) | po        | 400 mg s.d.  | European | m       | 6     | +/- VER, 80 mg t.i.d. po |
| [Edwards 1987](#references) | po        | 400 mg s.d.  | European | m       | 6     | +/- VER, 120 mg t.i.d. po|

**Table 29:**<a name="table-29"></a> m: male, N: number of study participants, po: oral, pop.: population used in simulations, s.d.: single dose, t.i.d.: three times daily, VER: verapamil. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.21 Ketoconazole - Risperidone DDI<a id="ketoconazole-risperidone-ddi"></a>

The ketoconazole-risperidone interaction was evaluated using clinical DDI studies listed in [Table 30](#table-30).

| **Source**                      | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**           |
| ------------------------------- | --------- | ------------- | -------- | ------- | ----- | ------------------------- |
| [Mahatthanatrakul 2012](#references)  | po        | 2 mg s.d.   | Asian | m       | 10     | +/- KET, 200 mg q.d. po   |

**Table 30:**<a name="table-30"></a> KET: ketoconazole, m: male, N: number of study participants, po: oral, pop.: population used in simulations, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.22 Rifampicin - Risperidone DDI<a id="rifampicin-risperidone-ddi"></a>

The rifampicin-risperidone interaction was evaluated using clinical DDI studies listed in [Table 31](#table-31).

| **Source**                            | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**           |
| ------------------------------------- | --------- | ------------- | -------- | ------- | ----- | ------------------------- |
| [Kim 2008](#references)             | po        | 1 mg s.d.     | Asian    | m       | 10    | +/- RIF, 600 mg q.d. po   |
| [Mahatthanatrakul 2007](#references)| po        | 4 mg s.d.     | Asian    | m       | 10    | +/- RIF, 600 mg q.d. po   |

**Table 31:**<a name="table-31"></a> m: male, N: number of study participants, po: oral, pop.: population used in simulations, q.d.: once daily, RIF: rifampicin, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.23 Verapamil - Risperidone DDI<a id="verapamil-risperidone-ddi"></a>

The verapamil-risperidone interaction was evaluated using clinical DDI studies listed in [Table 32](#table-32).

| **Source**                     | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**           |
| ------------------------------ | --------- | ------------- | -------- | ------- | ----- | ------------------------- |
| [Nakagami 2005](#references) | po        | 1 mg s.d.     | Japanese | m       | 12    | +/- VER, 80 mg t.i.d. po  |

**Table 32:**<a name="table-32"></a> m: male, N: number of study participants, po: oral, pop.: population used in simulations, s.d.: single dose, t.i.d.: three times daily, VER: verapamil. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

## 2.2 DDI Concentration-Time Profiles<a id="ddi-concentration-time-profiles"></a>

The following section shows concentration-time profiles of the victim drugs of the simulated DD(G)I studies in comparison to observed data.

### 2.2.1 Paroxetine - Alprazolam DDI<a id="paroxetine-alprazolam-ddi-timeprofile"></a>

<a id="figure-2-6"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/029_section_paroxetine-alprazolam-ddi-timeprofile/comparison_time_profile_Paroxetine___Alprazolam_DDI_15.png)

**Figure 2-6: Paroxetine - Alprazolam DDI**

<br>
<br>

### 2.2.2 Fluvoxamine - Atomoxetine DDI<a id="fluvoxamine-atomoxetine-ddi-timeprofile"></a>

<a id="figure-2-7"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/030_section_fluvoxamine-atomoxetine-ddi-timeprofile/comparison_time_profile_Fluvoxamine___Atomoxetine_DDI_16.png)

**Figure 2-7: Fluvoxamine - Atomoxetine DDI**

<br>
<br>

### 2.2.3 Atomoxetine - Desipramine DDI<a id="atomoxetine-desipramine-ddi-timeprofile"></a>

<a id="figure-2-8"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/031_section_atomoxetine-desipramine-ddi-timeprofile/comparison_time_profile_Atomoxetine___Desipramine_DDI_62.png)

**Figure 2-8: Atomoxetine - Desipramine DDI**

<br>
<br>

### 2.2.4 Quinidine - Desipramine DDI<a id="quinidine-desipramine-ddi-timeprofile"></a>

<a id="figure-2-9"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/032_section_quinidine-desipramine-ddi-timeprofile/comparison_time_profile_Quinidine___Desipramine_DDI_68.png)

**Figure 2-9: Quinidine - Desipramine DDI**

<br>
<br>

### 2.2.5 Quinidine - Dextromethorphan DDI<a id="quinidine-dextromethorphan-ddi-timeprofile"></a>

<a id="figure-2-10"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/033_section_quinidine-dextromethorphan-ddi-timeprofile/comparison_time_profile_Quinidine___Dextromethorphan_DDI_1.png)

**Figure 2-10: Quinidine - Dextromethorphan DDI**

<br>
<br>

### 2.2.6 Quinidine - Digoxin DDI<a id="quinidine-digoxin-ddi-timeprofile"></a>

<a id="figure-2-11"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/034_section_quinidine-digoxin-ddi-timeprofile/comparison_time_profile_Quinidine___Digoxin_DDI_2.png)

**Figure 2-11: Quinidine - Digoxin DDI**

<br>
<br>

<a id="figure-2-12"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/034_section_quinidine-digoxin-ddi-timeprofile/comparison_time_profile_Quinidine___Digoxin_DDI_3.png)

**Figure 2-12: Quinidine - Digoxin DDI**

<br>
<br>

### 2.2.7 Cimetidine - Metoprolol DDI<a id="cimetidine-metoprolol-ddi-timeprofile"></a>

<a id="figure-2-13"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/035_section_cimetidine-metoprolol-ddi-timeprofile/comparison_time_profile_Cimetidine___Metoprolol_DDI_72.png)

**Figure 2-13: Cimetidine - Metoprolol DDI**

<br>
<br>

<a id="figure-2-14"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/035_section_cimetidine-metoprolol-ddi-timeprofile/comparison_time_profile_Cimetidine___Metoprolol_DDI_73.png)

**Figure 2-14: Cimetidine - Metoprolol DDI**

<br>
<br>

<a id="figure-2-15"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/035_section_cimetidine-metoprolol-ddi-timeprofile/comparison_time_profile_Cimetidine___Metoprolol_DDI_74.png)

**Figure 2-15: Cimetidine - Metoprolol DDI**

<br>
<br>

<a id="figure-2-16"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/035_section_cimetidine-metoprolol-ddi-timeprofile/comparison_time_profile_Cimetidine___Metoprolol_DDI_75.png)

**Figure 2-16: Cimetidine - Metoprolol DDI**

<br>
<br>

### 2.2.8 Paroxetine - Metoprolol DDI<a id="paroxetine-metoprolol-ddi-timeprofile"></a>

<a id="figure-2-17"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/036_section_paroxetine-metoprolol-ddi-timeprofile/comparison_time_profile_Paroxetine___Metoprolol_DDI_76.png)

**Figure 2-17: Paroxetine - Metoprolol DDI**

<br>
<br>

<a id="figure-2-18"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/036_section_paroxetine-metoprolol-ddi-timeprofile/comparison_time_profile_Paroxetine___Metoprolol_DDI_77.png)

**Figure 2-18: Paroxetine - Metoprolol DDI**

<br>
<br>

<a id="figure-2-19"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/036_section_paroxetine-metoprolol-ddi-timeprofile/comparison_time_profile_Paroxetine___Metoprolol_DDI_78.png)

**Figure 2-19: Paroxetine - Metoprolol DDI**

<br>
<br>

<a id="figure-2-20"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/036_section_paroxetine-metoprolol-ddi-timeprofile/comparison_time_profile_Paroxetine___Metoprolol_DDI_79.png)

**Figure 2-20: Paroxetine - Metoprolol DDI**

<br>
<br>

<a id="figure-2-21"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/036_section_paroxetine-metoprolol-ddi-timeprofile/comparison_time_profile_Paroxetine___Metoprolol_DDI_80.png)

**Figure 2-21: Paroxetine - Metoprolol DDI**

<br>
<br>

<a id="figure-2-22"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/036_section_paroxetine-metoprolol-ddi-timeprofile/comparison_time_profile_Paroxetine___Metoprolol_DDI_81.png)

**Figure 2-22: Paroxetine - Metoprolol DDI**

<br>
<br>

### 2.2.9 Rifampicin - Metoprolol DDI<a id="rifampicin-metoprolol-ddi-timeprofile"></a>

<a id="figure-2-23"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/037_section_rifampicin-metoprolol-ddi-timeprofile/comparison_time_profile_Rifampicin___Metoprolol_DDI_88.png)

**Figure 2-23: Rifampicin - Metoprolol DDI**

<br>
<br>

### 2.2.10 Atomoxetine - Midazolam DDI<a id="atomoxetine-midazolam-ddi-timeprofile"></a>

<a id="figure-2-24"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/038_section_atomoxetine-midazolam-ddi-timeprofile/comparison_time_profile_Atomoxetine___Midazolam_DDI_89.png)

**Figure 2-24: Atomoxetine - Midazolam DDI**

<br>
<br>

<a id="figure-2-25"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/038_section_atomoxetine-midazolam-ddi-timeprofile/comparison_time_profile_Atomoxetine___Midazolam_DDI_90.png)

**Figure 2-25: Atomoxetine - Midazolam DDI**

<br>
<br>

### 2.2.11 Itraconazole - Paroxetine DDI<a id="itraconazole-paroxetine-ddi-timeprofile"></a>

<a id="figure-2-26"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/039_section_itraconazole-paroxetine-ddi-timeprofile/comparison_time_profile_Itraconazole___Paroxetine_DDI_91.png)

**Figure 2-26: Itraconazole - Paroxetine DDI**

<br>
<br>

### 2.2.12 Quinidine - Paroxetine DDI<a id="quinidine-paroxetine-ddi-timeprofile"></a>

<a id="figure-2-27"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/040_section_quinidine-paroxetine-ddi-timeprofile/comparison_time_profile_Quinidine___Paroxetine_DDI_6.png)

**Figure 2-27: Quinidine - Paroxetine DDI**

<br>
<br>

### 2.2.13 Carbamazepine - Quinidine DDI<a id="carbamazepine-quinidine-ddi-timeprofile"></a>

<a id="figure-2-28"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/041_section_carbamazepine-quinidine-ddi-timeprofile/comparison_time_profile_Carbamazepine___Quinidine_DDI_7.png)

**Figure 2-28: Carbamazepine - Quinidine DDI**

<br>
<br>

### 2.2.14 Cimetidine - Quinidine DDI<a id="cimetidine-quinidine-ddi-timeprofile"></a>

<a id="figure-2-29"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/042_section_cimetidine-quinidine-ddi-timeprofile/comparison_time_profile_Cimetidine___Quinidine_DDI_8.png)

**Figure 2-29: Cimetidine - Quinidine DDI**

<br>
<br>

<a id="figure-2-30"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/042_section_cimetidine-quinidine-ddi-timeprofile/comparison_time_profile_Cimetidine___Quinidine_DDI_9.png)

**Figure 2-30: Cimetidine - Quinidine DDI**

<br>
<br>

### 2.2.15 Erythromycin - Quinidine DDI<a id="erythromycin-quinidine-ddi-timeprofile"></a>

<a id="figure-2-31"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/043_section_erythromycin-quinidine-ddi-timeprofile/comparison_time_profile_Erythromycin___Quinidine_DDI_92.png)

**Figure 2-31: Erythromycin - Quinidine DDI**

<br>
<br>

### 2.2.16 Fluvoxamine - Quinidine DDI<a id="fluvoxamine-quinidine-ddi-timeprofile"></a>

<a id="figure-2-32"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/044_section_fluvoxamine-quinidine-ddi-timeprofile/comparison_time_profile_Fluvoxamine___Quinidine_DDI_10.png)

**Figure 2-32: Fluvoxamine - Quinidine DDI**

<br>
<br>

### 2.2.17 Itraconazole - Quinidine DDI<a id="itraconazole-quinidine-ddi-timeprofile"></a>

<a id="figure-2-33"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/045_section_itraconazole-quinidine-ddi-timeprofile/comparison_time_profile_Itraconazole___Quinidine_DDI_93.png)

**Figure 2-33: Itraconazole - Quinidine DDI**

<br>
<br>

<a id="figure-2-34"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/045_section_itraconazole-quinidine-ddi-timeprofile/comparison_time_profile_Itraconazole___Quinidine_DDI_94.png)

**Figure 2-34: Itraconazole - Quinidine DDI**

<br>
<br>

### 2.2.18 Omeprazole - Quinidine DDI<a id="omeprazole-quinidine-ddi-timeprofile"></a>

<a id="figure-2-35"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/046_section_omeprazole-quinidine-ddi-timeprofile/comparison_time_profile_Omeprazole___Quinidine_DDI_11.png)

**Figure 2-35: Omeprazole - Quinidine DDI**

<br>
<br>

### 2.2.19 Rifampicin - Quinidine DDI<a id="rifampicin-quinidine-ddi-timeprofile"></a>

<a id="figure-2-36"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/047_section_rifampicin-quinidine-ddi-timeprofile/comparison_time_profile_Rifampicin___Quinidine_DDI_12.png)

**Figure 2-36: Rifampicin - Quinidine DDI**

<br>
<br>

### 2.2.20 Verapamil - Quinidine DDI<a id="verapamil-quinidine-ddi-timeprofile"></a>

<a id="figure-2-37"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/048_section_verapamil-quinidine-ddi-timeprofile/comparison_time_profile_Verapamil___Quinidine_DDI_13.png)

**Figure 2-37: Verapamil - Quinidine DDI**

<br>
<br>

<a id="figure-2-38"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/048_section_verapamil-quinidine-ddi-timeprofile/comparison_time_profile_Verapamil___Quinidine_DDI_14.png)

**Figure 2-38: Verapamil - Quinidine DDI**

<br>
<br>

### 2.2.21 Ketoconazole - Risperidone DDI<a id="ketoconazole-risperidone-ddi-timeprofile"></a>

<a id="figure-2-39"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/049_section_ketoconazole-risperidone-ddi-timeprofile/comparison_time_profile_Ketoconazole___Risperidone_DDI_95.png)

**Figure 2-39: Ketoconazole - Risperidone DDI**

<br>
<br>

### 2.2.22 Rifampicin - Risperidone DDI<a id="rifampicin-risperidone-ddi-timeprofile"></a>

<a id="figure-2-40"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/050_section_rifampicin-risperidone-ddi-timeprofile/comparison_time_profile_Rifampicin___Risperidone_DDI_96.png)

**Figure 2-40: Rifampicin - Risperidone DDI**

<br>
<br>

<a id="figure-2-41"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/050_section_rifampicin-risperidone-ddi-timeprofile/comparison_time_profile_Rifampicin___Risperidone_DDI_97.png)

**Figure 2-41: Rifampicin - Risperidone DDI**

<br>
<br>

### 2.2.23 Verapamil - Risperidone DDI<a id="verapamil-risperidone-ddi-timeprofile"></a>

<a id="figure-2-42"></a>

![](images/003_section_ddi-evaluations/028_section_ddi-concentration-time-profiles/051_section_verapamil-risperidone-ddi-timeprofile/comparison_time_profile_Verapamil___Risperidone_DDI_98.png)

**Figure 2-42: Verapamil - Risperidone DDI**

<br>
<br>

# 3 DGI Evaluations<a id="dgi-evaluations"></a>

The following section evaluates drug-gene interaction (DGI) simulations without a perpetrator drug. These simulations isolate CYP2D6 activity-score effects on victim-drug and metabolite exposure and are interpreted separately from DDGI scenarios.

For the CYP2D6 DGI qualification, activity-score-stratified clinical concentration-time profiles were extracted from the local parent model repositories and their underlying publications or supplements where available. The DGI plots are therefore evaluated as parent-model evidence, not as interaction ratios.

## 3.1 DGI Parent-Model Evaluations<a id="dgi-parent-model-evaluations"></a>

### 3.1.1 Clomiphene DGI<a id="clomiphene-dgi"></a>

The Clomiphene DGI evaluation uses the local `Clomiphene-Model` parent repository as source. The parent repository documents a CYP2D6 activity-score panel after oral single-dose clomiphene citrate administration in healthy adult premenopausal women and links the dataset to Kovar et al. 2022 and the supporting CYP2D6 clomiphene metabolism publication by Murdter et al. 2012.

The DGI simulations compare plasma concentration-time profiles for (E)-clomiphene, (E)-4-hydroxyclomiphene, (E)-N-desethylclomiphene and (E)-4-hydroxy-N-desethylclomiphene across CYP2D6 activity-score groups. No perpetrator drug is present in these simulations.

| CYP2D6 activity score | Study size | Dose |
| --- | ---: | --- |
| 0 | 6 | 42 mg clomiphene citrate, po, single dose |
| 0.5 | 4 | 42 mg clomiphene citrate, po, single dose |
| 0.75 | 1 | 42 mg clomiphene citrate, po, single dose |
| 1 | 2 | 42 mg clomiphene citrate, po, single dose |
| 2 | 3 | 42 mg clomiphene citrate, po, single dose |
| 3 | 3 | 42 mg clomiphene citrate, po, single dose |

The scientific check for this section is activity-score ordering and metabolite pattern consistency, not DDI ratio agreement. Parent and metabolite profiles are kept separate because CYP2D6 activity changes parent depletion and metabolite formation in different directions.

### 3.1.2 Atomoxetine DGI<a id="atomoxetine-dgi"></a>

The Atomoxetine DGI evaluation uses the local `Atomoxetine-Model` parent repository as source. The parent repository documents CYP2D6 activity-score-dependent atomoxetine clearance and links the activity-score framework to Ruedesheim et al. 2022.

Two activity-score datasets are included as separate DGI plot groups to avoid cross-study pooling:

| Study | CYP2D6 activity-score groups | Endpoint |
| --- | --- | --- |
| Byeon 2015 | AS 0.5, 1.25 and 2 | Atomoxetine plasma concentration |
| Kim 2018 | AS 0.5 and 2 | Atomoxetine plasma concentration |

The scientific check for these plots is whether exposure decreases with increasing CYP2D6 activity within each study. Dose-normalized Byeon profiles and Kim profiles are not interpreted as a single pooled AS trend.

### 3.1.3 Risperidone DGI<a id="risperidone-dgi"></a>

The Risperidone DGI evaluation uses the local `Risperidone-Model` parent repository as source. The parent repository documents CYP2D6 activity-score-dependent metabolism of risperidone to 9-hydroxyrisperidone and links the model extension to Ruedesheim et al. 2022.

The Novalbos 2010 CYP2D6 activity-score dataset is used for the DGI concentration-time profile evaluation:

| CYP2D6 activity score | Study size | Dose | Endpoints |
| --- | ---: | --- | --- |
| 0 | 6 | 1 mg risperidone, po | risperidone and 9-hydroxyrisperidone |
| 1 | 26 | 1 mg risperidone, po | risperidone and 9-hydroxyrisperidone |
| 2 | 33 | 1 mg risperidone, po | risperidone and 9-hydroxyrisperidone |
| 3 | 6 | 1 mg risperidone, po | risperidone and 9-hydroxyrisperidone |

The scientific check for these plots is parent-metabolite consistency across activity-score groups. Higher CYP2D6 activity should reduce parent exposure and increase formation-dependent metabolite behavior, while active-moiety interpretation must remain separate from parent-only interpretation.

## 3.2 DGI Ratio Plots<a id="dgi-ratio-plots"></a>

The following plots compare predicted and observed CYP2D6 activity-score exposure ratios for DGI scenarios without a perpetrator drug.

Ratios are only included where a matching observed ratio record and matching parent-model DGI simulations are available. The current DGI ratio section includes clomiphene, atomoxetine, and risperidone activity-score comparisons with AS 2 as the within-study reference group.

<a id="figure-3-1"></a>

![](images/052_section_dgi-evaluations/057_section_dgi-ratio-plots/DDIRatio_3_ddi_ratio_plot_AUC_predictedVsObserved.png)

**Figure 3-1: CYP2D6 DGIs.  Predicted vs. Observed AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-3-2"></a>

![](images/052_section_dgi-evaluations/057_section_dgi-ratio-plots/DDIRatio_3_ddi_ratio_plot_AUC_residualsVsObserved.png)

**Figure 3-2: CYP2D6 DGIs.  Predicted/Observed vs. Observed AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-3-3"></a>

![](images/052_section_dgi-evaluations/057_section_dgi-ratio-plots/DDIRatio_3_ddi_ratio_plot_CMAX_predictedVsObserved.png)

**Figure 3-3: CYP2D6 DGIs.  Predicted vs. Observed CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-3-4"></a>

![](images/052_section_dgi-evaluations/057_section_dgi-ratio-plots/DDIRatio_3_ddi_ratio_plot_CMAX_residualsVsObserved.png)

**Figure 3-4: CYP2D6 DGIs.  Predicted/Observed vs. Observed CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="table-3-1"></a>

**Table 3-1: GMFE for CYP2D6 DGIs Ratio**

|PK parameter |GMFE |
|:------------|:----|
|AUC          |1.48 |
|CMAX         |1.36 |

<br>
<br>

<a id="table-3-2"></a>

**Table 3-2: Summary table for CYP2D6 DGIs - AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

|AUC                          |Number |Ratio [%] |
|:----------------------------|:------|:---------|
|Points total                 |85     |-        |
|Points within Guest *et al.* |56     |65.88     |
|Points within 2 fold         |74     |87.06     |

<br>
<br>

<a id="table-3-3"></a>

**Table 3-3: Summary table for CYP2D6 DGIs - CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

|CMAX                         |Number |Ratio [%] |
|:----------------------------|:------|:---------|
|Points total                 |85     |-        |
|Points within Guest *et al.* |56     |65.88     |
|Points within 2 fold         |79     |92.94     |

<br>
<br>

<a id="table-3-4"></a>

**Table 3-4: Summary table for CYP2D6 DGIs**

|DataID |Perpetrator        |Victim                                 |Predicted AUC Ratio |Observed AUC Ratio |Pred/Obs AUC Ratio |Predicted CMAX Ratio |Observed CMAX Ratio |Pred/Obs CMAX Ratio |Reference      |
|:------|:------------------|:--------------------------------------|:-------------------|:------------------|:------------------|:--------------------|:-------------------|:-------------------|:--------------|
|900001 |-, 42 mg, -, -  |(E)-clomiphene, PO                     |6.81                |10.23              |0.67               |2.21                 |4.12                |0.54                |Kovar 2022     |
|900002 |-, 42 mg, -, -  |(E)-clomiphene, PO                     |3.27                |4.25               |0.77               |1.71                 |2.49                |0.69                |Kovar 2022     |
|900003 |-, 42 mg, -, -  |(E)-clomiphene, PO                     |2.81                |1.25               |2.26               |1.58                 |0.92                |1.72                |Kovar 2022     |
|900004 |-, 42 mg, -, -  |(E)-clomiphene, PO                     |1.64                |1.11               |1.48               |1.22                 |0.79                |1.55                |Kovar 2022     |
|900005 |-, 42 mg, -, -  |(E)-clomiphene, PO                     |0.75                |0.80               |0.94               |0.88                 |0.71                |1.23                |Kovar 2022     |
|900006 |-, 42 mg, -, -  |(E)-4-hydroxyclomiphene, PO            |0.43                |0.40               |1.07               |0.08                 |0.08                |1.00                |Kovar 2022     |
|900007 |-, 42 mg, -, -  |(E)-4-hydroxyclomiphene, PO            |1.38                |2.29               |0.60               |0.45                 |0.92                |0.48                |Kovar 2022     |
|900008 |-, 42 mg, -, -  |(E)-4-hydroxyclomiphene, PO            |1.46                |1.10               |1.33               |0.47                 |0.85                |0.55                |Kovar 2022     |
|900009 |-, 42 mg, -, -  |(E)-4-hydroxyclomiphene, PO            |1.29                |1.00               |1.29               |0.61                 |0.59                |1.03                |Kovar 2022     |
|900010 |-, 42 mg, -, -  |(E)-4-hydroxyclomiphene, PO            |0.87                |0.42               |2.06               |1.01                 |0.59                |1.72                |Kovar 2022     |
|900011 |-, 42 mg, -, -  |(E)-N-desethylclomiphene, PO           |30.84               |25.84              |1.19               |7.23                 |6.07                |1.19                |Kovar 2022     |
|900012 |-, 42 mg, -, -  |(E)-N-desethylclomiphene, PO           |9.47                |6.44               |1.47               |3.64                 |3.30                |1.10                |Kovar 2022     |
|900013 |-, 42 mg, -, -  |(E)-N-desethylclomiphene, PO           |7.56                |1.50               |5.03               |3.08                 |1.42                |2.17                |Kovar 2022     |
|900014 |-, 42 mg, -, -  |(E)-N-desethylclomiphene, PO           |2.79                |1.17               |2.39               |1.68                 |0.57                |2.92                |Kovar 2022     |
|900015 |-, 42 mg, -, -  |(E)-N-desethylclomiphene, PO           |0.62                |0.40               |1.56               |0.74                 |0.43                |1.74                |Kovar 2022     |
|900016 |-, 42 mg, -, -  |(E)-4-hydroxy-N-desethylclomiphene, PO |0.33                |0.29               |1.16               |0.06                 |0.06                |1.04                |Kovar 2022     |
|900017 |-, 42 mg, -, -  |(E)-4-hydroxy-N-desethylclomiphene, PO |3.29                |2.75               |1.20               |1.07                 |1.02                |1.05                |Kovar 2022     |
|900018 |-, 42 mg, -, -  |(E)-4-hydroxy-N-desethylclomiphene, PO |3.00                |1.16               |2.58               |1.01                 |1.07                |0.94                |Kovar 2022     |
|900019 |-, 42 mg, -, -  |(E)-4-hydroxy-N-desethylclomiphene, PO |1.88                |0.84               |2.24               |0.98                 |0.66                |1.48                |Kovar 2022     |
|900020 |-, 42 mg, -, -  |(E)-4-hydroxy-N-desethylclomiphene, PO |0.65                |0.37               |1.75               |0.77                 |0.56                |1.37                |Kovar 2022     |
|900021 |-, 40 mg, -, -  |Atomoxetine, PO                        |3.16                |2.64               |1.20               |1.67                 |1.74                |0.95                |Byeon 2015     |
|900022 |-, 40 mg, -, -  |Atomoxetine, PO                        |1.73                |1.36               |1.27               |1.33                 |1.15                |1.16                |Byeon 2015     |
|900023 |-, 20 mg, -, -  |Atomoxetine, PO                        |3.26                |2.77               |1.18               |1.69                 |1.61                |1.05                |Kim 2018       |
|900024 |-, 1 mg, -, -   |Risperidone, PO                        |7.67                |5.67               |1.35               |2.18                 |1.81                |1.20                |Novalbos 2010  |
|900025 |-, 1 mg, -, -   |Risperidone, PO                        |2.35                |2.66               |0.88               |1.60                 |1.44                |1.12                |Novalbos 2010  |
|900026 |-, 1 mg, -, -   |Risperidone, PO                        |0.50                |0.69               |0.73               |0.57                 |0.68                |0.84                |Novalbos 2010  |
|900027 |-, 1 mg, -, -   |9-Hydroxyrisperidone, PO               |0.32                |0.26               |1.23               |0.17                 |0.15                |1.10                |Novalbos 2010  |
|900028 |-, 1 mg, -, -   |9-Hydroxyrisperidone, PO               |0.91                |0.91               |1.00               |0.73                 |0.78                |0.94                |Novalbos 2010  |
|900029 |-, 1 mg, -, -   |9-Hydroxyrisperidone, PO               |0.95                |1.01               |0.94               |1.00                 |1.09                |0.92                |Novalbos 2010  |
|900030 |-, 20 mg, -, -  |Atomoxetine, PO                        |4.09                |3.26               |1.26               |1.71                 |1.57                |1.09                |Jung 2020      |
|900031 |-, 20 mg, -, -  |Atomoxetine, PO                        |1.66                |1.86               |0.89               |1.17                 |1.21                |0.97                |Jung 2020      |
|900032 |-, 20 mg, -, -  |Atomoxetine, PO                        |5.01                |9.84               |0.51               |2.85                 |5.43                |0.52                |Sauer 2003     |
|900033 |-, 25 mg, -, -  |Atomoxetine, PO                        |4.27                |3.68               |1.16               |1.39                 |1.86                |0.75                |Todor 2016     |
|900034 |-, 50 mg, -, -  |Desipramine, IV                        |4.04                |4.45               |0.91               |0.81                 |1.29                |0.62                |Brøsen 1988    |
|900035 |-, 50 mg, -, -  |Desipramine, IV                        |0.59                |0.88               |0.67               |0.84                 |1.28                |0.66                |Brøsen 1988    |
|900036 |-, 25 mg, -, -  |Desipramine, PO                        |3.23                |4.64               |0.70               |1.47                 |1.80                |0.82                |Spina 1987     |
|900037 |-, 100 mg, -, - |Desipramine, PO                        |4.81                |4.56               |1.05               |1.37                 |1.66                |0.83                |Brøsen 1993    |
|900038 |-, 100 mg, -, - |Desipramine, PO                        |0.63                |0.34               |1.86               |0.80                 |0.53                |1.51                |Brøsen 1993    |
|900039 |-, 100 mg, -, - |2-Hydroxydesipramine, PO               |1.17                |0.84               |1.39               |1.61                 |1.54                |1.05                |Brøsen 1993    |
|900040 |-, 100 mg, -, - |Desipramine, PO                        |0.59                |0.52               |1.13               |0.70                 |0.60                |1.16                |Bergmann 2001  |
|900041 |-, 100 mg, -, - |2-Hydroxydesipramine, PO               |1.56                |0.92               |1.70               |2.20                 |1.33                |1.65                |Bergmann 2001  |
|900042 |-, 100 mg, -, - |Desipramine, PO                        |5.16                |7.04               |0.73               |1.28                 |1.35                |0.95                |Brøsen 1986    |
|900043 |-, 100 mg, -, - |Desipramine, PO                        |0.59                |0.64               |0.92               |0.79                 |0.75                |1.06                |Brøsen 1986    |
|900044 |-, 100 mg, -, - |2-Hydroxydesipramine, PO               |1.25                |1.01               |1.23               |1.61                 |1.99                |0.81                |Brøsen 1986    |
|900045 |-, 5 mg, -, -   |Dextromethorphan, PO                   |3.07                |3.27               |0.94               |3.60                 |3.13                |1.15                |Storelli 2018  |
|900046 |-, 5 mg, -, -   |Dextrorphan, PO                        |0.99                |1.33               |0.75               |0.78                 |1.16                |0.67                |Storelli 2018  |
|900047 |-, 15 mg, -, -  |Dextromethorphan, PO                   |11.11               |11.06              |1.00               |7.95                 |12.17               |0.65                |Qiu 2016       |
|900048 |-, 15 mg, -, -  |Dextromethorphan, PO                   |2.51                |3.10               |0.81               |2.70                 |3.23                |0.84                |Qiu 2016       |
|900049 |-, 30 mg, -, -  |Dextromethorphan, PO                   |11.32               |7.67               |1.48               |7.97                 |5.84                |1.37                |Yamazaki 2017  |
|900050 |-, 30 mg, -, -  |Dextromethorphan, PO                   |49.85               |5.82               |8.57               |5.87                 |5.71                |1.03                |Capon 1996     |
|900051 |-, 30 mg, -, -  |Dextromethorphan, PO                   |10.33               |14.29              |0.72               |6.28                 |8.11                |0.77                |Gorski 2004    |
|900052 |-, 20 mg, -, -  |Metoprolol racemate, IV                |1.46                |2.11               |0.69               |1.07                 |1.40                |0.76                |Leemann 1993   |
|900053 |-, 100 mg, -, - |Metoprolol racemate, PO                |3.53                |0.31               |11.39              |2.15                 |0.23                |9.36                |Bae 2014       |
|900054 |-, 100 mg, -, - |alpha-Hydroxymetoprolol, PO            |0.58                |5.58               |0.10               |0.35                 |2.77                |0.13                |Bae 2014       |
|900055 |-, 100 mg, -, - |Metoprolol racemate, PO                |3.49                |4.49               |0.78               |2.11                 |3.18                |0.66                |Jin 2008       |
|900056 |-, 100 mg, -, - |alpha-Hydroxymetoprolol, PO            |0.57                |0.49               |1.17               |0.35                 |0.34                |1.01                |Jin 2008       |
|900057 |-, 100 mg, -, - |Metoprolol racemate, PO                |1.59                |2.08               |0.76               |1.38                 |1.70                |0.81                |Jin 2008       |
|900058 |-, 100 mg, -, - |alpha-Hydroxymetoprolol, PO            |0.90                |1.00               |0.90               |0.78                 |0.73                |1.07                |Jin 2008       |
|900059 |-, 100 mg, -, - |Metoprolol racemate, PO                |5.54                |3.36               |1.65               |2.13                 |2.86                |0.74                |Hamelin 2000   |
|900060 |-, 100 mg, -, - |Metoprolol racemate, PO                |5.23                |3.12               |1.68               |2.07                 |2.44                |0.85                |Sharma 2005    |
|900061 |-, 100 mg, -, - |R-Metoprolol, PO                       |5.85                |3.79               |1.54               |2.23                 |2.98                |0.75                |Sharma 2005    |
|900062 |-, 100 mg, -, - |S-Metoprolol, PO                       |4.74                |2.72               |1.74               |1.93                 |2.38                |0.81                |Sharma 2005    |
|900063 |-, 100 mg, -, - |R-Metoprolol, PO                       |2.97                |2.82               |1.05               |2.12                 |2.21                |0.96                |Huang 1999     |
|900064 |-, 100 mg, -, - |S-Metoprolol, PO                       |2.66                |2.17               |1.22               |1.89                 |1.72                |1.10                |Huang 1999     |
|900065 |-, 100 mg, -, - |R-Metoprolol, PO                       |1.58                |1.36               |1.16               |1.41                 |1.19                |1.18                |Huang 1999     |
|900066 |-, 100 mg, -, - |S-Metoprolol, PO                       |1.54                |1.27               |1.21               |1.36                 |1.05                |1.29                |Huang 1999     |
|900067 |-, 100 mg, -, - |R-Metoprolol, PO                       |7.01                |7.67               |0.91               |2.72                 |3.36                |0.81                |Seeringer 2008 |
|900068 |-, 100 mg, -, - |S-Metoprolol, PO                       |5.58                |5.22               |1.07               |2.29                 |2.33                |0.98                |Seeringer 2008 |
|900069 |-, 100 mg, -, - |R-Metoprolol, PO                       |0.59                |0.39               |1.52               |0.65                 |0.52                |1.24                |Seeringer 2008 |
|900070 |-, 100 mg, -, - |S-Metoprolol, PO                       |0.60                |0.41               |1.47               |0.67                 |0.59                |1.13                |Seeringer 2008 |
|900071 |-, 100 mg, -, - |Mexiletine, PO                         |1.26                |1.54               |0.82               |1.16                 |1.40                |0.83                |Labbé 2000     |
|900072 |-, 200 mg, -, - |Mexiletine, PO                         |1.45                |1.39               |1.04               |1.15                 |1.33                |0.86                |Abolfathi 1993 |
|900073 |-, 25 mg, -, -  |Paroxetine, PO                         |5.93                |7.40               |0.80               |2.34                 |5.05                |0.46                |Chen 2015      |
|900074 |-, 25 mg, -, -  |Paroxetine, PO                         |3.17                |3.68               |0.86               |1.83                 |2.96                |0.62                |Chen 2015      |
|900075 |-, 25 mg, -, -  |Paroxetine, PO                         |1.82                |1.61               |1.13               |1.50                 |1.10                |1.36                |Chen 2015      |
|900076 |-, 30 mg, -, -  |Paroxetine, PO                         |2.53                |2.35               |1.08               |1.86                 |1.55                |1.20                |Sindrup 1992   |
|900077 |-, 40 mg, -, -  |Paroxetine, PO                         |3.21                |3.80               |0.84               |2.02                 |1.57                |1.28                |Mürdter 2016   |
|900078 |-, 40 mg, -, -  |Paroxetine, PO                         |2.64                |2.38               |1.11               |1.72                 |1.41                |1.22                |Mürdter 2016   |
|900079 |-, 40 mg, -, -  |Paroxetine, PO                         |2.71                |4.53               |0.60               |1.82                 |1.57                |1.16                |Mürdter 2016   |
|900080 |-, 40 mg, -, -  |Paroxetine, PO                         |2.34                |2.05               |1.14               |1.65                 |0.99                |1.67                |Mürdter 2016   |
|900081 |-, 40 mg, -, -  |Paroxetine, PO                         |0.43                |0.51               |0.85               |0.60                 |0.68                |0.89                |Mürdter 2016   |
|900082 |-, 40 mg, -, -  |Paroxetine, PO                         |8.23                |5.89               |1.40               |2.56                 |4.88                |0.52                |Yoon 2000      |
|900083 |-, 40 mg, -, -  |Paroxetine, PO                         |5.43                |1.49               |3.64               |1.91                 |1.43                |1.34                |Yoon 2000      |
|900084 |-, 40 mg, -, -  |Paroxetine, PO                         |2.46                |1.38               |1.78               |1.41                 |1.38                |1.02                |Yoon 2000      |
|900085 |-, 2 mg, -, -   |Risperidone, PO                        |2.84                |6.18               |0.46               |1.94                 |3.29                |0.59                |Bondolfi 2002  |

<br>
<br>

## 3.3 DGI Concentration-Time Profiles<a id="dgi-concentration-time-profiles"></a>

The following section shows concentration-time profiles of the victim drugs of the simulated DD(G)I studies in comparison to observed data.

### 3.3.1 Clomiphene DGI<a id="clomiphene-dgi-timeprofile"></a>

<a id="figure-3-5"></a>

![](images/052_section_dgi-evaluations/058_section_dgi-concentration-time-profiles/059_section_clomiphene-dgi-timeprofile/comparison_time_profile_Clomiphene_DGI____E__clomiphene_99.png)

**Figure 3-5: Clomiphene DGI - (E)-clomiphene**

<br>
<br>

<a id="figure-3-6"></a>

![](images/052_section_dgi-evaluations/058_section_dgi-concentration-time-profiles/059_section_clomiphene-dgi-timeprofile/comparison_time_profile_Clomiphene_DGI____E__4_hydroxyclomiphene_100.png)

**Figure 3-6: Clomiphene DGI - (E)-4-hydroxyclomiphene**

<br>
<br>

<a id="figure-3-7"></a>

![](images/052_section_dgi-evaluations/058_section_dgi-concentration-time-profiles/059_section_clomiphene-dgi-timeprofile/comparison_time_profile_Clomiphene_DGI____E__N_desethylclomiphene_101.png)

**Figure 3-7: Clomiphene DGI - (E)-N-desethylclomiphene**

<br>
<br>

<a id="figure-3-8"></a>

![](images/052_section_dgi-evaluations/058_section_dgi-concentration-time-profiles/059_section_clomiphene-dgi-timeprofile/comparison_time_profile_Clomiphene_DGI____E__4_hydroxy_N_desethylclomiphene_102.png)

**Figure 3-8: Clomiphene DGI - (E)-4-hydroxy-N-desethylclomiphene**

<br>
<br>

### 3.3.2 Atomoxetine DGI<a id="atomoxetine-dgi-timeprofile"></a>

<a id="figure-3-9"></a>

![](images/052_section_dgi-evaluations/058_section_dgi-concentration-time-profiles/060_section_atomoxetine-dgi-timeprofile/comparison_time_profile_Atomoxetine_DGI___Byeon_2015_103.png)

**Figure 3-9: Atomoxetine DGI - Byeon 2015**

<br>
<br>

<a id="figure-3-10"></a>

![](images/052_section_dgi-evaluations/058_section_dgi-concentration-time-profiles/060_section_atomoxetine-dgi-timeprofile/comparison_time_profile_Atomoxetine_DGI___Kim_2018_104.png)

**Figure 3-10: Atomoxetine DGI - Kim 2018**

<br>
<br>

### 3.3.3 Risperidone DGI<a id="risperidone-dgi-timeprofile"></a>

<a id="figure-3-11"></a>

![](images/052_section_dgi-evaluations/058_section_dgi-concentration-time-profiles/061_section_risperidone-dgi-timeprofile/comparison_time_profile_Risperidone_DGI___Risperidone_105.png)

**Figure 3-11: Risperidone DGI - Risperidone**

<br>
<br>

<a id="figure-3-12"></a>

![](images/052_section_dgi-evaluations/058_section_dgi-concentration-time-profiles/061_section_risperidone-dgi-timeprofile/comparison_time_profile_Risperidone_DGI___9_Hydroxyrisperidone_106.png)

**Figure 3-12: Risperidone DGI - 9-Hydroxyrisperidone**

<br>
<br>

# 4 DDGI Evaluations<a id="ddgi-evaluations"></a>

The following section shows the correlations between observed and model-predicted AUC<sub>last</sub> and C<sub>max</sub> ratios, respectively.

Specifically, the PBPK model performance for the PK parameters **AUC ratio (AUCR)** and **C<sub>max</sub> ratio (CmaxR)** is assessed via:

- predicted (*Pred*) vs. observed (*Obs*) plots

- *Pred*/*Obs* vs. *Obs* plots

- geometric mean fold error (GMFE):
  
  ![GMFE equation](images/GFME_equation.PNG)
  
- number of AUCR and CMAXR falling within 2-fold error range and within the limits suggested by [Guest et al. 2011](#references)
  
- detailed table of results for each study

In the plots,

- the dotted lines denote 0.50–2.00 (2-fold) criterion,

- the solid lines denote the limits suggested by [Guest et al. 2011](#references),

- the bold solid line denotes the unity line,

- each color represents one combination of perpetrator and victim (parent drug or metabolite)

***

<a id="figure-4-1"></a>

![](images/062_section_ddgi-evaluations/DDIRatio_2_ddi_ratio_plot_AUC_predictedVsObserved.png)

**Figure 4-1: CYP2D6 DDGIs.  Predicted vs. Observed AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-4-2"></a>

![](images/062_section_ddgi-evaluations/DDIRatio_2_ddi_ratio_plot_AUC_residualsVsObserved.png)

**Figure 4-2: CYP2D6 DDGIs.  Predicted/Observed vs. Observed AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-4-3"></a>

![](images/062_section_ddgi-evaluations/DDIRatio_2_ddi_ratio_plot_CMAX_predictedVsObserved.png)

**Figure 4-3: CYP2D6 DDGIs.  Predicted vs. Observed CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-4-4"></a>

![](images/062_section_ddgi-evaluations/DDIRatio_2_ddi_ratio_plot_CMAX_residualsVsObserved.png)

**Figure 4-4: CYP2D6 DDGIs.  Predicted/Observed vs. Observed CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="table-4-1"></a>

**Table 4-1: GMFE for CYP2D6 DDGIs Ratio**

|PK parameter |GMFE |
|:------------|:----|
|AUC          |1.45 |
|CMAX         |1.45 |

<br>
<br>

<a id="table-4-2"></a>

**Table 4-2: Summary table for CYP2D6 DDGIs - AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

|AUC                          |Number |Ratio [%] |
|:----------------------------|:------|:---------|
|Points total                 |68     |-        |
|Points within Guest *et al.* |39     |57.35     |
|Points within 2 fold         |55     |80.88     |

<br>
<br>

<a id="table-4-3"></a>

**Table 4-3: Summary table for CYP2D6 DDGIs - CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

|CMAX                         |Number |Ratio [%] |
|:----------------------------|:------|:---------|
|Points total                 |68     |-        |
|Points within Guest *et al.* |36     |52.94     |
|Points within 2 fold         |56     |82.35     |

<br>
<br>

<a id="table-4-4"></a>

**Table 4-4: Summary table for CYP2D6 DDGIs**

|DataID |Perpetrator                      |Victim                                 |Predicted AUC Ratio |Observed AUC Ratio |Pred/Obs AUC Ratio |Predicted CMAX Ratio |Observed CMAX Ratio |Pred/Obs CMAX Ratio |Reference      |
|:------|:--------------------------------|:--------------------------------------|:-------------------|:------------------|:------------------|:--------------------|:-------------------|:-------------------|:--------------|
|16950  |Quinidine, 50 mg, PO, QID        |Mexiletine, PO                         |1.00                |0.85               |1.18               |1.00                 |0.79                |1.27                |Abolfathi 1993 |
|16952  |Quinidine, 50 mg, PO, QID        |Mexiletine, PO                         |1.41                |1.30               |1.08               |1.14                 |1.27                |0.90                |Abolfathi 1993 |
|16988  |Paroxetine, 20 mg, PO, QD        |Atomoxetine, PO                        |1.78                |2.80               |0.64               |1.15                 |1.28                |0.90                |Jung 2020      |
|16990  |Paroxetine, 20 mg, PO, QD        |Atomoxetine, PO                        |3.62                |4.70               |0.77               |1.49                 |1.71                |0.87                |Jung 2020      |
|16992  |Paroxetine, 20 mg, PO, QD        |Atomoxetine, PO                        |5.76                |10.57              |0.54               |1.78                 |2.21                |0.81                |Jung 2020      |
|16994  |Paroxetine, 20/20 mg, PO, BID/QD |Atomoxetine, PO                        |3.90                |5.73               |0.68               |1.34                 |1.73                |0.77                |Todor 2015     |
|16996  |Paroxetine, 20 mg, PO, QD        |Atomoxetine, PO                        |5.34                |13.87              |0.38               |2.59                 |3.70                |0.70                |Belle 2002     |
|16998  |Clarithromycin, 500 mg, PO, BID  |(E)-Clomiphene, PO                     |2.38                |2.13               |1.12               |1.52                 |1.55                |0.98                |Mürdter 2016   |
|17000  |Clarithromycin, 500 mg, PO, BID  |(E)-4-Hydroxyclomiphene, PO            |2.77                |1.27               |2.18               |2.36                 |1.01                |2.34                |Mürdter 2016   |
|17002  |Clarithromycin, 500 mg, PO, BID  |(E)-N-Desethylclomiphene, PO           |0.75                |0.65               |1.16               |0.60                 |0.54                |1.12                |Mürdter 2016   |
|17004  |Clarithromycin, 500 mg, PO, BID  |(E)-4-Hydroxy-N-desethylclomiphene, PO |1.60                |0.59               |2.71               |1.70                 |0.67                |2.53                |Mürdter 2016   |
|17006  |Clarithromycin, 500 mg, PO, BID  |(E)-Clomiphene, PO                     |1.45                |1.82               |0.80               |1.18                 |1.59                |0.75                |Mürdter 2016   |
|17008  |Clarithromycin, 500 mg, PO, BID  |(E)-4-Hydroxyclomiphene, PO            |1.75                |1.72               |1.02               |1.41                 |1.40                |1.00                |Mürdter 2016   |
|17010  |Clarithromycin, 500 mg, PO, BID  |(E)-N-Desethylclomiphene, PO           |0.30                |0.29               |1.02               |0.17                 |0.19                |0.91                |Mürdter 2016   |
|17012  |Clarithromycin, 500 mg, PO, BID  |(E)-4-Hydroxy-N-desethylclomiphene, PO |0.45                |0.35               |1.27               |0.25                 |0.25                |0.98                |Mürdter 2016   |
|17014  |Clarithromycin, 500 mg, PO, BID  |(E)-Clomiphene, PO                     |1.22                |1.98               |0.62               |1.10                 |1.73                |0.63                |Mürdter 2016   |
|17016  |Clarithromycin, 500 mg, PO, BID  |(E)-4-Hydroxyclomiphene, PO            |1.39                |1.63               |0.86               |1.18                 |1.67                |0.70                |Mürdter 2016   |
|17018  |Clarithromycin, 500 mg, PO, BID  |(E)-N-Desethylclomiphene, PO           |0.26                |0.34               |0.76               |0.19                 |0.47                |0.41                |Mürdter 2016   |
|17020  |Clarithromycin, 500 mg, PO, BID  |(E)-4-Hydroxy-N-desethylclomiphene, PO |0.38                |0.43               |0.89               |0.21                 |0.39                |0.54                |Mürdter 2016   |
|17022  |Clarithromycin, 500 mg, PO, BID  |(E)-Clomiphene, PO                     |1.15                |1.23               |0.93               |1.07                 |1.59                |0.67                |Mürdter 2016   |
|17024  |Clarithromycin, 500 mg, PO, BID  |(E)-4-Hydroxyclomiphene, PO            |1.28                |1.22               |1.05               |1.13                 |1.04                |1.09                |Mürdter 2016   |
|17026  |Clarithromycin, 500 mg, PO, BID  |(E)-N-Desethylclomiphene, PO           |0.30                |0.21               |1.41               |0.26                 |0.19                |1.35                |Mürdter 2016   |
|17028  |Clarithromycin, 500 mg, PO, BID  |(E)-4-Hydroxy-N-desethylclomiphene, PO |0.34                |0.22               |1.56               |0.25                 |0.29                |0.88                |Mürdter 2016   |
|17030  |Clarithromycin, 500 mg, PO, BID  |(E)-Clomiphene, PO                     |1.11                |1.06               |1.05               |1.06                 |1.80                |0.59                |Mürdter 2016   |
|17032  |Clarithromycin, 500 mg, PO, BID  |(E)-4-Hydroxyclomiphene, PO            |1.21                |1.83               |0.66               |1.09                 |1.20                |0.91                |Mürdter 2016   |
|17034  |Clarithromycin, 500 mg, PO, BID  |(E)-N-Desethylclomiphene, PO           |0.34                |0.39               |0.88               |0.31                 |0.23                |1.36                |Mürdter 2016   |
|17036  |Clarithromycin, 500 mg, PO, BID  |(E)-4-Hydroxy-N-desethylclomiphene, PO |0.36                |0.41               |0.88               |0.29                 |0.38                |0.77                |Mürdter 2016   |
|17038  |Paroxetine, 40 mg, PO, QD        |(E)-Clomiphene, PO                     |1.19                |1.09               |1.10               |1.08                 |0.91                |1.19                |Mürdter 2016   |
|17040  |Paroxetine, 40 mg, PO, QD        |(E)-4-Hydroxyclomiphene, PO            |1.21                |1.02               |1.19               |1.16                 |1.19                |0.98                |Mürdter 2016   |
|17042  |Paroxetine, 40 mg, PO, QD        |(E)-N-Desethylclomiphene, PO           |0.97                |1.21               |0.80               |0.87                 |1.36                |0.64                |Mürdter 2016   |
|17044  |Paroxetine, 40 mg, PO, QD        |(E)-4-Hydroxy-N-desethylclomiphene, PO |1.16                |1.01               |1.15               |1.15                 |0.94                |1.22                |Mürdter 2016   |
|17046  |Paroxetine, 40 mg, PO, QD        |(E)-Clomiphene, PO                     |2.63                |2.47               |1.06               |1.43                 |1.30                |1.10                |Mürdter 2016   |
|17048  |Paroxetine, 40 mg, PO, QD        |(E)-4-Hydroxyclomiphene, PO            |0.46                |0.22               |2.07               |0.25                 |0.09                |2.78                |Mürdter 2016   |
|17050  |Paroxetine, 40 mg, PO, QD        |(E)-N-Desethylclomiphene, PO           |4.10                |4.86               |0.84               |1.75                 |1.29                |1.36                |Mürdter 2016   |
|17052  |Paroxetine, 40 mg, PO, QD        |(E)-4-Hydroxy-N-desethylclomiphene, PO |0.39                |0.29               |1.33               |0.25                 |0.22                |1.13                |Mürdter 2016   |
|17054  |Paroxetine, 40 mg, PO, QD        |(E)-Clomiphene, PO                     |4.59                |9.53               |0.48               |1.81                 |4.02                |0.45                |Mürdter 2016   |
|17056  |Paroxetine, 40 mg, PO, QD        |(E)-4-Hydroxyclomiphene, PO            |0.54                |0.86               |0.62               |0.18                 |0.28                |0.64                |Mürdter 2016   |
|17058  |Paroxetine, 40 mg, PO, QD        |(E)-N-Desethylclomiphene, PO           |11.85               |25.32              |0.47               |3.18                 |9.07                |0.35                |Mürdter 2016   |
|17060  |Paroxetine, 40 mg, PO, QD        |(E)-4-Hydroxy-N-desethylclomiphene, PO |1.23                |1.91               |0.64               |0.46                 |0.50                |0.93                |Mürdter 2016   |
|17062  |Paroxetine, 40 mg, PO, QD        |(E)-Clomiphene, PO                     |6.66                |10.35              |0.64               |2.21                 |3.85                |0.57                |Mürdter 2016   |
|17064  |Paroxetine, 40 mg, PO, QD        |(E)-4-Hydroxyclomiphene, PO            |0.89                |1.54               |0.58               |0.20                 |0.27                |0.75                |Mürdter 2016   |
|17066  |Paroxetine, 40 mg, PO, QD        |(E)-N-Desethylclomiphene, PO           |22.80               |21.14              |1.08               |5.28                 |4.59                |1.15                |Mürdter 2016   |
|17068  |Paroxetine, 40 mg, PO, QD        |(E)-4-Hydroxy-N-desethylclomiphene, PO |3.50                |2.65               |1.32               |0.69                 |0.74                |0.93                |Mürdter 2016   |
|17070  |Paroxetine, 40 mg, PO, QD        |(E)-Clomiphene, PO                     |6.29                |12.47              |0.50               |2.08                 |7.08                |0.29                |Mürdter 2016   |
|17072  |Paroxetine, 40 mg, PO, QD        |(E)-4-Hydroxyclomiphene, PO            |1.08                |3.76               |0.29               |0.26                 |0.70                |0.37                |Mürdter 2016   |
|17074  |Paroxetine, 40 mg, PO, QD        |(E)-N-Desethylclomiphene, PO           |15.92               |33.72              |0.47               |4.38                 |12.14               |0.36                |Mürdter 2016   |
|17076  |Paroxetine, 40 mg, PO, QD        |(E)-4-Hydroxy-N-desethylclomiphene, PO |4.16                |5.87               |0.71               |1.06                 |1.54                |0.69                |Mürdter 2016   |
|17082  |Paroxetine, 20 mg, PO, QD        |Desipramine, PO                        |3.11                |2.71               |1.15               |1.37                 |1.90                |0.72                |Nichols 2009   |
|17084  |Paroxetine, 20 mg, PO, QD        |2-Hydroxydesipramine, PO               |0.19                |0.55               |0.34               |0.07                 |0.20                |0.37                |Nichols 2009   |
|17086  |Paroxetine, 20 mg, PO, QD        |Desipramine, PO                        |0.99                |0.87               |1.14               |0.99                 |0.85                |1.16                |Brøsen 1993    |
|17088  |Paroxetine, 20 mg, PO, QD        |Desipramine, PO                        |4.22                |4.60               |0.92               |1.33                 |1.90                |0.70                |Brøsen 1993    |
|17090  |Paroxetine, 20 mg, PO, QD        |Desipramine, PO                        |5.78                |7.76               |0.74               |1.61                 |2.45                |0.66                |Brøsen 1993    |
|17092  |Paroxetine, 20/30 mg, PO, QD/QD  |Desipramine, PO                        |3.13                |1.84               |1.70               |3.91                 |1.27                |3.08                |Aldermann 1997 |
|17093  |Paroxetine, 20/30 mg, PO, QD/QD  |Desipramine, PO                        |3.13                |4.96               |0.63               |3.91                 |4.58                |0.85                |Aldermann 1997 |
|17094  |Paroxetine, 20/30 mg, PO, QD/QD  |Desipramine, PO                        |3.13                |7.40               |0.42               |3.91                 |4.58                |0.85                |Aldermann 1997 |
|17098  |Paroxetine, 20 mg, PO,           |Dextromethorphan, PO                   |13.46               |8.45               |1.59               |6.14                 |5.11                |1.20                |Storelli 2018  |
|17100  |Paroxetine, 20 mg, PO,           |Dextrorphan, PO                        |0.59                |0.65               |0.91               |0.15                 |0.25                |0.59                |Storelli 2018  |
|17102  |Paroxetine, 20 mg, PO,           |Dextromethorphan, PO                   |7.01                |23.61              |0.30               |8.21                 |12.29               |0.67                |Storelli 2018  |
|17104  |Paroxetine, 20 mg, PO,           |Dextrorphan, PO                        |0.92                |1.92               |0.48               |0.32                 |0.77                |0.42                |Storelli 2018  |
|17106  |Paroxetine, 20 mg, PO, QD        |Dextromethorphan, PO                   |1.00                |1.45               |0.69               |1.00                 |1.42                |0.70                |Schoedel 2012  |
|17136  |Quinidine, 50 mg, PO, SD         |Metoprolol, IV                         |0.75                |0.95               |0.79               |1.02                 |0.98                |1.04                |Leemann 1993   |
|17138  |Quinidine, 50 mg, PO, SD         |Metoprolol, IV                         |0.88                |2.00               |0.44               |1.04                 |1.35                |0.77                |Leemann 1993   |
|17140  |Quinidine, 250 mg, PO, BID       |Metoprolol, IV                         |1.39                |0.97               |1.43               |1.04                 |1.09                |0.95                |Leemann 1993   |
|17142  |Quinidine, 250 mg, PO, BID       |Metoprolol, IV                         |1.97                |2.38               |0.83               |1.10                 |1.35                |0.81                |Leemann 1993   |
|17144  |Quinidine, 100 mg, PO, QD        |R-Metoprolol, PO                       |3.69                |3.44               |1.07               |1.88                 |1.43                |1.32                |Johnson 1996   |
|17146  |Quinidine, 100 mg, PO, QD        |S-Metoprolol, PO                       |3.65                |2.87               |1.27               |1.86                 |1.28                |1.45                |Johnson 1996   |
|17148  |Quinidine, 100 mg, PO, QD        |R-Metoprolol, PO                       |3.66                |4.35               |0.84               |1.89                 |1.87                |1.01                |Johnson 1996   |
|17150  |Quinidine, 100 mg, PO, QD        |S-Metoprolol, PO                       |3.62                |2.99               |1.21               |1.86                 |1.40                |1.33                |Johnson 1996   |

<br>
<br>

## 4.1 DDGI Network Evaluations<a id="ddgi-network-evaluations"></a>

**Figure 1** shows the developed CYP2D6 DDGI network of interacting perpetrator and victim drugs. (a) Schematic illustration of the modeled interactions of CYP2D6 perpetrator and victim drugs. Black arrows indicate metabolism or transport, green arrows indicate induction, red solid lines indicate competitive inhibition, red dashed lines down-regulation (bupropion), noncompetitive inhibition (verapamil P-gp inhibition) or mechanism-based inactivation (others). (b-c) Drug-drug-(gene) interaction matrix for modeled interactions mediated by (a) CYP2D6 and (b) CYP3A4 and P-gp. Colors indicate categories according to the FDA Examples of Drugs that Interact with CYP Enzymes and Transporter Systems.42 Height of the grey ribbons indicates the number of clinical studies for the respective interaction covered by the network, numbers in brackets indicate the number of clinical interaction studies for the corresponding compound. CYP: cytochrome P450, P-gp: P-glycoprotein.

**Figure** **1: CYP2D6 DDGI modeling network**
<a id="figure-4-5"></a>

![CYP2D6 DDGI network](images/Figure_1_DDGI_Network.pdf)

The following victim and/or perpetrator PBPK models were applied: 

- **Alprazolam**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Alprazolam-Model/blob/master/Alprazolam-Model.json
- **Atomoxetine**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Atomoxetine-Model/blob/main/atomoxetine-model.json 
- **Bupropion**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Bupropion-Model/blob/main/Bupropion-Model.json 
- **Carbamazepine**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Carbamazepine-Model/blob/main/Carbamazepine-Model.json
- **Cimetidine**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Cimetidine-Model/blob/master/Cimetidine-Model.json
- **Clarithromycin**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Clarithromycin-Model/blob/master/Clarithromycin-Model.json
- **(E)-Clomiphene** 
  Model snapshot:https://github.com/Open-Systems-Pharmacology/Clomiphene-Model/blob/main/(E)-clomiphene-DGI-Model.json 
- **Desipramine** 
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Desipramine-Model/blob/main/Desipramine-Model.json
- **Dextromethorphan** 
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Dextromethorphan-Model/blob/main/dextromethorphan_aggregated_simulations.json
- **Digoxin** 
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Digoxin-Model/blob/master/Digoxin.json
- **Erythromycin** 
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Erythromycin-Model/blob/master/Erythromycin-Model.json
- **Fluvoxamine**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Fluvoxamine-Model/blob/master/Fluvoxamine-Model.json
- **Itraconazole**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Itraconazole-Model/blob/master/Itraconazole-Model.json
- **Ketoconazole**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Ketoconazole-Model/blob/main/Ketoconazole-Model.json
- **Metoprolol**
  Model file: https://github.com/Open-Systems-Pharmacology/Metoprolol-Model/blob/main/Metoprolol-Model.pksim5
- **Mexiletine** 
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Mexiletine-Model/blob/main/Mexiletine-Model.json
- **Omeprazole**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Omeprazole-Model/blob/main/Omeprazole-Model.json
- **Paroxetine** 
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Paroxetine-Model/blob/main/paroxetine-model.json
- **Quinidine** 
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Quinidine-Model/blob/main/Quinidine-Model.json
- **Rifampicin**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Rifampicin-Model/blob/master/Rifampicin-Model.json
- **Risperidone**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Risperidone-Model/blob/main/risperidone-model.json
- **Verapamil**
  Model snapshot: https://github.com/Open-Systems-Pharmacology/Verapamil-Model/blob/master/Verapamil-Model.json

The following interaction scenarios were predicted and used to qualify the final DDGI network:

- Alprazolam as victim:
  - Paroxetine-alprazolam-DDI

- Atomoxetine as victim:
  - Bupropion-atomoxetine-DDGI
  - Fluvoxamine-atomoxetine-DDI
  - Paroxetine-atomoxetine-DDGI

- (E)-Clomiphene as victim:
  - Clarithromycin-clomiphene-DDGI
  - Paroxetine-clomiphene-DDGI

- Desipramine as victim:
  - Atomoxetine-desipramine-DDI
  - Bupropion-desipramine-DDI
  - Paroxetine-desipramine-DDGI
  - Quinidine-desipramine-DDI

- Dextromethorphan as victim:
  - Paroxetine-dextromethorphan-DDGI
  - Quinidine-dextromethorphan-DDI

- Digoxin as victim: 
  - Quinidine-digoxin-DDI

- Metoprolol as victim:
  - Cimetidine-metoprolol-DDI
  - Paroxetine-metoprolol-DDI
  - Quinidine-metoprolol-DDGI
  - Rifampicin-metoprolol-DDI

- Mexiletine as victim: 
  - Quinidine-mexiletine-DDGI

- Midazolam as victim: 
  - Atomoxetine-midazolam-DDI

- Paroxetine as victim:
  - Itraconazole-paroxetine-DDI
  - Quinidine-paroxetine-DDI

- Quinidine as victim: 
  - Carbamazepine-quinidine-DDI
  - Cimetidine-quinidine-DDI
  - Erythromycin-quinidine-DDI
  - Fluvoxamine-quinidine-DDI
  - Itraconazole-quinidine-DDI
  - Omeprazole-quinidine-DDI
  - Rifampicin-quinidine-DDI
  - Verapamil-quinidine-DDI

- Risperidone as victim:
  - Ketoconazole-risperidone-DDI
  - Rifampicin-risperidone-DDI
  - Verapamil-risperidone-DDI

The published DD(G)I studies between the respective perpetrators and victim drugs were simulated and compared to observed data. The following sections give an overview of the clinical studies being part of this qualification report.

### 4.1.1 Paroxetine - Atomoxetine DDGI<a id="paroxetine-atomoxetine-ddgi"></a>

The paroxetine-atomoxetine interaction was evaluated using clinical DDGI studies listed in [Table 4](#table-4).

| **Source**                    | **Route** | **Schedule**  | **Pop.** | **Sex** | **N**    | **Perpetrator**               |
| ----------------------------- | --------- | ------------- | -------- | ------- | -------- | ----------------------------- |
| [Jung 2020](#references)    | po        | 20 mg s.d.    | Asian    | m       | 7 AS0    | +/- PAR, 20 mg q.d. po        |
| [Jung 2020](#references)    | po        | 20 mg s.d.    | Asian    | m       | 9 AS1.25 | +/- PAR, 20 mg q.d. po        |
| [Jung 2020](#references)    | po        | 20 mg s.d.    | Asian    | m       | 10 AS2   | +/- PAR, 20 mg q.d. po        |
| [Todor 2015](#references)   | po        | 25 mg s.d.    | European | m       | 22       | +/- PAR, 20 mg b.i.d./q.d. po |
| [Belle 2002](#references)   | po        | 20 mg b.i.d.  | American | m       | 22       | +/- PAR, 20 mg q.d. po        |

**Table 4:**<a name="table-4"></a> AS: CYP2D6 activity score, b.i.d.: twice daily, m: male, N: number of study participants, PAR: paroxetine, po: oral, pop.: population used in simulations, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

The Jung 2020 cohorts are reported by CYP2D6 activity score. These simulations therefore retain activity-score-specific atomoxetine CYP2D6 k<sub>cat</sub> settings. The remaining atomoxetine studies use the NM/EM setting unless a PM cohort is explicitly reported.

### 4.1.2 Clarithromycin - Clomiphene DDGI<a id="clarithromycin-clomiphene-ddgi"></a>

The clarithromycin-clomiphene interaction was evaluated using clinical DDGI studies listed in [Table 5](#table-5).

| **Source**                    | **Route** | **Schedule**  | **Pop.** | **Sex** | **N**   | **Perpetrator**            |
| ----------------------------- | --------- | ------------- | -------- | ------- | ------- | -------------------------- |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 5 AS0   | +/- CLA, 500 mg b.i.d. po  |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 4 AS0.5 | +/- CLA, 500 mg b.i.d. po  |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 2 AS1   | +/- CLA, 500 mg b.i.d. po  |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 2 AS2   | +/- CLA, 500 mg b.i.d. po  |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 2 AS3   | +/- CLA, 500 mg b.i.d. po  |

**Table 5:**<a name="table-5"></a> AS: CYP2D6 activity score, b.i.d.: twice daily, CLA: clarithromycin, f: female, N: number of study participants, po: oral, pop.: population used in simulations, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 4.1.3 Paroxetine - Clomiphene DDGI<a id="paroxetine-clomiphene-ddgi"></a>

The paroxetine-clomiphene interaction was evaluated using clinical DDGI studies listed in [Table 6](#table-6).

| **Source**                    | **Route** | **Schedule**  | **Pop.** | **Sex** | **N**   | **Perpetrator**         |
| ----------------------------- | --------- | ------------- | -------- | ------- | ------- | ----------------------- |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 4 AS0   | +/- PAR, 40 mg q.d. po  |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 4 AS0.5 | +/- PAR, 40 mg q.d. po  |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 2 AS1   | +/- PAR, 40 mg q.d. po  |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 2 AS2   | +/- PAR, 40 mg q.d. po  |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 2 AS3   | +/- PAR, 40 mg q.d. po  |

**Table 6:**<a name="table-6"></a> AS: CYP2D6 activity score, b.i.d.: twice daily, f: female, N: number of study participants, PAR: paroxetine, po: oral, pop.: population used in simulations, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 4.1.4 Paroxetine - Desipramine DDGI<a id="paroxetine-desipramine-ddgi"></a>

The paroxetine-desipramine interaction was evaluated using clinical DDGI studies listed in [Table 9](#table-9).

| **Source**                      | **Route** | **Schedule** | **Pop.** | **Sex** | **N**     | **Perpetrator**           |
| ------------------------------- | --------- | ------------ | -------- | ------- | --------- | ------------------------- |
| [Nichols 2009](#references)   | po        | 50 mg s.d.   | American | m       | 20        | +/- PAR, 20 mg q.d. po    |
| [Brøsen 1993](#references)    | po        | 100 mg s.d.  | European | m       | 8 PM      | +/- PAR, 20 mg q.d. po    |
| [Brøsen 1993](#references)    | po        | 100 mg s.d.  | European | m       | 5 NM      | +/- PAR, 20 mg q.d. po    |
| [Brøsen 1993](#references)    | po        | 100 mg s.d.  | European | m       | 4 fast NM | +/- PAR, 20 mg q.d. po    |
| [Aldermann 1997](#references) | po        | 50 mg q.d.   | American | m       | 6         | +/- PAR, 20/30 mg q.d. po |

**Table 9:**<a name="table-9"></a> m: male, N: number of study participants, PAR: paroxetine, NM: CYP2D6 normal metabolizer, PM: CYP2D6 poor metabolizer, po: oral, pop.: population used in simulations, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 4.1.5 Paroxetine - Dextromethorphan DDGI<a id="paroxetine-dextromethorphan-ddgi"></a>

The paroxetine-dextromethorphan interaction was evaluated using clinical DDGI studies listed in [Table 11](#table-11).

| **Source**                     | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**          |
| ------------------------------ | --------- | ------------- | -------- | ------- | ----- | ------------------------ |
| [Storelli 2018](#references) | po        |  5 mg s.d.    | European | f       | 16 IM | +/- PAR, 20 mg b.i.d. po |
| [Storelli 2018](#references) | po        |  5 mg s.d.    | European | f       | 17 NM | +/- PAR, 20 mg b.i.d. po |
| [Schoedel 2012](#references) | po        |  30 mg b.i.d. | American | m       | 13    | +/- PAR, 30 mg q.d. po   |

**Table 11:**<a name="table-11"></a> b.i.d.: twice daily, f: female, IM: CYP2D6 intermediate metabolizer, m: male, N: number of study participants, NM: CYP2D6 normal metabolizer, po: oral, pop.: population used in simulations, QUI: quinidine, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 4.1.6 Quinidine - Metoprolol DDGI<a id="quinidine-metoprolol-ddgi"></a>

The quinidine-metoprolol interaction was evaluated using clinical DDGI studies listed in [Table 16](#table-16).

| **Source**                     | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**           |
| ------------------------------ | --------- | ------------- | -------- | ------- | ----- | ------------------------- |
| [Leemann 1993](#references)  | iv        | 20 mg s.d.    | European | m       | 3 PM  | +/- QUI, 50 mg s.d. po    |
| [Leemann 1993](#references)  | iv        | 20 mg s.d.    | European | m       | 4 NM  | +/- QUI, 50 mg s.d. po    |
| [Leemann 1993](#references)  | iv        | 20 mg s.d.    | European | m       | 3 PM  | +/- QUI, 250 mg b.i.d. po |
| [Leemann 1993](#references)  | iv        | 20 mg s.d.    | European | m       | 4 NM  | +/- QUI, 250 mg b.i.d. po |
| [Johnson 1996](#references)  | po        | 200 mg s.d.   | American | m       | 10    | +/- QUI, 100 mg q.d. po   |
| [Johnson 1996](#references)  | po        | 200 mg s.d.   | American | m       | 10    | +/- QUI, 100 mg q.d. po   |

**Table 16:**<a name="table-16"></a> b.i.d.: twice daily, iv: intravenous, m: male, N: number of study participants, NM: CYP2D6 normal metabolizer, PM: CYP2D6 poor metabolizer, po: oral, pop.: population used in simulations, q.d.: once daily, QUI: quinidine, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 4.1.7 Quinidine - Mexiletine DDGI<a id="quinidine-mexiletine-ddgi"></a>

The quinidine-mexiletine interaction was evaluated using clinical DDGI studies listed in [Table 18](#table-18).

| **Source**                     | **Route** | **Schedule** | **Pop.** | **Sex** | **N** | **Perpetrator**         |
| ------------------------------ | --------- | ------------ | -------- | ------- | ----- | ----------------------- |
| [Abolfathi 1993](#references)| po        | 200 mg s.d.  | American | m       | 4 PM  | +/- QUI, 50 mg q.i.d. po|
| [Abolfathi 1993](#references)| po        | 200 mg s.d.  | American | m       | 10 NM | +/- QUI, 50 mg q.i.d. po|

**Table 18:**<a name="table-18"></a> m: male, N: number of study participants, NM: CYP2D6 normal metabolizer, PM: CYP2D6 poor metabolizer, po: oral, pop.: population used in simulations, q.i.d.: four times daily, QUI: quinidine, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

## 4.2 DDGI Concentration-Time Profiles<a id="ddgi-concentration-time-profiles"></a>

The following section shows concentration-time profiles of the victim drugs of the simulated DD(G)I studies in comparison to observed data.

### 4.2.1 Paroxetine - Atomoxetine DDGI<a id="paroxetine-atomoxetine-ddgi-timeprofile"></a>

<a id="figure-4-6"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/072_section_paroxetine-atomoxetine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Atomoxetine_DDGI_17.png)

**Figure 4-6: Paroxetine - Atomoxetine DDGI**

<br>
<br>

<a id="figure-4-7"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/072_section_paroxetine-atomoxetine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Atomoxetine_DDGI_18.png)

**Figure 4-7: Paroxetine - Atomoxetine DDGI**

<br>
<br>

<a id="figure-4-8"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/072_section_paroxetine-atomoxetine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Atomoxetine_DDGI_19.png)

**Figure 4-8: Paroxetine - Atomoxetine DDGI**

<br>
<br>

<a id="figure-4-9"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/072_section_paroxetine-atomoxetine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Atomoxetine_DDI_20.png)

**Figure 4-9: Paroxetine - Atomoxetine DDI**

<br>
<br>

<a id="figure-4-10"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/072_section_paroxetine-atomoxetine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Atomoxetine_DDI_21.png)

**Figure 4-10: Paroxetine - Atomoxetine DDI**

<br>
<br>

### 4.2.2 Clarithromycin - Clomiphene DDGI<a id="clarithromycin-clomiphene-ddgi-timeprofile"></a>

<a id="figure-4-11"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_22.png)

**Figure 4-11: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-12"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_23.png)

**Figure 4-12: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-13"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_24.png)

**Figure 4-13: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-14"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_25.png)

**Figure 4-14: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-15"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_26.png)

**Figure 4-15: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-16"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_27.png)

**Figure 4-16: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-17"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_28.png)

**Figure 4-17: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-18"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_29.png)

**Figure 4-18: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-19"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_30.png)

**Figure 4-19: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-20"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_31.png)

**Figure 4-20: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-21"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_32.png)

**Figure 4-21: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-22"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_33.png)

**Figure 4-22: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-23"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_34.png)

**Figure 4-23: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-24"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_35.png)

**Figure 4-24: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-25"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_36.png)

**Figure 4-25: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-26"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_37.png)

**Figure 4-26: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-27"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_38.png)

**Figure 4-27: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-28"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_39.png)

**Figure 4-28: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-29"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_40.png)

**Figure 4-29: Clarithromycin - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-30"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/073_section_clarithromycin-clomiphene-ddgi-timeprofile/comparison_time_profile_Clarithromycin___Clomiphene_DDGI_41.png)

**Figure 4-30: Clarithromycin - Clomiphene DDGI**

<br>
<br>

### 4.2.3 Paroxetine - Clomiphene DDGI<a id="paroxetine-clomiphene-ddgi-timeprofile"></a>

<a id="figure-4-31"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_42.png)

**Figure 4-31: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-32"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_43.png)

**Figure 4-32: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-33"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_44.png)

**Figure 4-33: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-34"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_45.png)

**Figure 4-34: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-35"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_46.png)

**Figure 4-35: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-36"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_47.png)

**Figure 4-36: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-37"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_48.png)

**Figure 4-37: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-38"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_49.png)

**Figure 4-38: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-39"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_50.png)

**Figure 4-39: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-40"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_51.png)

**Figure 4-40: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-41"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_52.png)

**Figure 4-41: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-42"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_53.png)

**Figure 4-42: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-43"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_54.png)

**Figure 4-43: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-44"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_55.png)

**Figure 4-44: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-45"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_56.png)

**Figure 4-45: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-46"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_57.png)

**Figure 4-46: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-47"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_58.png)

**Figure 4-47: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-48"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_59.png)

**Figure 4-48: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-49"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_60.png)

**Figure 4-49: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-4-50"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/074_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_61.png)

**Figure 4-50: Paroxetine - Clomiphene DDGI**

<br>
<br>

### 4.2.4 Paroxetine - Desipramine DDGI<a id="paroxetine-desipramine-ddgi-timeprofile"></a>

<a id="figure-4-51"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/075_section_paroxetine-desipramine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Desipramine_DDI_63.png)

**Figure 4-51: Paroxetine - Desipramine DDI**

<br>
<br>

<a id="figure-4-52"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/075_section_paroxetine-desipramine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Desipramine_DDGI_64.png)

**Figure 4-52: Paroxetine - Desipramine DDGI**

<br>
<br>

<a id="figure-4-53"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/075_section_paroxetine-desipramine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Desipramine_DDGI_65.png)

**Figure 4-53: Paroxetine - Desipramine DDGI**

<br>
<br>

<a id="figure-4-54"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/075_section_paroxetine-desipramine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Desipramine_DDGI_66.png)

**Figure 4-54: Paroxetine - Desipramine DDGI**

<br>
<br>

<a id="figure-4-55"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/075_section_paroxetine-desipramine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Desipramine_DDI_67.png)

**Figure 4-55: Paroxetine - Desipramine DDI**

<br>
<br>

### 4.2.5 Paroxetine - Dextromethorphan DDGI<a id="paroxetine-dextromethorphan-ddgi-timeprofile"></a>

<a id="figure-4-56"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/076_section_paroxetine-dextromethorphan-ddgi-timeprofile/comparison_time_profile_Paroxetine___Dextromethorphan_DDGI_69.png)

**Figure 4-56: Paroxetine - Dextromethorphan DDGI**

<br>
<br>

<a id="figure-4-57"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/076_section_paroxetine-dextromethorphan-ddgi-timeprofile/comparison_time_profile_Paroxetine___Dextromethorphan_DDGI_70.png)

**Figure 4-57: Paroxetine - Dextromethorphan DDGI**

<br>
<br>

<a id="figure-4-58"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/076_section_paroxetine-dextromethorphan-ddgi-timeprofile/comparison_time_profile_Paroxetine___Dextromethorphan_DDI_71.png)

**Figure 4-58: Paroxetine - Dextromethorphan DDI**

<br>
<br>

### 4.2.6 Quinidine - Metoprolol DDGI<a id="quinidine-metoprolol-ddgi-timeprofile"></a>

<a id="figure-4-59"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/077_section_quinidine-metoprolol-ddgi-timeprofile/comparison_time_profile_Quinidine___Metoprolol_DDGI_82.png)

**Figure 4-59: Quinidine - Metoprolol DDGI**

<br>
<br>

<a id="figure-4-60"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/077_section_quinidine-metoprolol-ddgi-timeprofile/comparison_time_profile_Quinidine___Metoprolol_DDGI_83.png)

**Figure 4-60: Quinidine - Metoprolol DDGI**

<br>
<br>

<a id="figure-4-61"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/077_section_quinidine-metoprolol-ddgi-timeprofile/comparison_time_profile_Quinidine___Metoprolol_DDGI_84.png)

**Figure 4-61: Quinidine - Metoprolol DDGI**

<br>
<br>

<a id="figure-4-62"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/077_section_quinidine-metoprolol-ddgi-timeprofile/comparison_time_profile_Quinidine___Metoprolol_DDGI_85.png)

**Figure 4-62: Quinidine - Metoprolol DDGI**

<br>
<br>

<a id="figure-4-63"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/077_section_quinidine-metoprolol-ddgi-timeprofile/comparison_time_profile_Quinidine___Metoprolol_DDI_86.png)

**Figure 4-63: Quinidine - Metoprolol DDI**

<br>
<br>

<a id="figure-4-64"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/077_section_quinidine-metoprolol-ddgi-timeprofile/comparison_time_profile_Quinidine___Metoprolol_DDGI_87.png)

**Figure 4-64: Quinidine - Metoprolol DDGI**

<br>
<br>

### 4.2.7 Quinidine - Mexiletine DDGI<a id="quinidine-mexiletine-ddgi-timeprofile"></a>

<a id="figure-4-65"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/078_section_quinidine-mexiletine-ddgi-timeprofile/comparison_time_profile_Quinidine___Mexiletine_DDGI_4.png)

**Figure 4-65: Quinidine - Mexiletine DDGI**

<br>
<br>

<a id="figure-4-66"></a>

![](images/062_section_ddgi-evaluations/071_section_ddgi-concentration-time-profiles/078_section_quinidine-mexiletine-ddgi-timeprofile/comparison_time_profile_Quinidine___Mexiletine_DDGI_5.png)

**Figure 4-66: Quinidine - Mexiletine DDGI**

<br>
<br>

# 5 Conclusion<a id="conclusion"></a>

The CYP2D6 DDGI network was qualified against clinical DD(G)I data for AUC and Cmax ratios across the selected perpetrator and victim combinations. In the current qualification run, the aggregate GMFE was 1.40 for AUC ratios and 1.38 for Cmax ratios. Most predictions were within two-fold of the observed values, with 86.32% of AUC ratios and 87.07% of Cmax ratios meeting this criterion.

The stricter limits proposed by Guest et al. were met by 57.26% of AUC ratios and 55.17% of Cmax ratios. The network therefore supports the intended use of the OSP Suite for CYP2D6-mediated DDI and DDGI simulations within the evaluated scenarios, while the remaining deviations indicate that model performance should be interpreted together with the underlying interaction mechanism, genotype group, victim drug, perpetrator drug, and analyte.

This qualification does not replace compound-specific model evaluation. New use cases should remain within the mechanistic and clinical-data domain covered by the qualified network or should be supported by additional verification.

# 6 References<a id="references"></a>

**Abolfathi 1993** Z. Abolfathi, C. Fiset, M. Gilbert, K. Moerike, P. M. Belanger, and J. Turgeon. Role of polymorphic debrisoquin 4-hydroxylase activity in the stereoselective disposition of mexiletine in humans. Journal of Pharmacology and Experimental Therapeutics, 266(3):1196–1201, 1993.

**Aldermann 1997** J. Alderman, S. H. Preskorn, D. J. Greenblatt, W. Harrison, D. Penenberg, J. Allison, and M. Chung. Desipramine pharmacokinetics when coadministered with paroxetine or sertraline in extensive metabolizers. Journal of clinical psychopharmacology, 17(4):284–91, 1997. doi: 10.1097/00004714-199708000-00008.

**Andreasen 2007** A. H. Andreasen, K. Brøsen, and P. Damkier. A comparative pharmacokinetic study in healthy volunteers of the effect of carbamazepine and oxcarbazepine on CYP3A4. Epilepsia, 48(3):490–496, 2007. doi: 10.1111/j.1528-1167.2007.00924.x.

**Belle 2002** D. J. Belle, C. S. Ernest, J.-M. Sauer, B. P. Smith, H. R. Thomasson, and J. W. Witcher. Effect of potent CYP2D6 inhibition by paroxetine on atomoxetine pharmacokinetics. Journal of clinical pharmacology, 42(11):1219–27, 2002. doi: 10.1177/009127002762491307.

**Bennett 1982** P. N. Bennett, V. A. John, and V. B. Whitmarsh. Effect of rifampicin on metoprolol and antipyrine kinetics. British journal of clinical pharmacology, 13(3):387–91, 1982. doi: 10.1111/j.1365-2125.1982.tb01390.x.

**Brøsen 1989** K. Brøsen and L. F. Gram. Quinidine inhibits the 2-hydroxylation of imipramine and desipramine but not the demethylation of imipramine. European Journal of Clinical Pharmacology, 37(2):155–160, 1989. doi: 10.1007/BF00558224.

**Brøsen 1993** K. Brøsen, J. G. Hansen, K. K. Nielsen, S. H. Sindrup, and L. F. Gram. Inhibition by paroxetine of desipramine metabolism in extensive but not in poor metabolizers of sparteine. European journal of clinical pharmacology, 44 (4):349–55, 1993. doi: 10.1007/BF00316471.

**Calvo 2004** G. Calvo, C. García-Gea, A. Luque, A. Morte, R. Dal-Ré, and M. Barbanoj. Lack of pharmacologic interaction between paroxetine and alprazolam at steady state in healthy volunteers. Journal of clinical psychopharmacology, 24(3):268–76, 2004. doi: 10.1097/01.jcp.0000125689.05091.c6.

**Capon 1996** D. A. Capon, F. Bochner, N. Kerry, G. Mikus, C. Danz, and A. A. Somogyi. The influence of CYP2D6 polymorphism and quinidine on the disposition and antitussive effect of dextromethorphan in humans. Clinical Pharmacology and Therapeutics, 60(3):295–307, 1996. doi: 10.1016/S0009-9236(96)90056-9.

**Chellingworth 1988** M. C. Chellingsworth, S. Laugher, S. Akhlaghi, D. B. Jack, and M. J. Kendall. The effects of ranitidine and cimetidine on the pharmacokinetics and pharmacodynamics of metoprolol. Alimentary pharmacology & therapeutics, 2(6):521–7, 1988. doi: 10.1111/j.1365-2036.1988.tb00726.x.

**Ching 1991** M. S. Ching, S. L. Elliott, C. K. Stead, R. T. Murdoch, S. Devenish-Meares, D. J. Morgan, and R. A. Smallwood. Quinidine single dose pharmacokinetics and pharmacodynamics are unaltered by omeprazole. Alimentary pharmacology & therapeutics, 5(5):523–31, 1991. doi: 10.1111/j.1365-2036.1991.tb00521.x.

**Damkier 1999** P. Damkier, L. L. Hansen, and K. Brøsen. Rifampicin treatment greatly increases the apparent oral clearance of quinidine. Pharmacology and Toxicology, 85(6):257–262, 1999. doi: 10.1111/j.1600-0773.1999.tb02019.x.

**Damkier 1999a** P. Damkier, L. L. Hansen, and K. Brøsen. Effect of fluvoxamine on the pharmacokinetics of quinidine. European Journal of Clinical Pharmacology, 55(6):451–456, 1999. doi: 10.1007/s002280050655.

**Damkier 1999b** P. Damkier, L. L. Hansen, and K. Brøsen. Effect of diclofenac, disulfiram, itraconazole, grapefruit juice and erythromycin on the pharmacokinetics of quinidine. British Journal of Clinical Pharmacology, 48(6):829–838, 1999. doi: 10.1046/j.1365-2125.1999.00099.x.

**Edwards 1987** D. J. Edwards, R. Lavoie, H. Beckman, R. Blevins, and M. Rubenfire. The effect of coadministration of verapamil on the pharmacokinetics and metabolism of quinidine. Clinical Pharmacology and Therapeutics, 41(1):68–73, 1987. doi: 10.1038/clpt.1987.11.

**Guest 2011** Guest EJ, Aarons L, Houston JB, Rostami-Hodjegan A, Galetin A. Critique of the two-fold measure of prediction success for ratios: application for the assessment of drug-drug interactions. Drug Metab Dispos. 2011 Feb;39(2):170-3.

**Hardy 1988** B. G. Hardy and J. J. Schentag. Lack of effect of cimetidine on the metabolism of quinidine: effect on renal clearance. International journal of clinical pharmacology, therapy, and toxicology, 26(8):388-391, 1988.

**Hemeryck 2000** A. Hemeryck, R. A. Lefebvre, C. De Vriendt, and F. M. Belpaire. Paroxetine affects metoprolol pharmacokinetics and pharmacodynamics in healthy volunteers. Clinical pharmacology and therapeutics, 67(3):283–91, 2000. doi: 10.1067/mcp.2000.104788.

**Johnson 1996** J. A. Johnson and B. S. Burlew. Metoprolol metabolism via cytochrome P4502D6 in ethnic populations. Drug metabolism and disposition: the biological fate of chemicals, 24(3):350–5, 1996.

**Jung 2020** E. H. Jung, Y. J. Lee, D.-H. Kim, P. Kang, C. W. Lim, C.-K. Cho, C.-G. Jang, S.-Y. Lee, and J.-W. Bae. Effects of paroxetine on the pharmacokinetics of atomoxetine and its metabolites in different CYP2D6 genotypes. Archives of pharmacal research, 43(12):1356–1363, 2020. doi: 10.1007/s12272-020-01300-8.

**Kaukonen 1997** K. M. Kaukonen, K. T. Olkkola, and P. J. Neuvonen. Itraconazole increases plasma concentrations of quinidine. Clinical pharmacology and therapeutics, 62(5):510–7, 1997. doi: 10.1016/S0009-9236(97)90046-1.

**Kim 2008** K.-A. Kim, P.-W. Park, K.-H. Liu, K.-B. Kim, H.-J. Lee, J.-G. Shin, and J.-Y. Park. Effect of rifampin, an inducer of CYP3A and P-glycoprotein, on the pharmacokinetics of risperidone. Journal of clinical pharmacology, 48(1):66–72, 2008. doi: 10.1177/0091270007309888.

**Kirch 1982** W. Kirch, H. Spahn, H. Köhler, E. E. Ohnhaus, and E. Mutschler. Interaction of metoprolol, propranolol and atenolol with concurrent administration of cimetidine. Klinische Wochenschrift, 60(22):1401–7, 1982. doi: 10.1007/BF01716245.

**Kolb 1984** K. W. Kolb, W. R. Garnett, R. E. Small, G. W. Vetrovec, B. J. Kline, and T. Fox. Effect of cimetidine on quinidine clearance. Therapeutic Drug Monitoring, 6(3):306–312, 1984. doi: 10.1097/00007691-198409000-00009.

**Kovar 2022** C. Kovar, L. Kovar, S. Ruedesheim, D. Selzer, B. Ganchev, P. Kroener, S. Igel, R. Kerb, E. Schaeffeler, T. E. Murdter, M. Schwab, and T. Lehr. Prediction of Drug-Drug-Gene Interaction Scenarios of (E)-Clomiphene and Its Metabolites Using Physiologically Based Pharmacokinetic Modeling. Pharmaceutics, 14:2604, 2022. doi: 10.3390/pharmaceutics14122604.

**Leemann 1993** T. D. Leemann, K. P. Devi, and P. Dayer. Similar effect of oxidation deficiency (debrisoquine polymorphism) and quinidine on the apparent volume of distribution of (+/-)-metoprolol. European journal of clinical pharmacology, 45(1):65–71, 1993. doi: 10.1007/BF00315352.

**Mahatthanatrakul 2007** W. Mahatthanatrakul, T. Nontaput, W. Ridtitid, M. Wongnawa, and M. Sunbhanich. Rifampin, a cytochrome P4503A inducer, decreases plasma concentrations of antipsychotic risperidone in healthy volunteers. Journal of clinical pharmacy and therapeutics, 32(2):161–7, 2007. doi: 10.1111/j.1365-2710.2007.00811.x.

**Mahatthanatrakul 2012** W. Mahatthanatrakul, S. Sriwiriyajan, W. Ridtitid, J. Boonleang, M. Wongnawa, N. Rujimamahasan, and W. Pipatrattanaseree. Effect of cytochrome P450 3A4 inhibitor ketoconazole on risperidone pharmacokinetics in healthy volunteers. Journal of clinical pharmacy and therapeutics, 37(2):221–5, 2012. doi: 10.1111/j.1365-2710.2011.01271.x.

**Mürdter 2016** T. Mürdter. Impact of CYP2D6 genotype and co-medication with paroxetine and clarithromycin on clomiphene metabolism in vivo. Abstracts of the 82nd Annual Meeting of the German Society for Experimental and Clinical Pharmacology and Toxicology (DGPT) in Naunyn-Schmiedeberg Archives of Pharmacology, 2016.

**Murdter 2012** T. E. Murdter, R. Kerb, M. Turpeinen, W. Schroth, B. Ganchev, G. M. Boehmer, S. Igel, E. Schaeffeler, U. Zanger, H. Brauch, and M. Schwab. Genetic polymorphism of cytochrome P450 2D6 determines oestrogen receptor activity of the major infertility drug clomiphene via its active metabolites. Human Molecular Genetics, 21:1145-1154, 2012. doi: 10.1093/hmg/ddr543.

**Nakagami 2005** T. Nakagami, N. Yasui-Furukori, M. Saito, T. Tateishi, and S. Kaneo. Effect of verapamil on pharmacokinetics and pharmacodynamics of risperidone: in vivo evidence of involvement of P-glycoprotein in risperidone disposition. Clinical pharmacology and therapeutics, 78(1):43–51, 2005. doi: 10.1016/j.clpt.2005.03.009.

**Nichols 2009** A. I. Nichols, P. Fatato, M. Shenouda, J. Paul, J. A. Isler, R. D. Pedersen, Q. Jiang, S. Ahmed, and A. Patroneva. The effects of desvenlafaxine and paroxetine on the pharmacokinetics of the cytochrome P450 2D6 substrate desipramine in healthy adults. Journal of clinical pharmacology, 49(2):219–28, 2009. doi: 10.1177/0091270008326716.

**Novalbos 2010** J. Novalbos, F. Lopez-Rodriguez, E. Roman, B. Gallego-Sandin, A. Ochoa, J. Abad-Santos. Effects of CYP2D6 genotype on the pharmacokinetics, pharmacodynamics, and safety of risperidone in healthy volunteers. Journal of Clinical Psychopharmacology, 30(5):504-511, 2010. doi: 10.1097/JCP.0b013e3181f0c704.

**Ochs 1981** H. R. Ochs, G. Bodem, and D. J. Greenblatt. Impairment of digoxin clearance by coadministration of quinidine. Journal of clinical pharmacology, 21(10):396–400, 1981. doi: 10.1002/j.1552-4604.1981.tb01739.x.

**Parker 2011** R. B. Parker and J. E. Soberman. Effects of paroxetine on the pharmacokinetics and pharmacodynamics of immediate-release and extended-release metoprolol. Pharmacotherapy, 31(7):630–41, 2011. doi: 10.1592/phco.31.7.630.

**Reese 2008** M. J. Reese, R. M. Wurm, K. T. Muir, G. T. Generaux, L. St John-Williams, and D. J. McConn. An in vitro mechanistic study to elucidate the desipramine/bupropion clinical drug-drug interaction. Drug metabolism and disposition: the biological fate of chemicals, 36(7):1198–201, 2008. doi: 10.1124/dmd.107.020198.

**Ruedesheim 2022** S. Ruedesheim, D. Selzer, T. Murdter, S. Igel, R. Kerb, M. Schwab, and T. Lehr. Physiologically Based Pharmacokinetic Modeling to Describe the CYP2D6 Activity Score-Dependent Metabolism of Paroxetine, Atomoxetine and Risperidone. Pharmaceutics, 14:1734, 2022. doi: 10.3390/pharmaceutics14081734.

**Sauer 2004** J.-M. Sauer, A. J. Long, B. Ring, J. S. Gillespie, N. P. Sanburn, K. A. DeSante, D. Petullo, M. R. VandenBranden, C. B. Jensen, S. A. Wrighton, B. P. Smith, H. A. Read, and J. W. Witcher. Atomoxetine Hydrochloride: Clinical Drug-Drug Interaction Prediction and Outcome. Journal of Pharmacology and Experimental Therapeutics, 308(2):410–418, 2004. doi: 10.1124/jpet.103.058727.

**Schadel 1995** M. Schadel, D. Wu, S. V. Otton, W. Kalow, and E. M. Sellers. Pharmacokinetics of dextromethorphan and metabolites in humans. Journal of Clinical Psychopharmacology, 15(4):263–269, 1995. doi: 10.1097/00004714-199508000-00005.

**Schoedel 2012** K. A. Schoedel, L. E. Pope, and E. M. Sellers. Randomized Open-Label Drug-Drug Interaction Trial of Dextromethorphan/Quinidine and Paroxetine in Healthy Volunteers. Clinical Drug Investigation, 32(3):157–169, 2012. doi: 10.2165/11599870-000000000-00000.

**Steiness 1980** E. Steiness, S. Waldorff, P. B. Hansen, H. Egebald, J. Buch, and H. Egeblad. Reduction of digoxin-induced inotropism during quinidine administration. Clinical Pharmacology and Therapeutics, 27(6):791–795, 1980. doi: 10.1038/clpt.1980.112.

**Storelli 2018** F. Storelli, A. Matthey, S. Lenglet, A. Thomas, J. Desmeules, and Y. Daali. Impact of CYP2D6 Functional Allelic Variations on Phenoconversion and Drug–Drug Interactions. Clinical Pharmacology and Therapeutics, 104(1):148–157, 2018. doi: 10.1002/cpt.889.

**Stout 2011** S. M. Stout, J. Nielsen, L. S. Welage, M. Shea, R. Brook, K. Kerber, and B. E. Bleske. Influence of metoprolol dosage release formulation on the pharmacokinetic drug interaction with paroxetine. Journal of clinical pharmacology, 51(3):389–96, 2011. doi: 10.1177/0091270010365559.

**Todor 2015** I. Todor, A. Popa, M. Neag, D. Muntean, C. Bocsan, A. Buzoianu, L. Vlase, A. M. Gheldiu, R. Chira, and C. Briciu. The influence of paroxetine on the pharmacokinetics of atomoxetine and its main metabolite. Clujul Medical, 88(4): 513–520, 2015. doi: 10.15386/cjmed-488.

**Todor 2016** I. Todor, A. Popa, M. Neag, D. Muntean, C. Bocsan, A. Buzoianu, L. Vlase, A. M. Gheldiu, and C. Briciu. Evaluation of a potential metabolism-mediated drug-drug interaction between atomoxetine and bupropion in healthy volunteers. Journal of Pharmacy and Pharmaceutical Sciences, 19(2):198–207, 2016. doi: 10.18433/J3H03R.

**Todor 2017** I. Todor, A. Popa, M. Neag, D. Muntean, C. Bocsan, A. Buzoianu, L. Vlase, A. M. Gheldiu, and C. Briciu. Evaluation of the potential pharmacokinetic interaction between atomoxetine and fluvoxamine in healthy volunteers. Pharmacology, 99(1-2):84–88, 2017. doi: 10.1159/000452223.

**Toon 1988** S. Toon, E. M. Davidson, F. M. Garstang, H. Batra, R. J. Bowes, and M. Rowland. The racemic metoprolol H2-antagonist interaction. Clinical pharmacology and therapeutics, 43(3):283–9, 1988. doi: 10.1038/clpt.1988.34.

**Yasui-Furukori 2007** N. Yasui-Furukori, M. Saito, T. Niioka, Y. Inoue, Y. Sato, and S. Kaneko. Effect of itraconazole on pharmacokinetics of paroxetine: the role of gut transporters. Therapeutic drug monitoring, 29(1):45–8, 2007. doi: 10.1097/FTD.0b013e31802bb20d.

# 7 Appendix<a id="appendix"></a>

## 7.1 Open Systems Pharmacology Suite (OSPS) Introduction<a id="osp-introduction"></a>

The Open Systems Pharmacology Suite provides a software environment for whole-body physiologically based pharmacokinetic modeling and simulation. The suite includes PK-Sim for model building and population simulation, MoBi for detailed model extension, and supporting R packages for qualification and reporting workflows.

Models are composed of physiological system information, compound-specific parameters, formulations, administration protocols, and observed data. Simulations can be combined with observed clinical data to evaluate whether model predictions are adequate for a defined context of use.

The qualification workflow uses versioned model snapshots and a machine-readable qualification plan to support reproducibility. The report generated from the plan documents the simulations, observed data comparisons, and summary performance metrics used to evaluate the intended use.

## 7.2 Mathematical Implementation of Drug-Drug Interactions<a id="mathematical-implementation-of-ddi"></a>

Drug-drug interaction simulations in the OSP Suite are represented through mechanistic changes in drug disposition processes. Depending on the compound and interaction scenario, these processes can include reversible enzyme inhibition, time-dependent inactivation, induction, transporter inhibition, transporter induction, or changes in multiple pathways.

For CYP2D6 DDGI scenarios, genotype-dependent activity is represented through phenotype-specific or activity-score-specific model settings where supported by the source model. The resulting simulations compare the victim-drug exposure with and without the perpetrator under the clinical dosing schedule. AUC and Cmax ratios are then calculated from matched control and interaction simulations.

The qualification plots compare predicted and observed exposure ratios. Performance is summarized using predicted versus observed plots, predicted/observed residual plots, geometric mean fold error, two-fold limits, and the limits proposed for ratio endpoints by Guest et al.

## 7.3 Automatic (re)-qualification workflow<a id="automatic-requalification-workflow"></a>

The requalification workflow is driven by the qualification plan. The plan defines the model snapshots, simulations, observed datasets, output paths, comparison windows, figures, tables, and report sections.

The workflow loads the referenced model snapshots, runs the required simulations, calculates exposure ratios and concentration-time profile comparisons, and writes a report-ready output folder. The generated report should be reviewed for scientific consistency, expected model versions, complete figures, correct study metadata, and warnings from the simulation or reporting logs.

Before publication, the final report should be regenerated from a clean environment using the intended OSP Suite and qualification framework versions. The output should be checked against the committed qualification plan and the exact model snapshot releases used for qualification.

# 8 Glossary<a id="glossary"></a>

| ALP     | alprazolam                                                      |
| AS      | CYP2D6 activity score                                           |
| ATO     | atomoxetine                                                     |
| AUC     | area under the plasma concentration-time curve                  |
| AUClast | AUC calculated between first and last concentration measurement |
| AUCR    | AUC ratio                                                       |
| b.i.d.  | twice daily                                                     |
| BUP     | bupropion                                                       |
| CBZ     | carbamazepine                                                   |
| CIM     | cimetidine                                                      |
| CLA     | clarithromycin                                                  |
| CLO     | (E)-clomiphene                                                  |
| Cmax    | maximum plasma concentration                                    |
| CmaxR   | Cmax ratio                                                      |
| CYP     | cytochrome P450                                                 |
| DDI     | drug-drug interaction                                           |
| DDGI    | Drug-drug-gene interaction                                      |
| DGI     | drug-gene interaction                                           |
| DES     | desipramine                                                     |
| DEX     | dextromethorphan                                                |
| DIG     | digoxin                                                         |
| DTT     | total dextrorphan                                               |
| DXG     | dextrorphan-O-glucuronide                                       |
| DXT     | dextrorphan                                                     |
| ERY     | erythromycin                                                    |
| FLV     | fluvoxamine                                                     |
| HDC     | (E)-4-hydroxy-N-desethylclomiphene                              |
| IM      | CYP2D6 intermediate metabolizer                                 |
| ITR     | itraconazole                                                    |
| iv      | intravenous                                                     |
| KET     | ketoconazole                                                    |
| MET     | metoprolol                                                      |
| MEX     | mexiletine                                                      |
| MID     | midazolam                                                       |
| N       | number of study participants                                    |
| NDC     | (E)-N-desethylclomiphene                                        |
| NM      | CYP2D6 normal metabolizer                                       |
| OHC     | (E)-4-hydroxyclomiphene                                         |
| OHD     | 2-hydroxydesipramine                                            |
| OHQ     | 3-hydroxyquinidine                                              |
| OHR     | 9-hydroxyrisperidone                                            |
| OME     | omeprazole                                                      |
| OSP     | Open Systems Pharmacology                                       |
| PAR     | paroxetine                                                      |
| PBPK    | physiologically based pharmacokinetic                           |
| P-gp    | P-glycoprotein                                                  |
| PM      | CYP2D6 poor metabolizer                                         |
| po      | oral                                                            |
| q.d.    | once daily                                                      |
| q.i.d.  | four times daily                                                |
| QUI     | quinidine                                                       |
| RIF     | rifampicin                                                      |
| RIS     | risperidone                                                     |
| RME     | (R)-metoprolol                                                  |
| s.d.    | single dose                                                     |
| SME     | (S)-metoprolol                                                  |
| t.i.d.  | three times daily                                               |
| VER     | verapamil                                                       |

