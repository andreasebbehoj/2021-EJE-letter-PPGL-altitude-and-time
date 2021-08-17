# 2021-EJE-letter-PPGL-altitude-and-time
This project contains the analysis for the letter to editor regarding the incidence of PPGL and altitude in the European Journal of Endocrinology.

## About this repository
The purpose of this repository is to provide transparency about the analysis and allow other researchers to critically evaluate our analysis and allow other researchers to run their own experiments.

Notes:
- The code was written in Stata Statistical Software version 16.1
- The whole code is run from the 0_master do-file
- The Input folder contains study meta-data from the previous PPGL incidence papers in an Excel file.
- The 2_DataExtraction.do contains year-by-year incidence rates for each paper
- The Output folder contains log file, combined study data in excel format, and the resulting figures in PDF format

## Inclusion criteria
We included all papers presenting the incidence of PPGL in a defined geographic location.
We excluded papers which only focused on a specific patient subgroup (e.g. malignant PPGL or PPGL in autopsies, adrenal incidentalomas, vHL patients, etc.)

## Search strategy
We searched Pubmed for all papers:
1.	Including at least one term for PPGL
2.	AND at least one outcome (incidence or epidemiology)
3.	NOT of an irrelevant study type (case-reports, PC12 cell lines, etc.)

Search string:
("Paraganglioma"[Mesh] OR "Pheochromocytoma"[Mesh] OR "Paraganglioma*"[Tiab] OR "Pheochromocytoma*"[Tiab])

AND ("Epidemiology"[Mesh] OR "Epidemiology" [Subheading] OR "Epidemiologic Studies"[Mesh] OR “Incidence”[tiab] OR “Incidence-rate”[tiab])

NOT ("case reports"[Publication Type] OR "guideline"[Publication Type] OR "review"[Publication Type] OR "case-report"[Title] OR “PC12”[Tiab] OR “PC-12”[Tiab] OR “animal-model”[Tiab] OR “cell-model”[Tiab])

The search was conducted on Aug 17, 2021 and resulted in 2798 references. One reviewer (AE) screened all references and included 14 papers. One study was excluded from the analysis (Andersen 1988) since its' study population overlapped with a more recent study (Ebbehoj 2021).
