#!/bin/sh

/app/scripts/waitForElastic.sh
if [ -z $ELASTIC_URL ]; then
    ELASTIC_URL=elasticSearch:9200
fi
cd /app/templates/

for template in *.template.json
do
  templateName=$(echo ${template} | awk -F . '{print $1F}')
  echo "Deleting Template : ${templateName}"
  curl -XDELETE --output /dev/null --silent --head $ELASTIC_URL/_template/${templateName}

  echo "Installing Template : ${templateName}"
  echo "curl -XPOST --header \"Content-Type: application/json\" $ELASTIC_URL/_template/${templateName} -d @${template}"
  curl -XPOST --header "Content-Type: application/json" $ELASTIC_URL/_template/${templateName} -d @${template}
done
