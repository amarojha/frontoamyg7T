#! /bin/bash
# usage: ./extract_amyg_subcort_vol.sh
# purpose: this script pulls FreeSurfer output data to populate csv files with subcortical gray matter volumes (in mm^3)
# author: Amar Ojha
# date: 10/04/2022

cd /Volumes/Hera/preproc/7TBrainMech_rest/FS7.2/highres/

echo "SubjID,L.LatNuc,L.BasalNuc,L.AccBasalNuc,L.AAA,L.CN,L.MedNuc,L.CortNuc,L.CAT,L.PL,L.amyg" > Lamygvol.csv

for subj_id in `ls -d *_*`; do
	printf "%s,"  "${subj_id}" >> Lamygvol.csv
	for x in Lateral-nucleus Basal-nucleus Accessory-Basal-nucleus Anterior-amygdaloid-area-AAA Central-nucleus Medial-nucleus Cortical-nucleus Corticoamygdaloid-transitio Paralaminar-nucleus Whole_amygdala; do
		printf "%g," `grep  ${x} ${subj_id}/stats/amygdalar-nuclei.lh.T1.v21.stats | awk '{print $4}'` >> Lamygvol.csv
	done
	echo "" >> Lamygvol.csv
done

echo "SubjID,R.LatNuc,R.BasalNuc,R.AccBasalNuc,R.AAA,R.CN,R.MedNuc,R.CortNuc,R.CAT,R.PL,R.amyg" > Ramygvol.csv
for subj_id in `ls -d *_*`; do
	printf "%s,"  "${subj_id}" >> Ramygvol.csv
	for x in Lateral-nucleus Basal-nucleus Accessory-Basal-nucleus Anterior-amygdaloid-area-AAA Central-nucleus Medial-nucleus Cortical-nucleus Corticoamygdaloid-transitio Paralaminar-nucleus Whole_amygdala; do
		printf "%g," `grep  ${x} ${subj_id}/stats/amygdalar-nuclei.rh.T1.v21.stats | awk '{print $4}'` >> Ramygvol.csv
	done
	echo "" >> Ramygvol.csv
done