# sync_with_client

# this will be a function stored on the server
# clients will call it feeding it the log of sql that they created offline

sql_log = ""
# parameters: ( sql_log as text )


sql_log_list = []


# we need to split the sql that has been provided for us
sql_log_list = sql_log.split(",")



