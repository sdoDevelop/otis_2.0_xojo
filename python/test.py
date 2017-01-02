import sys
import otis_sync_mobile as osm



json_change =  '''
{"Fields":{"pkid":291,"name_first":"Sean","name_last":"O'Connell","address_city":"Rochester"},"StatementType":"Insert","TableName":"tbl_contacts"}
'''

oReturn = osm.RunSync(json_change,3456)

print oReturn