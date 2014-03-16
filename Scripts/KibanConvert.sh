#!/bin/sh
# Convert.sh

datadir=../Data/
outdir=../Converted/
ftype=BldA

for file in `ls ${datadir}FG-JPS-?????-${ftype}*.xml | awk -F / '{print $3}' | awk -F . '{print $1}'`
do
  xml=${file}.xml
  shp=${outdir}${file}.shp
  ogr2ogr -overwrite -f "ESRI Shapefile" ${shp} ${xml}
  echo Finish Converting ${file}
done
