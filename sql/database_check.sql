Select
    pkid                ,
    row_created         ,
    row_modified        ,
    row_username        ,
    event_name          ,
    start_time          ,
    end_time            ,
    loadin_time         ,
    loadout_time        ,
    start_date          ,
    end_date            ,
    loadin_date         ,
    loadout_date        ,
    event_details       ,
    account_manager     ,
    event_tags          ,
    hide                
    From tbl_events
    ;

Select
    pkid                ,
    row_created         ,
    row_modified        ,
    row_username        ,
    fkevents_parent     ,
    fkevents_child      
    From tbl_events_link
    ;

-- lineitems_
Select
    pkid                        ,
    row_created                 ,
    row_modified                ,
    row_username                ,
    fkeipl                      ,
    fkinventory                 ,
    li_name                     ,
    li_manufacturer             ,
    li_model                    ,
    li_department               ,
    li_category                 ,
    li_subcategory              ,
    li_description              , 
    li_type                     ,
    li_price                    ,
    li_rate                     ,
    li_discount                 ,
    li_time                     ,
    li_taxable                  ,
    li_quantity                 
    From tbl_lineitems
    ;


-- inventory
Select 
    pkid                        ,
    row_created                 ,
    row_modified                ,
    row_username                ,
    item_name                   ,
    item_manufacturer           ,
    item_model                  ,
    item_department             ,
    item_category               ,
    item_subcategory            ,
    item_description            ,
    item_status                 ,
    item_quantity               ,
    item_purchase_price         ,
    item_sale_price             ,
    item_rental_price           ,
    item_owner                  ,
    item_taxable                ,
    item_weight                 ,
    item_height                 ,
    item_depth                  ,
    item_width                  ,
    item_barcode                ,
    item_rfid_code              ,
    item_serial_code            ,
    item_type                   ,
    physical_item               ,
    hide                        
    From tbl_inventory
    ;

-- firmware
Select
    pkid                        ,
    row_created                 ,
    row_modified                ,
    row_username                ,
    fk_inventory                ,
    update_date                 ,
    firmware_version            ,
    update_comments             
    From tbl_firmware
    ;

-- Maintenance Logs
Select
    pkid                        ,
    row_created                 ,
    row_modified                ,
    row_username                ,
    fkinventory                 ,
    entry_date                  ,
    exit_date                   ,
    due_date                    ,
    work_cost                   ,
    work_summary                ,
    work_description            ,
    work_comments               ,
    work_type                   ,
    work_done_by                
    From tbl_maintenance_Logs
    ;

-- eipl_
Select 
    pkid                        ,
    row_created                 ,
    row_modified                ,
    row_username                ,
    fkevents                    ,
    eipl_number                 ,
    eipl_name                   ,
    due_date                    ,
    eipl_type                   ,
    discount                    ,
    shipping_method             ,
    eipl_tax_rate               
    From tbl_eipl
    ;

-- contactables
Select 
    pkid                        ,
    row_created                 ,
    row_modified                ,
    row_username                ,
    indv_bus_ven                ,
    type                        ,
    name_first                  ,
    name_last                   ,
    job_title                   ,
    company                     ,
    address_line1               ,
    address_line2               ,
    address_city                ,
    address_state               ,
    address_zip                 ,
    address_country             ,
    hide                        
    From tbl_contactables
    ;

Select 
    pkid                        ,
    row_created                 ,
    row_modified                ,
    row_username                ,
    fkcontactables              ,
    method                      ,
    method_type                 ,
    method_location             ,
    primary_method              ,
    hide                        
    From tbl_contact_methods
    ;

Select
    pkid                        ,
    row_created                 ,
    row_modified                ,
    row_username                ,
    fk_parent                   ,
    fk_child                    ,
    quantity                    ,
    fk_table_name               ,
    link_type                   
    From tbl_internal_linking
    ;

Select
    pkid                        ,
    row_created                 ,
    row_modified                ,
    row_username                ,
    fk_parent                   ,
    fk_child                    ,
    parent_table                
    From tbl_contactable_linking
    ;

Select
    pkid                        ,
    row_created                 ,
    row_modified                ,
    row_username                ,
    fkeipl                      ,
    group_name                  ,
    group_discount              
    From tbl_group_discounts
    ;
