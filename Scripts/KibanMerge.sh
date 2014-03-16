#!/bin/sh
# KibanMerge.sh

datadir=../Data/
outdir=../Converted/
ftype=BldA

for code in `ls ${datadir}FG-JPS-?????-${ftype}*.xml | awk -F - '{print $3}' | sort | uniq`
do
  if [ -e ${outdir}FG-JPS-${code}-*-001/*.shp]; then
    shp=${outdir}${code}.Kiban.Merge
    cp ${outdir}FG-JPS-${code}*/* .
    n=`ls ${outdir}FG-HPS-${code}*/*.shp | wc -l`
    if test ${n} -gt 1; then
      for f in `ks FG-JPS-${code}-*-0001.* | awk -F . '{print $2}'`
      do
        cp FG-JPS-${code}-*-0001.${f} dummy.${f}
      done
      a=2
      while [ ${a} -le ${n} ]
      do
        p=`expr ${a} | awk '{printf "%04d", $1}'`
        ogr2ogr -overwrite -update -append FG-JPS-${code}-*-${p}.shp dummy.shp -nln merge.shp
        for f in `ls merge.* | awk -F '{print $2}'`
        do
          mv merge.${f} dummy.${f}
        done
        a=` expr ${a} + 1 `
      done
      for f in `ls dummy.* | awk -F . '{print $2}'`
      do
        mv dummy.${f} ${shp}.${f}
      done
        rm FG-JPS*
      elif test ${n} -eq 1; then
        for f in `ls FG-JPS-${code}*.* | awk -F .'{print $2}'`
        do
          mv FG-JPS-${code}*.${f} ${shp}.${f}
        done
    fi
  else
    echo no
  fi
done
