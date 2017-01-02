import json
import psycopg2

placeholder = '?'

# Extract JSON into variables
json_change = {}
json_change = json.loads('{"Fields":{"pkid":1,"row_created":null,"row_modified":null,"row_username":"","fkconven":"","name_first":"FUCK","name_last":"","job_title":"","contact_company":"","contact_email":"","phone_number":"","address_line1":"","address_line2":"","address_city":"","address_state":"","address_zip":"","address_country":""},"StatementType":"Delete","TableName":"tbl_contacts"}')
json_field_val = json_change['Fields']
table_name = json_change['TableName']
statement_type = json_change['StatementType']
fields = json_field_val.keys()
values = json_field_val.values()
oPKID = json_field_val['pkid']
#print 'JSON Field:Values = ' + json.dumps(json_field_val)
#print 'Table Name = ' + table_name
#print 'Statement Type = ' + statement_type
#print '--------'
#print 'Fields = ' + json.dumps(fields)
#print 'Values = ' + json.dumps(values)

# Work on constructing the statment
sql_statement = ''
if statement_type == 'Insert':

    # Get the fields and placeholders in string form to put in the statement
    field_string = ','.join(fields)
    placeholder_list = []
    for i in fields:
        placeholder_list.append(placeholder)
    placeholders = ','.join(placeholder_list)

    # Construct the sql
    sql_statement = 'Insert Into ' + table_name + '(' + field_string + ')' + ' Values(' + placeholders + ');'

elif statement_type == 'Update':

    # Get the fields and placeholders in string form to put in the statement
    update_pair = []
    for field in json_field_val:
        update_pair.append(field + ' = ' + placeholder)
    update_pair_string = ','.join(update_pair)

    # Add the pkid to the end of the values list for the condition value
    values.append(json_field_val['pkid'])

    # Construct the sql
    sql_statement = 'Update ' + table_name + ' Set ' + update_pair_string + ' Where pkid = ' + placeholder + ';'

elif statement_type == 'Delete':

    # Get rid of all the values and just put the pkid for the condition value
    values = [json_field_val['pkid']]

    # Construct the sql
    sql_statement = 'Delete From ' + table_name + ' Where pkid = ' + placeholder + ';'

#print 'SQL = ' + sql_statement
#print 'Values = ' + json.dumps(values)



final_json = {}
final_json['Statement'] = sql_statement
final_json['Values'] = values
print json.dumps(final_json)