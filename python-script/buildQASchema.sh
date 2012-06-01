#!/bin/bash

MYSQL=.mysql_set

if [ -f ${MYSQL} ]
then
    source ${MYSQL}
fi

if [ -z $MYSQL_HOST ]
then
   MYSQL_HOST=10.3.213.144
   HBASE_HOST=10.3.213.149
fi

source baseScript.sh

function main()
{
    cleanup
	
	./sync_schema.sh
	
	getHBaseTable  ${HBASE_HOST}
	getTableTobeIndexed 
	
	retrieveSchema $(cat ${INDEX_LIST} )

	makeSchemaXml
    modifySchema
    copyToDeploy DEV
}


main $*

