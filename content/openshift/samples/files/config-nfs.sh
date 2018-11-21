#!/usr/bin/sh

export_dir="/var/export/data/mysqlvol"
export_file="/etc/exports.d/mysqlvol.exports"

if [ -d ${export_dir} ]; then
  echo "Export directory ${export_dir} already exist."
else
  mkdir -p ${export_dir}
  chown nfsnobody:nfsnobody ${export_dir}
  chmod 700 ${export_dir}
  echo "Export directory ${export_dir} created."
fi

if [ -d ${export_file} ]; then
  echo "Export file ${export_file} already exist."
else
  echo "${export_dir} *(rw,async,all_squash)" > ${export_file}
  exportfs -a
fi

