-- ##################################
-- ###### Create Otis Database ######
-- ##################################



-- Triggers
     Create Trigger events_update_trigger 
          After Update On events_ 
          Begin
               Insert Into trigger_log ( new_variable, old_variable)