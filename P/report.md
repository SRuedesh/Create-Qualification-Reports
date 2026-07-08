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
     * [2.1.2 Paroxetine - Metoprolol DDI](#paroxetine-metoprolol-ddi)
     * [2.1.3 Itraconazole - Paroxetine DDI](#itraconazole-paroxetine-ddi)
     * [2.1.4 Quinidine - Paroxetine DDI](#quinidine-paroxetine-ddi)
   * [2.2 DDI Concentration-Time Profiles](#ddi-concentration-time-profiles)
     * [2.2.1 Paroxetine - Alprazolam DDI](#paroxetine-alprazolam-ddi-timeprofile)
     * [2.2.2 Paroxetine - Metoprolol DDI](#paroxetine-metoprolol-ddi-timeprofile)
     * [2.2.3 Itraconazole - Paroxetine DDI](#itraconazole-paroxetine-ddi-timeprofile)
     * [2.2.4 Quinidine - Paroxetine DDI](#quinidine-paroxetine-ddi-timeprofile)
 * [3 DDGI Evaluations](#ddgi-evaluations)
   * [3.1 DDGI Network Evaluations](#ddgi-network-evaluations)
     * [3.1.1 Paroxetine - Atomoxetine DDGI](#paroxetine-atomoxetine-ddgi)
     * [3.1.2 Paroxetine - Clomiphene DDGI](#paroxetine-clomiphene-ddgi)
     * [3.1.3 Paroxetine - Desipramine DDGI](#paroxetine-desipramine-ddgi)
     * [3.1.4 Paroxetine - Dextromethorphan DDGI](#paroxetine-dextromethorphan-ddgi)
   * [3.2 DDGI Concentration-Time Profiles](#ddgi-concentration-time-profiles)
     * [3.2.1 Paroxetine - Atomoxetine DDGI](#paroxetine-atomoxetine-ddgi-timeprofile)
     * [3.2.2 Paroxetine - Clomiphene DDGI](#paroxetine-clomiphene-ddgi-timeprofile)
     * [3.2.3 Paroxetine - Desipramine DDGI](#paroxetine-desipramine-ddgi-timeprofile)
     * [3.2.4 Paroxetine - Dextromethorphan DDGI](#paroxetine-dextromethorphan-ddgi-timeprofile)
 * [4 Conclusion](#conclusion)
 * [5 References](#references)
 * [6 Appendix](#appendix)
   * [6.1 Open Systems Pharmacology Suite (OSPS) Introduction](#osp-introduction)
   * [6.2 Mathematical Implementation of Drug-Drug Interactions](#mathematical-implementation-of-ddi)
   * [6.3 Automatic (re)-qualification workflow](#automatic-requalification-workflow)
 * [7 Glossary](#glossary)

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

**Figure 2-1: CYP2D6 DDIs (paroxetine).  Predicted vs. Observed AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-2-2"></a>

![](images/003_section_ddi-evaluations/DDIRatio_1_ddi_ratio_plot_AUC_residualsVsObserved.png)

**Figure 2-2: CYP2D6 DDIs (paroxetine).  Predicted/Observed vs. Observed AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-2-3"></a>

![](images/003_section_ddi-evaluations/DDIRatio_1_ddi_ratio_plot_CMAX_predictedVsObserved.png)

**Figure 2-3: CYP2D6 DDIs (paroxetine).  Predicted vs. Observed CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-2-4"></a>

![](images/003_section_ddi-evaluations/DDIRatio_1_ddi_ratio_plot_CMAX_residualsVsObserved.png)

**Figure 2-4: CYP2D6 DDIs (paroxetine).  Predicted/Observed vs. Observed CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="table-2-1"></a>

**Table 2-1: GMFE for CYP2D6 DDIs (paroxetine) Ratio**

|PK parameter |GMFE |
|:------------|:----|
|AUC          |1.39 |
|CMAX         |1.19 |

<br>
<br>

<a id="table-2-2"></a>

**Table 2-2: Summary table for CYP2D6 DDIs (paroxetine) - AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

|AUC                          |Number |Ratio [%] |
|:----------------------------|:------|:---------|
|Points total                 |13     |-        |
|Points within Guest *et al.* |7      |53.85     |
|Points within 2 fold         |12     |92.31     |

<br>
<br>

<a id="table-2-3"></a>

**Table 2-3: Summary table for CYP2D6 DDIs (paroxetine) - CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

|CMAX                         |Number |Ratio [%] |
|:----------------------------|:------|:---------|
|Points total                 |13     |-        |
|Points within Guest *et al.* |11     |84.62     |
|Points within 2 fold         |13     |100.00    |

<br>
<br>

<a id="table-2-4"></a>

**Table 2-4: Summary table for CYP2D6 DDIs (paroxetine)**

|DataID |Perpetrator                           |Victim           |Predicted AUC Ratio |Observed AUC Ratio |Pred/Obs AUC Ratio |Predicted CMAX Ratio |Observed CMAX Ratio |Pred/Obs CMAX Ratio |Reference           |
|:------|:-------------------------------------|:----------------|:-------------------|:------------------|:------------------|:--------------------|:-------------------|:-------------------|:-------------------|
|16954  |Quinidine, 30 mg, PO, BID             |Paroxetine, PO   |1.93                |1.29               |1.50               |1.04                 |1.14                |0.92                |Schoedel 2012       |
|16980  |Paroxetine, 20 mg, PO, QD             |Alprazolam, PO   |1.02                |0.94               |1.09               |1.02                 |0.97                |1.05                |Calvo 2004          |
|17116  |Paroxetine, 10.10.2010 mg, PO, QD/BID |Metoprolol, PO   |4.20                |4.33               |0.97               |2.07                 |2.51                |0.83                |Stout 2011          |
|17118  |Paroxetine, 10.10.2010 mg, PO, QD/BID |Metoprolol, PO   |6.28                |3.62               |1.73               |2.84                 |3.65                |0.78                |Stout 2011          |
|17120  |Paroxetine, 20 mg, PO, QD             |R-Metoprolol, PO |3.70                |2.96               |1.25               |3.18                 |2.74                |1.16                |Parker 2011         |
|17122  |Paroxetine, 20 mg, PO, QD             |S-Metoprolol, PO |3.59                |2.91               |1.23               |3.11                 |2.64                |1.18                |Parker 2011         |
|17124  |Paroxetine, 20 mg, PO, QD             |R-Metoprolol, PO |3.92                |3.06               |1.28               |2.69                 |2.11                |1.27                |Parker 2011         |
|17126  |Paroxetine, 20 mg, PO, QD             |S-Metoprolol, PO |3.87                |2.50               |1.55               |2.66                 |1.87                |1.42                |Parker 2011         |
|17128  |Paroxetine, 20 mg, PO, QD             |R-Metoprolol, PO |3.65                |4.06               |0.90               |3.13                 |3.74                |0.84                |Parker 2011         |
|17130  |Paroxetine, 20 mg, PO, QD             |S-Metoprolol, PO |3.54                |3.09               |1.14               |3.06                 |2.88                |1.06                |Parker 2011         |
|17132  |Paroxetine, 10 mg, PO, BID            |R-Metoprolol, PO |4.22                |9.88               |0.43               |2.30                 |2.55                |0.90                |Hemeryck 2000       |
|17134  |Paroxetine, 10 mg, PO, BID            |S-Metoprolol, PO |3.77                |7.01               |0.54               |2.04                 |1.71                |1.19                |Hemeryck 2000       |
|17158  |Paroxetine, 100 mg, PO, BID           |Paroxetine, PO   |1.17                |1.65               |0.71               |1.03                 |1.40                |0.74                |Yasui-Furukori 2007 |

<br>
<br>

## 2.1 DDI Network Evaluations<a id="ddi-network-evaluations"></a>

**Figure 1** shows the developed CYP2D6 DDGI network of interacting perpetrator and victim drugs. (a) Schematic illustration of the modeled interactions of CYP2D6 perpetrator and victim drugs. Black arrows indicate metabolism or transport, green arrows indicate induction, red solid lines indicate competitive inhibition, red dashed lines down-regulation (bupropion), noncompetitive inhibition (verapamil P-gp inhibition) or mechanism-based inactivation (others). (b-c) Drug-drug-(gene) interaction matrix for modeled interactions mediated by (a) CYP2D6 and (b) CYP3A4 and P-gp. Colors indicate categories according to the FDA’s Examples of Drugs that Interact with CYP Enzymes and Transporter Systems.42 Height of the grey ribbons indicates the number of clinical studies for the respective interaction covered by the network, numbers in brackets indicate the number of clinical interaction studies for the corresponding compound. CYP: cytochrome P450, P-gp: P-glycoprotein.

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

### 2.1.2 Paroxetine - Metoprolol DDI<a id="paroxetine-metoprolol-ddi"></a>

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

### 2.1.3 Itraconazole - Paroxetine DDI<a id="itraconazole-paroxetine-ddi"></a>

The itraconazole-paroxetine interaction was evaluated using clinical DDI studies listed in [Table 20](#table-20).

| **Source**                            | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**           |
| ------------------------------------- | --------- | ------------- | -------- | ------- | ----- | ------------------------- |
| [Yasui-Furukori 2007](#references)  | po        | 20 mg s.d.    | Japanese | f       | 13    | +/- ITR, 100 mg b.i.d. po |

**Table 20:**<a name="table-20"></a> b.i.d.: twice daily, f: female, ITR: itraconazole, N: number of study participants, po: oral, pop.: population used in simulations, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 2.1.4 Quinidine - Paroxetine DDI<a id="quinidine-paroxetine-ddi"></a>

The quinidine-paroxetine interaction was evaluated using clinical DDI studies listed in [Table 21](#table-21).

| **Source**                    | **Route** | **Schedule** | **Pop.** | **Sex** | **N** | **Perpetrator**          |
| ----------------------------- | --------- | ------------ | -------- | ------- | ----- | ------------------------ |
| [Schoedel 2012](#references)| po        | 20 mg q.d.   | American | m       | 14 NM | +/- QUI, 30 mg b.i.d. po |

**Table 21:**<a name="table-21"></a> m: male, N: number of study participants, NM: CYP2D6 normal metabolizer, po: oral, pop.: population used in simulations, q.d.: once daily, QUI: quinidine. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

## 2.2 DDI Concentration-Time Profiles<a id="ddi-concentration-time-profiles"></a>

The following section shows concentration-time profiles of the victim drugs of the simulated DD(G)I studies in comparison to observed data.

### 2.2.1 Paroxetine - Alprazolam DDI<a id="paroxetine-alprazolam-ddi-timeprofile"></a>

<a id="figure-2-6"></a>

![](images/003_section_ddi-evaluations/009_section_ddi-concentration-time-profiles/010_section_paroxetine-alprazolam-ddi-timeprofile/comparison_time_profile_Paroxetine___Alprazolam_DDI_2.png)

**Figure 2-6: Paroxetine - Alprazolam DDI**

<br>
<br>

### 2.2.2 Paroxetine - Metoprolol DDI<a id="paroxetine-metoprolol-ddi-timeprofile"></a>

<a id="figure-2-7"></a>

![](images/003_section_ddi-evaluations/009_section_ddi-concentration-time-profiles/011_section_paroxetine-metoprolol-ddi-timeprofile/comparison_time_profile_Paroxetine___Metoprolol_DDI_36.png)

**Figure 2-7: Paroxetine - Metoprolol DDI**

<br>
<br>

<a id="figure-2-8"></a>

![](images/003_section_ddi-evaluations/009_section_ddi-concentration-time-profiles/011_section_paroxetine-metoprolol-ddi-timeprofile/comparison_time_profile_Paroxetine___Metoprolol_DDI_37.png)

**Figure 2-8: Paroxetine - Metoprolol DDI**

<br>
<br>

<a id="figure-2-9"></a>

![](images/003_section_ddi-evaluations/009_section_ddi-concentration-time-profiles/011_section_paroxetine-metoprolol-ddi-timeprofile/comparison_time_profile_Paroxetine___Metoprolol_DDI_38.png)

**Figure 2-9: Paroxetine - Metoprolol DDI**

<br>
<br>

<a id="figure-2-10"></a>

![](images/003_section_ddi-evaluations/009_section_ddi-concentration-time-profiles/011_section_paroxetine-metoprolol-ddi-timeprofile/comparison_time_profile_Paroxetine___Metoprolol_DDI_39.png)

**Figure 2-10: Paroxetine - Metoprolol DDI**

<br>
<br>

<a id="figure-2-11"></a>

![](images/003_section_ddi-evaluations/009_section_ddi-concentration-time-profiles/011_section_paroxetine-metoprolol-ddi-timeprofile/comparison_time_profile_Paroxetine___Metoprolol_DDI_40.png)

**Figure 2-11: Paroxetine - Metoprolol DDI**

<br>
<br>

<a id="figure-2-12"></a>

![](images/003_section_ddi-evaluations/009_section_ddi-concentration-time-profiles/011_section_paroxetine-metoprolol-ddi-timeprofile/comparison_time_profile_Paroxetine___Metoprolol_DDI_41.png)

**Figure 2-12: Paroxetine - Metoprolol DDI**

<br>
<br>

### 2.2.3 Itraconazole - Paroxetine DDI<a id="itraconazole-paroxetine-ddi-timeprofile"></a>

<a id="figure-2-13"></a>

![](images/003_section_ddi-evaluations/009_section_ddi-concentration-time-profiles/012_section_itraconazole-paroxetine-ddi-timeprofile/comparison_time_profile_Itraconazole___Paroxetine_DDI_42.png)

**Figure 2-13: Itraconazole - Paroxetine DDI**

<br>
<br>

### 2.2.4 Quinidine - Paroxetine DDI<a id="quinidine-paroxetine-ddi-timeprofile"></a>

<a id="figure-2-14"></a>

![](images/003_section_ddi-evaluations/009_section_ddi-concentration-time-profiles/013_section_quinidine-paroxetine-ddi-timeprofile/comparison_time_profile_Quinidine___Paroxetine_DDI_1.png)

**Figure 2-14: Quinidine - Paroxetine DDI**

<br>
<br>

# 3 DDGI Evaluations<a id="ddgi-evaluations"></a>

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

<a id="figure-3-1"></a>

![](images/014_section_ddgi-evaluations/DDIRatio_2_ddi_ratio_plot_AUC_predictedVsObserved.png)

**Figure 3-1: CYP2D6 DDGIs (paroxetine).  Predicted vs. Observed AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-3-2"></a>

![](images/014_section_ddgi-evaluations/DDIRatio_2_ddi_ratio_plot_AUC_residualsVsObserved.png)

**Figure 3-2: CYP2D6 DDGIs (paroxetine).  Predicted/Observed vs. Observed AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-3-3"></a>

![](images/014_section_ddgi-evaluations/DDIRatio_2_ddi_ratio_plot_CMAX_predictedVsObserved.png)

**Figure 3-3: CYP2D6 DDGIs (paroxetine).  Predicted vs. Observed CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="figure-3-4"></a>

![](images/014_section_ddgi-evaluations/DDIRatio_2_ddi_ratio_plot_CMAX_residualsVsObserved.png)

**Figure 3-4: CYP2D6 DDGIs (paroxetine).  Predicted/Observed vs. Observed CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

<br>
<br>

<a id="table-3-1"></a>

**Table 3-1: GMFE for CYP2D6 DDGIs (paroxetine) Ratio**

|PK parameter |GMFE |
|:------------|:----|
|AUC          |1.60 |
|CMAX         |1.55 |

<br>
<br>

<a id="table-3-2"></a>

**Table 3-2: Summary table for CYP2D6 DDGIs (paroxetine) - AUC Ratio. (&delta; = 1 in Guest *et al.* formula)**

|AUC                          |Number |Ratio [%] |
|:----------------------------|:------|:---------|
|Points total                 |38     |-        |
|Points within Guest *et al.* |17     |44.74     |
|Points within 2 fold         |28     |73.68     |

<br>
<br>

<a id="table-3-3"></a>

**Table 3-3: Summary table for CYP2D6 DDGIs (paroxetine) - CMAX Ratio. (&delta; = 1 in Guest *et al.* formula)**

|CMAX                         |Number |Ratio [%] |
|:----------------------------|:------|:---------|
|Points total                 |38     |-        |
|Points within Guest *et al.* |21     |55.26     |
|Points within 2 fold         |29     |76.32     |

<br>
<br>

<a id="table-3-4"></a>

**Table 3-4: Summary table for CYP2D6 DDGIs (paroxetine)**

|DataID |Perpetrator                      |Victim                                 |Predicted AUC Ratio |Observed AUC Ratio |Pred/Obs AUC Ratio |Predicted CMAX Ratio |Observed CMAX Ratio |Pred/Obs CMAX Ratio |Reference      |
|:------|:--------------------------------|:--------------------------------------|:-------------------|:------------------|:------------------|:--------------------|:-------------------|:-------------------|:--------------|
|16988  |Paroxetine, 20 mg, PO, QD        |Atomoxetine, PO                        |1.78                |2.80               |0.64               |1.15                 |1.28                |0.90                |Jung 2020      |
|16990  |Paroxetine, 20 mg, PO, QD        |Atomoxetine, PO                        |3.62                |4.70               |0.77               |1.49                 |1.71                |0.87                |Jung 2020      |
|16992  |Paroxetine, 20 mg, PO, QD        |Atomoxetine, PO                        |5.76                |10.57              |0.54               |1.78                 |2.21                |0.81                |Jung 2020      |
|16994  |Paroxetine, 20/20 mg, PO, BID/QD |Atomoxetine, PO                        |3.90                |5.73               |0.68               |1.34                 |1.73                |0.77                |Todor 2015     |
|16996  |Paroxetine, 20 mg, PO, QD        |Atomoxetine, PO                        |5.34                |13.87              |0.38               |2.59                 |3.70                |0.70                |Belle 2002     |
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

<br>
<br>

## 3.1 DDGI Network Evaluations<a id="ddgi-network-evaluations"></a>

**Figure 1** shows the developed CYP2D6 DDGI network of interacting perpetrator and victim drugs. (a) Schematic illustration of the modeled interactions of CYP2D6 perpetrator and victim drugs. Black arrows indicate metabolism or transport, green arrows indicate induction, red solid lines indicate competitive inhibition, red dashed lines down-regulation (bupropion), noncompetitive inhibition (verapamil P-gp inhibition) or mechanism-based inactivation (others). (b-c) Drug-drug-(gene) interaction matrix for modeled interactions mediated by (a) CYP2D6 and (b) CYP3A4 and P-gp. Colors indicate categories according to the FDA’s Examples of Drugs that Interact with CYP Enzymes and Transporter Systems.42 Height of the grey ribbons indicates the number of clinical studies for the respective interaction covered by the network, numbers in brackets indicate the number of clinical interaction studies for the corresponding compound. CYP: cytochrome P450, P-gp: P-glycoprotein.

**Figure** **1: CYP2D6 DDGI modeling network**
<a id="figure-3-5"></a>

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

### 3.1.1 Paroxetine - Atomoxetine DDGI<a id="paroxetine-atomoxetine-ddgi"></a>

The paroxetine-atomoxetine interaction was evaluated using clinical DDGI studies listed in [Table 4](#table-4).

| **Source**                    | **Route** | **Schedule**  | **Pop.** | **Sex** | **N**    | **Perpetrator**               |
| ----------------------------- | --------- | ------------- | -------- | ------- | -------- | ----------------------------- |
| [Jung 2020](#references)    | po        | 20 mg s.d.    | Asian    | m       | 7 AS0    | +/- PAR, 20 mg q.d. po        |
| [Jung 2020](#references)    | po        | 20 mg s.d.    | Asian    | m       | 9 AS1.25 | +/- PAR, 20 mg q.d. po        |
| [Jung 2020](#references)    | po        | 20 mg s.d.    | Asian    | m       | 10 AS2   | +/- PAR, 20 mg q.d. po        |
| [Todor 2015](#references)   | po        | 25 mg s.d.    | European | m       | 22       | +/- PAR, 20 mg b.i.d./q.d. po |
| [Belle 2002](#references)   | po        | 20 mg b.i.d.  | American | m       | 22       | +/- PAR, 20 mg q.d. po        |

**Table 4:**<a name="table-4"></a> AS: CYP2D6 activity score, b.i.d.: twice daily, m: male, N: number of study participants, PAR: paroxetine, po: oral, pop.: population used in simulations, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 3.1.2 Paroxetine - Clomiphene DDGI<a id="paroxetine-clomiphene-ddgi"></a>

The paroxetine-clomiphene interaction was evaluated using clinical DDGI studies listed in [Table 6](#table-6).

| **Source**                    | **Route** | **Schedule**  | **Pop.** | **Sex** | **N**   | **Perpetrator**         |
| ----------------------------- | --------- | ------------- | -------- | ------- | ------- | ----------------------- |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 4 AS0   | +/- PAR, 40 mg q.d. po  |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 4 AS0.5 | +/- PAR, 40 mg q.d. po  |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 2 AS1   | +/- PAR, 40 mg q.d. po  |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 2 AS2   | +/- PAR, 40 mg q.d. po  |
| [Mürdter 2016](#references) | po        | 42 mg s.d.    | European | f       | 2 AS3   | +/- PAR, 40 mg q.d. po  |

**Table 6:**<a name="table-6"></a> AS: CYP2D6 activity score, b.i.d.: twice daily, f: female, N: number of study participants, PAR: paroxetine, po: oral, pop.: population used in simulations, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 3.1.3 Paroxetine - Desipramine DDGI<a id="paroxetine-desipramine-ddgi"></a>

The paroxetine-desipramine interaction was evaluated using clinical DDGI studies listed in [Table 9](#table-9).

| **Source**                      | **Route** | **Schedule** | **Pop.** | **Sex** | **N**     | **Perpetrator**           |
| ------------------------------- | --------- | ------------ | -------- | ------- | --------- | ------------------------- |
| [Nichols 2009](#references)   | po        | 50 mg s.d.   | American | m       | 20        | +/- PAR, 20 mg q.d. po    |
| [Brøsen 1993](#references)    | po        | 100 mg s.d.  | European | m       | 8 PM      | +/- PAR, 20 mg q.d. po    |
| [Brøsen 1993](#references)    | po        | 100 mg s.d.  | European | m       | 5 NM      | +/- PAR, 20 mg q.d. po    |
| [Brøsen 1993](#references)    | po        | 100 mg s.d.  | European | m       | 4 fast NM | +/- PAR, 20 mg q.d. po    |
| [Aldermann 1997](#references) | po        | 50 mg q.d.   | American | m       | 6         | +/- PAR, 20/30 mg q.d. po |

**Table 9:**<a name="table-9"></a> m: male, N: number of study participants, PAR: paroxetine, NM: CYP2D6 normal metabolizer, PM: CYP2D6 poor metabolizer, po: oral, pop.: population used in simulations, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

### 3.1.4 Paroxetine - Dextromethorphan DDGI<a id="paroxetine-dextromethorphan-ddgi"></a>

The paroxetine-dextromethorphan interaction was evaluated using clinical DDGI studies listed in [Table 11](#table-11).

| **Source**                     | **Route** | **Schedule**  | **Pop.** | **Sex** | **N** | **Perpetrator**          |
| ------------------------------ | --------- | ------------- | -------- | ------- | ----- | ------------------------ |
| [Storelli 2018](#references) | po        |  5 mg s.d.    | European | f       | 16 IM | +/- PAR, 20 mg b.i.d. po |
| [Storelli 2018](#references) | po        |  5 mg s.d.    | European | f       | 17 NM | +/- PAR, 20 mg b.i.d. po |
| [Schoedel 2012](#references) | po        |  30 mg b.i.d. | American | m       | 13    | +/- PAR, 30 mg q.d. po   |

**Table 11:**<a name="table-11"></a> b.i.d.: twice daily, f: female, IM: CYP2D6 intermediate metabolizer, m: male, N: number of study participants, NM: CYP2D6 normal metabolizer, po: oral, pop.: population used in simulations, QUI: quinidine, q.d.: once daily, s.d.: single dose. If perpetrator or victim drugs were applied in form of salts, the respective dose of base was calculated and incorporated in simulations.

## 3.2 DDGI Concentration-Time Profiles<a id="ddgi-concentration-time-profiles"></a>

The following section shows concentration-time profiles of the victim drugs of the simulated DD(G)I studies in comparison to observed data.

### 3.2.1 Paroxetine - Atomoxetine DDGI<a id="paroxetine-atomoxetine-ddgi-timeprofile"></a>

<a id="figure-3-6"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/021_section_paroxetine-atomoxetine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Atomoxetine_DDGI_3.png)

**Figure 3-6: Paroxetine - Atomoxetine DDGI**

<br>
<br>

<a id="figure-3-7"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/021_section_paroxetine-atomoxetine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Atomoxetine_DDGI_4.png)

**Figure 3-7: Paroxetine - Atomoxetine DDGI**

<br>
<br>

<a id="figure-3-8"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/021_section_paroxetine-atomoxetine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Atomoxetine_DDGI_5.png)

**Figure 3-8: Paroxetine - Atomoxetine DDGI**

<br>
<br>

<a id="figure-3-9"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/021_section_paroxetine-atomoxetine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Atomoxetine_DDI_6.png)

**Figure 3-9: Paroxetine - Atomoxetine DDI**

<br>
<br>

<a id="figure-3-10"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/021_section_paroxetine-atomoxetine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Atomoxetine_DDI_7.png)

**Figure 3-10: Paroxetine - Atomoxetine DDI**

<br>
<br>

### 3.2.2 Paroxetine - Clomiphene DDGI<a id="paroxetine-clomiphene-ddgi-timeprofile"></a>

<a id="figure-3-11"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_8.png)

**Figure 3-11: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-12"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_9.png)

**Figure 3-12: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-13"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_10.png)

**Figure 3-13: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-14"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_11.png)

**Figure 3-14: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-15"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_12.png)

**Figure 3-15: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-16"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_13.png)

**Figure 3-16: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-17"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_14.png)

**Figure 3-17: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-18"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_15.png)

**Figure 3-18: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-19"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_16.png)

**Figure 3-19: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-20"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_17.png)

**Figure 3-20: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-21"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_18.png)

**Figure 3-21: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-22"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_19.png)

**Figure 3-22: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-23"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_20.png)

**Figure 3-23: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-24"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_21.png)

**Figure 3-24: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-25"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_22.png)

**Figure 3-25: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-26"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_23.png)

**Figure 3-26: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-27"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_24.png)

**Figure 3-27: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-28"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_25.png)

**Figure 3-28: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-29"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_26.png)

**Figure 3-29: Paroxetine - Clomiphene DDGI**

<br>
<br>

<a id="figure-3-30"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/022_section_paroxetine-clomiphene-ddgi-timeprofile/comparison_time_profile_Paroxetine___Clomiphene_DDGI_27.png)

**Figure 3-30: Paroxetine - Clomiphene DDGI**

<br>
<br>

### 3.2.3 Paroxetine - Desipramine DDGI<a id="paroxetine-desipramine-ddgi-timeprofile"></a>

<a id="figure-3-31"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/023_section_paroxetine-desipramine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Desipramine_DDI_28.png)

**Figure 3-31: Paroxetine - Desipramine DDI**

<br>
<br>

<a id="figure-3-32"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/023_section_paroxetine-desipramine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Desipramine_DDGI_29.png)

**Figure 3-32: Paroxetine - Desipramine DDGI**

<br>
<br>

<a id="figure-3-33"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/023_section_paroxetine-desipramine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Desipramine_DDGI_30.png)

**Figure 3-33: Paroxetine - Desipramine DDGI**

<br>
<br>

<a id="figure-3-34"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/023_section_paroxetine-desipramine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Desipramine_DDGI_31.png)

**Figure 3-34: Paroxetine - Desipramine DDGI**

<br>
<br>

<a id="figure-3-35"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/023_section_paroxetine-desipramine-ddgi-timeprofile/comparison_time_profile_Paroxetine___Desipramine_DDI_32.png)

**Figure 3-35: Paroxetine - Desipramine DDI**

<br>
<br>

### 3.2.4 Paroxetine - Dextromethorphan DDGI<a id="paroxetine-dextromethorphan-ddgi-timeprofile"></a>

<a id="figure-3-36"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/024_section_paroxetine-dextromethorphan-ddgi-timeprofile/comparison_time_profile_Paroxetine___Dextromethorphan_DDGI_33.png)

**Figure 3-36: Paroxetine - Dextromethorphan DDGI**

<br>
<br>

<a id="figure-3-37"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/024_section_paroxetine-dextromethorphan-ddgi-timeprofile/comparison_time_profile_Paroxetine___Dextromethorphan_DDGI_34.png)

**Figure 3-37: Paroxetine - Dextromethorphan DDGI**

<br>
<br>

<a id="figure-3-38"></a>

![](images/014_section_ddgi-evaluations/020_section_ddgi-concentration-time-profiles/024_section_paroxetine-dextromethorphan-ddgi-timeprofile/comparison_time_profile_Paroxetine___Dextromethorphan_DDI_35.png)

**Figure 3-38: Paroxetine - Dextromethorphan DDI**

<br>
<br>

# 4 Conclusion<a id="conclusion"></a>

The CYP2D6 DDGI network was qualified against clinical DD(G)I data for AUC and Cmax ratios across the selected perpetrator and victim combinations. In the current qualification run, the aggregate GMFE was 1.40 for AUC ratios and 1.38 for Cmax ratios. Most predictions were within two-fold of the observed values, with 86.32% of AUC ratios and 87.07% of Cmax ratios meeting this criterion.

The stricter limits proposed by Guest et al. were met by 57.26% of AUC ratios and 55.17% of Cmax ratios. The network therefore supports the intended use of the OSP Suite for CYP2D6-mediated DDI and DDGI simulations within the evaluated scenarios, while the remaining deviations indicate that model performance should be interpreted together with the underlying interaction mechanism, genotype group, victim drug, perpetrator drug, and analyte.

This qualification does not replace compound-specific model evaluation. New use cases should remain within the mechanistic and clinical-data domain covered by the qualified network or should be supported by additional verification.

# 5 References<a id="references"></a>

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

**Leemann 1993** T. D. Leemann, K. P. Devi, and P. Dayer. Similar effect of oxidation deficiency (debrisoquine polymorphism) and quinidine on the apparent volume of distribution of (+/-)-metoprolol. European journal of clinical pharmacology, 45(1):65–71, 1993. doi: 10.1007/BF00315352.

**Mahatthanatrakul 2007** W. Mahatthanatrakul, T. Nontaput, W. Ridtitid, M. Wongnawa, and M. Sunbhanich. Rifampin, a cytochrome P4503A inducer, decreases plasma concentrations of antipsychotic risperidone in healthy volunteers. Journal of clinical pharmacy and therapeutics, 32(2):161–7, 2007. doi: 10.1111/j.1365-2710.2007.00811.x.

**Mahatthanatrakul 2012** W. Mahatthanatrakul, S. Sriwiriyajan, W. Ridtitid, J. Boonleang, M. Wongnawa, N. Rujimamahasan, and W. Pipatrattanaseree. Effect of cytochrome P450 3A4 inhibitor ketoconazole on risperidone pharmacokinetics in healthy volunteers. Journal of clinical pharmacy and therapeutics, 37(2):221–5, 2012. doi: 10.1111/j.1365-2710.2011.01271.x.

**Mürdter 2016** T. Mürdter. Impact of CYP2D6 genotype and co-medication with paroxetine and clarithromycin on clomiphene metabolism in vivo. Abstracts of the 82nd Annual Meeting of the German Society for Experimental and Clinical Pharmacology and Toxicology (DGPT) in Naunyn- Schmiedeberg’s Archives of Pharmacology, 2016.

**Nakagami 2005** T. Nakagami, N. Yasui-Furukori, M. Saito, T. Tateishi, and S. Kaneo. Effect of verapamil on pharmacokinetics and pharmacodynamics of risperidone: in vivo evidence of involvement of P-glycoprotein in risperidone disposition. Clinical pharmacology and therapeutics, 78(1):43–51, 2005. doi: 10.1016/j.clpt.2005.03.009.

**Nichols 2009** A. I. Nichols, P. Fatato, M. Shenouda, J. Paul, J. A. Isler, R. D. Pedersen, Q. Jiang, S. Ahmed, and A. Patroneva. The effects of desvenlafaxine and paroxetine on the pharmacokinetics of the cytochrome P450 2D6 substrate desipramine in healthy adults. Journal of clinical pharmacology, 49(2):219–28, 2009. doi: 10.1177/0091270008326716.

**Ochs 1981** H. R. Ochs, G. Bodem, and D. J. Greenblatt. Impairment of digoxin clearance by coadministration of quinidine. Journal of clinical pharmacology, 21(10):396–400, 1981. doi: 10.1002/j.1552-4604.1981.tb01739.x.

**Parker 2011** R. B. Parker and J. E. Soberman. Effects of paroxetine on the pharmacokinetics and pharmacodynamics of immediate-release and extended-release metoprolol. Pharmacotherapy, 31(7):630–41, 2011. doi: 10.1592/phco.31.7.630.

**Reese 2008** M. J. Reese, R. M. Wurm, K. T. Muir, G. T. Generaux, L. St John-Williams, and D. J. McConn. An in vitro mechanistic study to elucidate the desipramine/bupropion clinical drug-drug interaction. Drug metabolism and disposition: the biological fate of chemicals, 36(7):1198–201, 2008. doi: 10.1124/dmd.107.020198.

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

# 6 Appendix<a id="appendix"></a>

## 6.1 Open Systems Pharmacology Suite (OSPS) Introduction<a id="osp-introduction"></a>

The Open Systems Pharmacology Suite provides a software environment for whole-body physiologically based pharmacokinetic modeling and simulation. The suite includes PK-Sim for model building and population simulation, MoBi for detailed model extension, and supporting R packages for qualification and reporting workflows.

Models are composed of physiological system information, compound-specific parameters, formulations, administration protocols, and observed data. Simulations can be combined with observed clinical data to evaluate whether model predictions are adequate for a defined context of use.

The qualification workflow uses versioned model snapshots and a machine-readable qualification plan to support reproducibility. The report generated from the plan documents the simulations, observed data comparisons, and summary performance metrics used to evaluate the intended use.

## 6.2 Mathematical Implementation of Drug-Drug Interactions<a id="mathematical-implementation-of-ddi"></a>

Drug-drug interaction simulations in the OSP Suite are represented through mechanistic changes in drug disposition processes. Depending on the compound and interaction scenario, these processes can include reversible enzyme inhibition, time-dependent inactivation, induction, transporter inhibition, transporter induction, or changes in multiple pathways.

For CYP2D6 DDGI scenarios, genotype-dependent activity is represented through phenotype-specific or activity-score-specific model settings where supported by the source model. The resulting simulations compare the victim-drug exposure with and without the perpetrator under the clinical dosing schedule. AUC and Cmax ratios are then calculated from matched control and interaction simulations.

The qualification plots compare predicted and observed exposure ratios. Performance is summarized using predicted versus observed plots, predicted/observed residual plots, geometric mean fold error, two-fold limits, and the limits proposed for ratio endpoints by Guest et al.

## 6.3 Automatic (re)-qualification workflow<a id="automatic-requalification-workflow"></a>

The requalification workflow is driven by the qualification plan. The plan defines the model snapshots, simulations, observed datasets, output paths, comparison windows, figures, tables, and report sections.

The workflow loads the referenced model snapshots, runs the required simulations, calculates exposure ratios and concentration-time profile comparisons, and writes a report-ready output folder. The generated report should be reviewed for scientific consistency, expected model versions, complete figures, correct study metadata, and warnings from the simulation or reporting logs.

Before publication, the final report should be regenerated from a clean environment using the intended OSP Suite and qualification framework versions. The output should be checked against the committed qualification plan and the exact model snapshot releases used for qualification.

# 7 Glossary<a id="glossary"></a>

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

