import json
# get_table_count_modifieddate

# Get all the names of tables that contain our data
sql = "Select table_name From information_schema.tables Where table_schema = 'public'"
table_names = plpy.execute(sql)
database_info = {}

# loop through each table
for table_dict in table_names:
	# get the current table name
	table = table_dict['table_name']

	# grab the data for the table
	sql = "Select count(pkid), max(row_modified) From " + table
	rv = plpy.execute(sql)

	for oRow in rv:
		TableCount = rv["count"]
		ModifiedDate = rv["max"]

		table_info = {"RecordCount" : TableCount, "ModifiedDate" : ModifiedDate}
		database_info[table] = table_info

return json.dumps(database_info)